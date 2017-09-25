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
    }
}
