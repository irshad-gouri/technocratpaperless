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
    [RoutePrefix("api/representative")]
    public class RepresentativeController : ApiController
    {
        //TODO: Class level declaration.
        private readonly RepresentativeRepository _placeRepo = new RepresentativeRepository();

        [HttpGet, Route("getallrepresentativebycreatedbyid")]
        public ResponseData GetAllRepresentativeByCreatedById(int userId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.GetAllRepresentativeByCreatedById(userId);
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


        [HttpPost, Route("updaterepresentative")]
        public ResponseData UpdateRepresentative(User represen)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _placeRepo.UpdateRepresentative(represen);
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