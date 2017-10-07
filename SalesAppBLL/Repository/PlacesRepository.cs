using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppDLL;
using SalesAppDLL.CustomModels;
using SalesAppBLL.Models;

namespace SalesAppBLL.Repository
{
    public class PlacesRepository : Repository<PlacesDetail>
    {
        public PlaceDetailModel AddPlace(PlacesDetail det)
        {
            try
            {
                //det.Id is userid when adding place
                var check = DbContext.PlacesDetails.Where(i => i.PlaceId == det.PlaceId).FirstOrDefault();

                if (check != null)
                {
                    DbContext.UserAssignedPlaces.Add(new UserAssignedPlace { PlaceId = check.Id, UserId = det.Id });
                    DbContext.SaveChanges();
                    return new PlaceDetailModel
                    {
                        Address = check.Address,
                        Id = check.Id,
                        Country = check.Country,
                        CountryCode = check.CountryCode,
                        IsActive = check.IsActive,
                        Latitude = check.Latitude,
                        Longitude = check.Longitude,
                        Name = check.Name,
                        Note = check.Note,
                        PhotoUrl = check.PhotoUrl,
                        PlaceId = check.PlaceId,
                        PostalCode = check.PostalCode,
                        State = check.State,
                        Tags = check.Tags,
                        Website = check.Website
                    };
                }
                else
                {
                    var userId = det.Id;
                    var data = DbContext.PlacesDetails.Add(det);
                    DbContext.SaveChanges();
                    DbContext.UserAssignedPlaces.Add(new UserAssignedPlace { PlaceId = data.Id, UserId = userId });
                    DbContext.SaveChanges();
                    return new PlaceDetailModel
                    {
                        Address = data.Address,
                        Id = data.Id,
                        Country = data.Country,
                        CountryCode = data.CountryCode,
                        IsActive = data.IsActive,
                        Latitude = data.Latitude,
                        Longitude = data.Longitude,
                        Name = data.Name,
                        Note = data.Note,
                        PhotoUrl = data.PhotoUrl,
                        PlaceId = data.PlaceId,
                        PostalCode = data.PostalCode,
                        State = data.State,
                        Tags = data.Tags,
                        Website = data.Website
                    }; ;
                }
            }
            catch (System.Exception ex)
            {
                return null;
            }
        }

        public List<GetAllPlacesInfo_Result> ShowAllPlaces(int userId)
        {
            try
            {
                var lst = DbContext.GetAllPlacesInfo(userId).ToList();
                return lst;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public PlacesDetail GetPlaceById(int placeId)
        {
            try
            {
                var detail = DbContext.PlacesDetails.Where(i => i.Id == placeId).FirstOrDefault();
                return detail;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public AddCustomFormsResponse AddCustomForms(CustomFormsDetails customFormDetails)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (string.IsNullOrEmpty(customFormDetails.Title))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please fill forms title!";
                }
                else if (customFormDetails.FormsQuestionFieldDetail == null)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please enter atleast one question!";
                }
                else if (customFormDetails.FormsQuestionFieldDetail.Count == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please enter atleast one question!";
                }
                else
                {
                    // TODO: Add values in  CustomForm table.
                    CustomForm objCustForm = new CustomForm();
                    objCustForm.Title = customFormDetails.Title;
                    objCustForm.Description = customFormDetails.Description;
                    objCustForm.IsActive = customFormDetails.IsActive;
                    objCustForm.Tags = customFormDetails.Tags;
                    objCustForm.UserId = customFormDetails.UserId;
                    objCustForm.CreatedDate = System.DateTime.Now;
                    objCustForm.ModifiedDate = System.DateTime.Now;
                    // TODO: Perform on db
                    DbContext.CustomForms.Add(objCustForm);
                    DbContext.SaveChanges();

                    // TODO: Add questions list.
                    FormsQuestionField objFrmQueFld;
                    foreach (var item in customFormDetails.FormsQuestionFieldDetail)
                    {
                        objFrmQueFld = new FormsQuestionField();
                        objFrmQueFld.FormId = objCustForm.Id;
                        objFrmQueFld.Question = item.Question;
                        objFrmQueFld.IsMandatory = item.IsMandatory;
                        objFrmQueFld.InputFieldsId = item.InputFieldsId;
                        objFrmQueFld.ListOptions = item.ListOptions;
                        objFrmQueFld.CreatedDate = System.DateTime.Now;
                        objFrmQueFld.ModefiedDate = System.DateTime.Now;
                        // TODO: Perform on db
                        DbContext.FormsQuestionFields.Add(objFrmQueFld);
                        DbContext.SaveChanges();
                    }

                    if (customFormDetails.FormsVisibleOnTheseRepsDetail != null)
                    {
                        //TODO: Add FormsVisibleOnTheseReps list.
                        FormsVisibleOnTheseRep objfrmVisOnThsRep;
                        foreach (var item in customFormDetails.FormsVisibleOnTheseRepsDetail)
                        {
                            objfrmVisOnThsRep = new FormsVisibleOnTheseRep();
                            objfrmVisOnThsRep.UserId = item.UserId;
                            objfrmVisOnThsRep.CustomFormsId = objCustForm.Id;
                            // TODO: Perform on db
                            DbContext.FormsVisibleOnTheseReps.Add(objfrmVisOnThsRep);
                            DbContext.SaveChanges();
                        }
                    }

                    objResp.Status = "Success";
                    objResp.Message = "Custom Forms Details Successfully Saved!";
                }
            }
            catch (Exception ex)
            {
                objResp.Status = "Failed";
                objResp.Message = ex.Message;
            }
            return objResp;
        }

