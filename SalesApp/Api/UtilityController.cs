using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SalesAppBLL.Repository;
using SalesAppBLL;
using SalesAppDLL;
using System.Threading.Tasks;
using System.Web;
using SalesAppBLL.Models;

namespace SalesApp.Api
{
    [RoutePrefix("api/utility")]
    public class UtilityController : ApiController
    {
        [Route("uploadimage")]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> UploadImage()
        {
            Dictionary<string, object> dict = new Dictionary<string, object>();
            try
            {

                var httpRequest = HttpContext.Current.Request;
                string fileName = "";
                string timeStampName = "";
                foreach (string file in httpRequest.Files)
                {
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created);

                    var postedFile = httpRequest.Files[file];
                    if (postedFile != null && postedFile.ContentLength > 0)
                    {

                        int MaxContentLength = 1024 * 1024 * 3; //Size = 1 MB  

                        IList<string> AllowedFileExtensions = new List<string> { ".jpg", ".gif", ".png" };
                        var ext = postedFile.FileName.Substring(postedFile.FileName.LastIndexOf('.'));
                        var extension = ext.ToLower();
                        if (!AllowedFileExtensions.Contains(extension))
                        {

                            var message = string.Format("Please Upload image of type .jpg,.gif,.png.");

                            dict.Add("error", message);
                            return Request.CreateResponse(HttpStatusCode.BadRequest, dict);
                        }
                        else if (postedFile.ContentLength > MaxContentLength)
                        {

                            var message = string.Format("Please Upload a file upto 1 mb.");

                            dict.Add("error", message);
                            return Request.CreateResponse(HttpStatusCode.BadRequest, dict);
                        }
                        else
                        {

                             fileName = postedFile.FileName;
                             timeStampName =  System.DateTime.Now.ToString("yyyyMMddHHmmssffff") + "_" + fileName;
                            var filePath = HttpContext.Current.Server.MapPath("~/Public/" + timeStampName);

                            postedFile.SaveAs(filePath);

                        }
                    }

                  //  var message1 = string.Format("{");
                  return  Request.CreateResponse(HttpStatusCode.Created, new ResponseData { Data = new UploadImageResponse { path = "Public/" + timeStampName }, Message="SUCCESS", Status="SUCCESS"  });
                  //  return Request.CreateResponse(HttpStatusCode.Created, message1); ;
                }
                var res = string.Format("Please Upload a image.");
                dict.Add("error", res);
                return Request.CreateResponse(HttpStatusCode.NotFound, dict);
            }
            catch (Exception ex)
            {
                var res = string.Format("some Message");
                dict.Add("error", res);
                return Request.CreateResponse(HttpStatusCode.NotFound, dict);
            }
        }
    }
}
