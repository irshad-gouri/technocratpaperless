using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppDLL;
using SalesAppDLL.CustomModels;

namespace SalesAppBLL.Repository
{
   public class AccountRepository: Repository<User>
    {
       public User LoginUser(User log)
        {
            try
            {
                var lst = Query(i => i.Password == log.Password && (i.UserName == log.UserName||i.Email==log.UserName) && i.RoleId==log.RoleId).FirstOrDefault();
               
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
                if (reg.UserName == null)
                {
                    reg.UserName = reg.Email;
                }
                
                var lst=Get(i => (i.Email == reg.Email || i.UserName == reg.UserName) && i.Password == reg.Password).ToList();
                if (lst.Any())
                {
                    return "User already registered with this mail id";
                }
                var user=DbContext.Users.Add(reg);
                DbContext.SaveChanges();
                return "User successfully registered with id :"+user.Id;
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

        public UserDetails GetUserDetail(int userId)
        {
            try
            {
                //var detail=  Get(i => i.Id.Equals(userId)).FirstOrDefault();
                var detail = DbContext.Users.Where(i => i.Id.Equals(userId)).Join(DbContext.CompanyDetails, usr => usr.CompanyId,
                    compDet => compDet.Id, (usr, comp) => new UserDetails
                    {
                        Address = usr.Address,
                        City = usr.City,
                        CompanyAddress = comp.Address,
                        CompanyId = comp.Id,
                        CompanyName = comp.CompanyName,
                        Country = usr.Country,
                        CreatedById = usr.CreatedById,
                        Email = usr.Email,
                        FirstName = usr.FirstName,
                        IsActive = usr.IsActive,
                        Language = usr.Language,
                        LastName = usr.LastName,
                        Note = usr.Note,
                        Phone = usr.Phone,
                        PhotoUrl = usr.PhotoUrl,
                        PostalCode = usr.PostalCode,
                        RegistrationNo = comp.RegistrationNo,
                        RoleId = usr.RoleId,
                        Teritory = usr.Teritory,
                        UserId = usr.Id,
                        UserName = usr.UserName,
                    }).FirstOrDefault();
                return detail;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
