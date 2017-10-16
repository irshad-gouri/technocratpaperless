using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SalesAppBLL.Repository;
using SalesAppBLL;
using SalesAppDLL;
using SalesAppDLL.CustomModels;

namespace SalesApp.Api
{
    [RoutePrefix("api/place")]
    public class PlacesController : ApiController
    {
        private readonly PlacesRepository _placeRepo = new PlacesRepository();

        [HttpPost, Route("addplace")]
        public ResponseData AddPlaces(PlacesDetail place)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.AddPlace(place);
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
            catch (Exception exception)
            {
                data.Data = null;
                data.Status = "FAIL";
                data.Error = exception.Message;
                data.ErrorCode = "";
                return data;
            }

        }

        [HttpGet, Route("showallplaces")]
        public ResponseData ShowAllPlaces(int userId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.ShowAllPlaces(userId);
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

        [HttpGet, Route("getplacebyid")]
        public ResponseData GetPlaceById(int placeId)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetPlaceById(placeId);
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

        [HttpPost, Route("addcustomeforms")]
        public ResponseData AddCustomForms(CustomFormsDetails customFormDetails)
        {

            ResponseData data = new ResponseData();
            try
            {
                // TODO:Check validation.
                if (customFormDetails == null)
                {
                    data.Data = "Invalid json details!";
                    data.Status = "Fail";
                    data.Error = "";
                }

                var lst = _placeRepo.AddCustomForms(customFormDetails);
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

        [HttpGet, Route("getquestionsbyformsid")]
        public ResponseData GetQuestionsByFormsId(int formId)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetQuestionsByFormsId(formId);
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

        [HttpPost, Route("addanswerbyquestionid")]
        public ResponseData AddAnswerByQuestionId(List<FormsAnswer> formAns)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.AddAnswerByQuestionId(formAns);
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

        [HttpPost, Route("addusersactivities")]
        public ResponseData AddUsersActivities(UsersActivity userAct)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.AddUsersActivities(userAct);
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

        [HttpGet, Route("getusersactivitiesbyuserid")]
        public ResponseData GetUsersActivitiesByUserId(int userId)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetUsersActivitiesByUserId(userId);
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

        [HttpGet, Route("getusersactivitiesbyplaceid")]
        public ResponseData GetUsersActivitiesByPlaceId(int placeId)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetUsersActivitiesByPlaceId(placeId);
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

        [HttpGet, Route("getusersactivitiesbyactivitytypeid")]
        public ResponseData GetUsersActivitiesByActivityTypeId(int activityId)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetUsersActivitiesByActivityTypeId(activityId);
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

        [HttpPost, Route("adduseractivitycomments")]
        public ResponseData AddUserActivityComments(AddUserActivityComments userActComments)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.AddUserActivityComments(userActComments);
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

        [HttpGet, Route("getusersactivitiesfordashboard")]
        public ResponseData GetUsersActivitiesForDashBoard(int userId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetUsersActivitiesForDashBoard(userId);
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

        [HttpGet, Route("getsactivitiesbyplaceidanduserid")]
        public ResponseData GetUsersActivitiesForDashBoardByPlaceIdAndUserId(int userId, int placeId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetUsersActivitiesForDashBoardByPlaceIdAndUserId(userId, placeId);
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

        [HttpGet, Route("getusersactivitiescommentsbyactivityid")]
        public ResponseData GetUsersActivitiesCommentsByActivityId(int actId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetUsersActivitiesCommentsByActivityId(actId);
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

        [HttpPost, Route("addnotesactivities")]
        public ResponseData AddNotesActivities(AddNotesActivities userActNotes)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.AddNotesActivities(userActNotes);
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

        [HttpPost, Route("addphotoctivities")]
        public ResponseData AddPhotoctivities(AddPhotoActivities userActPhoto)
        {

            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.AddPhotoctivities(userActPhoto);
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

        [HttpGet, Route("getassignedplacesbyuserid")]
        public ResponseData GetAssignedPlacesByUserId(int userId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetAssignedPlacesByUserId(userId);
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
