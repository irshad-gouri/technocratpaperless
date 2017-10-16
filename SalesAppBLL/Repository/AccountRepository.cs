using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppDLL;


namespace SalesAppBLL.Repository
{
   public class AccountRepository: Repository<User>
    {
       public User LoginUser(User log)
        {
            try
            {
                var lst = Query(i => i.Password == log.Password && i.UserName == log.UserName && i.RoleId==log.RoleId).FirstOrDefault();
               
                return lst;
            }
            catch(Exception ex)
            {
                Utility.SendEmail("error in login user", ex.Message, "sachin.patidar4@gmail.com");
                LogHandler.SaveLogInfo(ex.Message, "Login", 0);
                return null;
            }
          
        }

        public bool ForgotPassword(string email)
        {
            try
            {
                User obj = Get(x => x.UserName == email).FirstOrDefault();
                if (obj != null)
                {
                    try
                    {
                        string msg = "<h1>Hello your password is" + obj.Password + "</h1>";

                        Utility.SendEmail("Forgot Password", msg, email);
                        return true;
                    }
                    catch (Exception ex)
                    {
                        Utility.SendEmail("error in forgotpassword user", ex.Message, "sachin.patidar4@gmail.com");
                        LogHandler.SaveLogInfo(ex.Message, "ForgotPassword", 0);
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Utility.SendEmail("error in Forgotpassword user", ex.Message, "sachin.patidar4@gmail.com");
                LogHandler.SaveLogInfo(ex.Message, "ForgotPassword", 0);
                return false;
            }
        }

        public string RegisterUser(User reg)
        {
            try
            {
                reg.UserName = reg.Email;
                var lst=Get(i => (i.Email == reg.Email || i.UserName == reg.UserName) && i.Password == reg.Password).ToList();
                if (lst.Any())
                {
                    return "User already registered with this mail id";
                }
                Add(reg);
                return "User successfully registered";
            }
            catch(Exception ex)
            {
                Utility.SendEmail("error in register user", ex.Message, "sachin.patidar4@gmail.com");
                LogHandler.SaveLogInfo(ex.Message, "Registration", 0);
                return "Registration failed";
            }
        }

        public bool UpdateUserDetails(User user)
        {
            try
            {
                var userSearch = DbContext.Users.Where(i => i.Id == user.Id).FirstOrDefault();
                userSearch.PhotoUrl = user.PhotoUrl;
                DbContext.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        public User GetUserDetail(int userId)
        {
            try
            {
              var detail=  Get(i => i.Id.Equals(userId)).FirstOrDefault();
                return detail;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
