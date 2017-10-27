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
    [RoutePrefix("api/customforms")]
    public class CustomeFormsController : ApiController
    {
        //TODO: Class level declaration.
        private readonly CustomeFormsRepository _placeRepo = new CustomeFormsRepository();

        [HttpGet, Route("getallcustomformsbyid")]
        public ResponseData GetAllCustomFormsById(int userId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetAllCustomFormsById(userId);
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

        [HttpGet, Route("getallcustomformsbyadmindashbordid")]
        public ResponseData GetAllCustomFormsByIdAdminDashboard(int userId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetAllCustomFormsByIdAdminDashboard(userId);
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

        [HttpGet, Route("getallformsanswerbyuseridplaceidformidandcreateddate")]
        public ResponseData GetAllFormsAnswerByUserIdPlaceIdFormIdAndCreatedDate(int UserId, int PlaceId,int FormId, DateTime createdDate)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetAllFormsAnswerByUserIdPlaceIdFormIdAndCreatedDate(UserId, PlaceId,FormId, createdDate);
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

        [HttpGet, Route("getformdetailsbyformid")]
        public ResponseData GetFormDetailsByFormId(int formId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetFormDetailsByFormIdRepo(formId);
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

        [HttpPost, Route("updatequestionanswers")]
        public ResponseData UpdateQuestionAnsers(List<FormsAnswer> formAns)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.UpdateQuestionAnsersRepo(formAns);
                if (lst)
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