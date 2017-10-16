using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SalesAppBLL.Repository;
using SalesAppBLL;
using SalesAppDLL;

namespace SalesApp.Api
{
    [RoutePrefix("api/account")]
    public class AccountController : ApiController
    {
        private readonly AccountRepository _accountRepo = new AccountRepository();

        // Methods
        [HttpGet, Route("forgotpassword")]
        public ResponseData ForgotPassword(string email)
        {
            try
            {
                ResponseData data = new ResponseData();
                try
                {
                    var lst = _accountRepo.ForgotPassword(email);
                    if (lst)
                    {

                        data.Status = "SUCCESS";
                        data.Error = "";
                        data.ErrorCode = "";
                        data.Message = "Your password has been sent to your registered email id.";
                    }
                    else
                    {
                        data.Data = "";
                        data.Message = "Wrong email id.";
                        data.Status = "FAIL";
                        data.Error = "";
                        data.ErrorCode = "";
                    }
                }
                catch (Exception exception)
                {
                    data.Status = "FAIL";
                    data.Error = exception.Message;
                    data.ErrorCode = "";
                }
                return data;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpPost, Route("login")]
        public ResponseData LoginUser(User log)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _accountRepo.LoginUser(log);
                if (lst != null)
                {
                    data.Data = lst;
                    data.Status = "SUCCESS";
                    data.Error = "";
                    data.ErrorCode = "";
                }
                else
                {
                    data.Data = "Invalid credentials";
                    data.Status = "FAIL";
                    data.Error = "";
                    data.ErrorCode = "";
                }
                return data;
            }
            catch (Exception exception)
            {
                data.Data = "";
                data.Status = "FAIL";
                data.Error = exception.Message;
                data.ErrorCode = "";
                return data;
            }
        }

        [HttpPost, Route("register")]
        public ResponseData RegisterUser(User reg)
        {
            ResponseData data = new ResponseData();
            try
            {
                string str = _accountRepo.RegisterUser(reg);
                data.Data = str;
                if (str == "User successfully registered")
                {
                    data.Status = "SUCCESS";
                }
                else
                {
                    data.Status = "FAIL";
                }
                data.Error = "";
                data.ErrorCode = "";
                return data;
            }
            catch (Exception exception)
            {
                data.Data = "";
                data.Status = "FAIL";
                data.Error = exception.Message;
                data.ErrorCode = "";
                return data;
            }
        }

        [HttpPut, Route("updateuserphoto")]
        public ResponseData UpdateUserPhoto(User user)
        {
            ResponseData data = new ResponseData();
            try
            {
                var status = _accountRepo.UpdateUserDetails(user);
                data.Data = status;
                if (status)
                {
                    data.Status = "SUCCESS";
                }
                else
                {
                    data.Status = "FAIL";
                }
                data.Error = "";
                data.ErrorCode = "";
                return data;
            }
            catch (Exception exception)
            {
                data.Data = "";
                data.Status = "FAIL";
                data.Error = exception.Message;
                data.ErrorCode = "";
                return data;
            }
        }

        [HttpGet, Route("getuserdetail")]
        public ResponseData GetUserDetailsById(int userId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _accountRepo.GetUserDetail(userId);
                if (lst != null)
                {
                    data.Data = lst;
                    data.Status = "SUCCESS";
                    data.Error = "";
                    data.ErrorCode = "";
                }
                else
                {
                    data.Data = null;
                    data.Status = "FAIL";
                    data.Error = "";
                    data.ErrorCode = "";
                }
                return data;
            }
            catch (Exception ex)
            {
                data.Data = "FAIL";
                data.Status = "FAIL";
                data.Error = ex.Message;
                data.ErrorCode = "";
                return data;
            }
        }
       
    }
}
