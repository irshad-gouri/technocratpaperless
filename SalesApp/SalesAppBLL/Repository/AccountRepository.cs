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
                var lst = Query(i => i.Password == log.Password && i.UserName == log.UserName).FirstOrDefault();
                return lst;
            }
            catch(Exception ex)
            {
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
                return "Registration failed";
            }
        }
    }
}