        public List<FormsQuestionFieldResponse> GetQuestionsByFormsId(int formId)
        {
            try
            {
                var checkExistingImg = (from adImg in DbContext.FormsQuestionFields
                                        join inputf in DbContext.InputFields on adImg.InputFieldsId equals inputf.Id
                                        where adImg.FormId == formId
                                        select new FormsQuestionFieldResponse { Id = adImg.Id, FormId = adImg.FormId, Question = adImg.Question, IsMandatory = adImg.IsMandatory, InputFieldsId = adImg.InputFieldsId, InputFieldName = inputf.FieldName, ListOptions = adImg.ListOptions }).ToList();
                return checkExistingImg;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public AddCustomFormsResponse AddAnswerByQuestionId(FormsAnswer formAns)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (formAns.PlaceId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Place Id Can't be blank!";
                }
                else if (formAns.UserId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "UserId Can't be blank!";
                }
                else if (formAns.FormsQuestionId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "QuestionId Can't be blank!";
                }
                else if (string.IsNullOrEmpty(formAns.Answer))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Answer Can't be blank!";
                }
                else
                {
                    // TODO: Perform on db
                    formAns.CreatedDate = System.DateTime.Now;
                    formAns.ModifiedDate = System.DateTime.Now;
                    DbContext.FormsAnswers.Add(formAns);
                    DbContext.SaveChanges();

                    objResp.Status = "Success";
                    objResp.Message = "Thanks for submit your answer!";
                }
            }
            catch (Exception ex)
            {
                objResp.Status = "Failed";
                objResp.Message = ex.Message;
            }
            return objResp;
        }

        public AddCustomFormsResponse AddUsersActivities(UsersActivity userAct)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (userAct.ActivityId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please select the activity type!";
                }
                else
                {
                    // TODO: Perform on db
                    DbContext.UsersActivities.Add(userAct);
                    DbContext.SaveChanges();

                    objResp.Status = "Success";
                    objResp.Message = "Activity submited successfully!";
                }
            }
            catch (Exception ex)
            {
                objResp.Status = "Failed";
                objResp.Message = ex.Message;
            }
            return objResp;
        }

        public object GetUsersActivitiesByUserId(int userId)
        {
            try
            {
                var getUserAct = (from userAct in DbContext.UsersActivities
                                  join actType in DbContext.ActivitiesTypes on userAct.ActivityId equals actType.Id
                                  join placeDtls in DbContext.PlacesDetails on userAct.PlaceId equals placeDtls.Id
                                  where userAct.UserId == userId
                                  select new { Id = userAct.ActivityId, ActivityName = actType.Type, UserId = userAct.UserId, PhotoUrl = userAct.PhotoUrl, Note = userAct.PhotoUrl, FormName = userAct.FormName, OrderCost = userAct.OrderCost, AuditItems = userAct.AuditItems, PlaceName = placeDtls.Name, PlaceIsActive = placeDtls.IsActive, PlaceAddress = placeDtls.Address }).ToList();
                return getUserAct;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public object GetUsersActivitiesByPlaceId(int placeId)
        {
            try
            {
                var getUserAct = (from userAct in DbContext.UsersActivities
                                  join actType in DbContext.ActivitiesTypes on userAct.ActivityId equals actType.Id
                                  join placeDtls in DbContext.PlacesDetails on userAct.PlaceId equals placeDtls.Id
                                  where userAct.PlaceId == placeId
                                  select new { Id = userAct.ActivityId, ActivityName = actType.Type, UserId = userAct.UserId, PhotoUrl = userAct.PhotoUrl, Note = userAct.PhotoUrl, FormName = userAct.FormName, OrderCost = userAct.OrderCost, AuditItems = userAct.AuditItems, PlaceName = placeDtls.Name, PlaceIsActive = placeDtls.IsActive, PlaceAddress = placeDtls.Address }).ToList();
                return getUserAct;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public object GetUsersActivitiesByActivityTypeId(int activityId)
        {
            try
            {
                var getUserAct = (from userAct in DbContext.UsersActivities
                                  join actType in DbContext.ActivitiesTypes on userAct.ActivityId equals actType.Id
                                  join placeDtls in DbContext.PlacesDetails on userAct.PlaceId equals placeDtls.Id
                                  where userAct.ActivityId == activityId
                                  select new { Id = userAct.ActivityId, ActivityName = actType.Type, UserId = userAct.UserId, PhotoUrl = userAct.PhotoUrl, Note = userAct.PhotoUrl, FormName = userAct.FormName, OrderCost = userAct.OrderCost, AuditItems = userAct.AuditItems, PlaceName = placeDtls.Name, PlaceIsActive = placeDtls.IsActive, PlaceAddress = placeDtls.Address }).ToList();
                return getUserAct;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
