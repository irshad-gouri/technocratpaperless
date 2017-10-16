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

        public AddCustomFormsResponse AddAnswerByQuestionId(List<FormsAnswer> ansList)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                foreach (var formAns in ansList)
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

        public AddCustomFormsResponse AddUserActivityComments(AddUserActivityComments userActComments)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (string.IsNullOrEmpty(userActComments.UserComment))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "User comment can't be blank!";
                }
                else if (userActComments.UsersActivitiesId == null || userActComments.UsersActivitiesId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please select UserActivity!";
                }
                else if (userActComments.UsersActivitiesId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Invalid user adding comment!";
                }
                else
                {
                    // TODO: Add values in  CustomForm table.
                    UseActivitiesComment objACTComm = new UseActivitiesComment();
                    objACTComm.UsersActivitiesId = userActComments.UsersActivitiesId;
                    objACTComm.UserComment = userActComments.UserComment;
                    objACTComm.CreatedDate = System.DateTime.Now;
                    objACTComm.ModifiedDate = System.DateTime.Now;
                    objACTComm.CommentByUserId = userActComments.CommentByUserId;
                    // TODO: Perform on db
                    DbContext.UseActivitiesComments.Add(objACTComm);
                    DbContext.SaveChanges();

                    objResp.Status = "Success";
                    objResp.Message = "User Activity Comments Successfully Added!";
                }
            }
            catch (Exception ex)
            {
                objResp.Status = "Failed";
                objResp.Message = ex.Message;
            }
            return objResp;
        }

        public object GetUsersActivitiesForDashBoard(int userId)
        {
            List<UserActivityDashBoardList> objActDashList = new List<UserActivityDashBoardList>();
            try
            {

                var getUserDetail = (from user in DbContext.Users
                                     where user.Id == userId
                                     select user).FirstOrDefault();

                if (getUserDetail.RoleId == 1)
                {

                    var getUserIdList = (from uactlist in DbContext.Users
                                         where uactlist.CreatedById == userId
                                         select uactlist.Id).ToList();

                    if (getUserIdList != null)
                        getUserIdList.Add(userId);
                    else
                    {
                        getUserIdList = new List<int>();
                        getUserIdList.Add(userId);
                    }

                    foreach (var getUItem in getUserIdList)
                    {

                        var getUserActList = (from uactlist in DbContext.UsersActivities
                                              where uactlist.UserId == getUItem
                                              select uactlist).ToList();



                        UserActivityDashBoardList objDB;
                        foreach (var item in getUserActList)
                        {
                            objDB = new UserActivityDashBoardList();
                            objDB.Id = item.Id;
                            objDB.ActivityId = item.ActivityId;
                            objDB.Activity_Type = (from actType in DbContext.ActivitiesTypes
                                                   where actType.Id == item.ActivityId
                                                   select new Activities_Type { Id = actType.Id, Description = actType.Description, Type = actType.Type }).FirstOrDefault();

                            objDB.UserId = item.UserId;

                            objDB.AcivityAdded_UserDetails = (from userDtls in DbContext.Users
                                                              join cmDtls in DbContext.CompanyDetails on userDtls.CompanyId equals cmDtls.Id
                                                              where userDtls.Id == item.UserId
                                                              select new User_Detail
                                                              {
                                                                  UserId = userDtls.Id,
                                                                  FirstName = userDtls.FirstName,
                                                                  LastName = userDtls.LastName,
                                                                  Email = userDtls.Email,
                                                                  Phone = userDtls.Phone,
                                                                  Language = userDtls.Language,
                                                                  Teritory = userDtls.Teritory,
                                                                  CompanyId = userDtls.CompanyId,
                                                                  ComplanyDetail = new Company_Detail { Id = cmDtls.Id, CompanyName = cmDtls.CompanyName, Address = cmDtls.Address, RegistrationNo = cmDtls.RegistrationNo },
                                                                  Password = userDtls.Password,
                                                                  Note = userDtls.Note,
                                                                  PhotoUrl = userDtls.PhotoUrl,
                                                                  RoleId = userDtls.RoleId,
                                                                  //RoleName = userDtls.RoleName,
                                                                  UserName = userDtls.UserName,
                                                                  PostalCode = userDtls.PostalCode,
                                                                  Country = userDtls.Country,
                                                                  City = userDtls.City,
                                                                  Address = userDtls.Address,
                                                              }).FirstOrDefault();
                            objDB.PhotoUrl = item.PhotoUrl;
                            objDB.Note = item.Note;
                            objDB.FormName = item.FormName;
                            objDB.OrderCost = item.OrderCost;
                            objDB.AuditItems = item.AuditItems;
                            objDB.PlaceId = item.PlaceId;
                            objDB.Place_Details = (from plsDtls in DbContext.PlacesDetails
                                                   where plsDtls.Id == item.PlaceId
                                                   select new Places_Detail { Id = plsDtls.Id, Name = plsDtls.Name, IsActive = plsDtls.IsActive, Address = plsDtls.Address, State = plsDtls.State, PostalCode = plsDtls.PostalCode, Country = plsDtls.Country, CountryCode = plsDtls.CountryCode, Note = plsDtls.Note, Website = plsDtls.Website, PhotoUrl = plsDtls.PhotoUrl, PlaceId = plsDtls.PlaceId, Latitude = plsDtls.Latitude, Longitude = plsDtls.Longitude, Tags = plsDtls.Tags }).FirstOrDefault();



                            objActDashList.Add(objDB);
                        }
                    }
                }
                else if (getUserDetail.RoleId == 2)
                {
                    var getUserActList = (from uactlist in DbContext.UsersActivities
                                          where uactlist.UserId == userId
                                          select uactlist).ToList();
                    UserActivityDashBoardList objDB;
                    foreach (var item in getUserActList)
                    {
                        objDB = new UserActivityDashBoardList();
                        objDB.Id = item.Id;
                        objDB.ActivityId = item.ActivityId;
                        objDB.Activity_Type = (from actType in DbContext.ActivitiesTypes
                                               where actType.Id == item.ActivityId
                                               select new Activities_Type { Id = actType.Id, Description = actType.Description, Type = actType.Type }).FirstOrDefault();


                        objDB.UserId = item.UserId;

                        objDB.AcivityAdded_UserDetails = (from userDtls in DbContext.Users
                                                          join cmDtls in DbContext.CompanyDetails on userDtls.CompanyId equals cmDtls.Id
                                                          where userDtls.Id == item.UserId
                                                          select new User_Detail
                                                          {
                                                              UserId = userDtls.Id,
                                                              FirstName = userDtls.FirstName,
                                                              LastName = userDtls.LastName,
                                                              Email = userDtls.Email,
                                                              Phone = userDtls.Phone,
                                                              Language = userDtls.Language,
                                                              Teritory = userDtls.Teritory,
                                                              CompanyId = userDtls.CompanyId,
                                                              ComplanyDetail = new Company_Detail { Id = cmDtls.Id, CompanyName = cmDtls.CompanyName, Address = cmDtls.Address, RegistrationNo = cmDtls.RegistrationNo },
                                                              Password = userDtls.Password,
                                                              Note = userDtls.Note,
                                                              PhotoUrl = userDtls.PhotoUrl,
                                                              RoleId = userDtls.RoleId,
                                                              //RoleName = userDtls.RoleName,
                                                              UserName = userDtls.UserName,
                                                              PostalCode = userDtls.PostalCode,
                                                              Country = userDtls.Country,
                                                              City = userDtls.City,
                                                              Address = userDtls.Address,
                                                          }).FirstOrDefault();
                        objDB.PhotoUrl = item.PhotoUrl;
                        objDB.Note = item.Note;
                        objDB.FormName = item.FormName;
                        objDB.OrderCost = item.OrderCost;
                        objDB.AuditItems = item.AuditItems;
                        objDB.PlaceId = item.PlaceId;
                        objDB.Place_Details = (from plsDtls in DbContext.PlacesDetails
                                               where plsDtls.Id == item.PlaceId
                                               select new Places_Detail { Id = plsDtls.Id, Name = plsDtls.Name, IsActive = plsDtls.IsActive, Address = plsDtls.Address, State = plsDtls.State, PostalCode = plsDtls.PostalCode, Country = plsDtls.Country, CountryCode = plsDtls.CountryCode, Note = plsDtls.Note, Website = plsDtls.Website, PhotoUrl = plsDtls.PhotoUrl, PlaceId = plsDtls.PlaceId, Latitude = plsDtls.Latitude, Longitude = plsDtls.Longitude, Tags = plsDtls.Tags }).FirstOrDefault();


                        objActDashList.Add(objDB);
                    }


                }
                return objActDashList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public object GetUsersActivitiesForDashBoardByPlaceIdAndUserId(int userId, int placeId)
        {
            List<UserActivityDashBoardList> objActDashList = new List<UserActivityDashBoardList>();
            try
            {

                var getUserDetail = (from user in DbContext.Users
                                     where user.Id == userId
                                     select user).FirstOrDefault();

                if (getUserDetail.RoleId == 1)
                {

                    var getUserIdList = (from uactlist in DbContext.Users
                                         where uactlist.CreatedById == userId
                                         select uactlist.Id).ToList();

                    if (getUserIdList != null)
                        getUserIdList.Add(userId);
                    else
                    {
                        getUserIdList = new List<int>();
                        getUserIdList.Add(userId);
                    }

                    foreach (var getUItem in getUserIdList)
                    {

                        var getUserActList = (from uactlist in DbContext.UsersActivities
                                              where uactlist.UserId == getUItem && uactlist.PlaceId == placeId
                                              select uactlist).ToList();



                        UserActivityDashBoardList objDB;
                        foreach (var item in getUserActList)
                        {
                            objDB = new UserActivityDashBoardList();
                            objDB.Id = item.Id;
                            objDB.ActivityId = item.ActivityId;
                            objDB.Activity_Type = (from actType in DbContext.ActivitiesTypes
                                                   where actType.Id == item.ActivityId
                                                   select new Activities_Type { Id = actType.Id, Description = actType.Description, Type = actType.Type }).FirstOrDefault();

                            objDB.UserId = item.UserId;

                            objDB.AcivityAdded_UserDetails = (from userDtls in DbContext.Users
                                                              join cmDtls in DbContext.CompanyDetails on userDtls.CompanyId equals cmDtls.Id
                                                              where userDtls.Id == item.UserId
                                                              select new User_Detail
                                                              {
                                                                  UserId = userDtls.Id,
                                                                  FirstName = userDtls.FirstName,
                                                                  LastName = userDtls.LastName,
                                                                  Email = userDtls.Email,
                                                                  Phone = userDtls.Phone,
                                                                  Language = userDtls.Language,
                                                                  Teritory = userDtls.Teritory,
                                                                  CompanyId = userDtls.CompanyId,
                                                                  ComplanyDetail = new Company_Detail { Id = cmDtls.Id, CompanyName = cmDtls.CompanyName, Address = cmDtls.Address, RegistrationNo = cmDtls.RegistrationNo },
                                                                  Password = userDtls.Password,
                                                                  Note = userDtls.Note,
                                                                  PhotoUrl = userDtls.PhotoUrl,
                                                                  RoleId = userDtls.RoleId,
                                                                  //RoleName = userDtls.RoleName,
                                                                  UserName = userDtls.UserName,
                                                                  PostalCode = userDtls.PostalCode,
                                                                  Country = userDtls.Country,
                                                                  City = userDtls.City,
                                                                  Address = userDtls.Address,
                                                              }).FirstOrDefault();
                            objDB.PhotoUrl = item.PhotoUrl;
                            objDB.Note = item.Note;
                            objDB.FormName = item.FormName;
                            objDB.OrderCost = item.OrderCost;
                            objDB.AuditItems = item.AuditItems;
                            objDB.PlaceId = item.PlaceId;
                            objDB.Place_Details = (from plsDtls in DbContext.PlacesDetails
                                                   where plsDtls.Id == item.PlaceId
                                                   select new Places_Detail { Id = plsDtls.Id, Name = plsDtls.Name, IsActive = plsDtls.IsActive, Address = plsDtls.Address, State = plsDtls.State, PostalCode = plsDtls.PostalCode, Country = plsDtls.Country, CountryCode = plsDtls.CountryCode, Note = plsDtls.Note, Website = plsDtls.Website, PhotoUrl = plsDtls.PhotoUrl, PlaceId = plsDtls.PlaceId, Latitude = plsDtls.Latitude, Longitude = plsDtls.Longitude, Tags = plsDtls.Tags }).FirstOrDefault();



                            objActDashList.Add(objDB);
                        }
                    }
                }
                else if (getUserDetail.RoleId == 2)
                {
                    var getUserActList = (from uactlist in DbContext.UsersActivities
                                          where uactlist.UserId == userId && uactlist.PlaceId == placeId
                                          select uactlist).ToList();
                    UserActivityDashBoardList objDB;
                    foreach (var item in getUserActList)
                    {
                        objDB = new UserActivityDashBoardList();
                        objDB.Id = item.Id;
                        objDB.ActivityId = item.ActivityId;
                        objDB.Activity_Type = (from actType in DbContext.ActivitiesTypes
                                               where actType.Id == item.ActivityId
                                               select new Activities_Type { Id = actType.Id, Description = actType.Description, Type = actType.Type }).FirstOrDefault();


                        objDB.UserId = item.UserId;

                        objDB.AcivityAdded_UserDetails = (from userDtls in DbContext.Users
                                                          join cmDtls in DbContext.CompanyDetails on userDtls.CompanyId equals cmDtls.Id
                                                          where userDtls.Id == item.UserId
                                                          select new User_Detail
                                                          {
                                                              UserId = userDtls.Id,
                                                              FirstName = userDtls.FirstName,
                                                              LastName = userDtls.LastName,
                                                              Email = userDtls.Email,
                                                              Phone = userDtls.Phone,
                                                              Language = userDtls.Language,
                                                              Teritory = userDtls.Teritory,
                                                              CompanyId = userDtls.CompanyId,
                                                              ComplanyDetail = new Company_Detail { Id = cmDtls.Id, CompanyName = cmDtls.CompanyName, Address = cmDtls.Address, RegistrationNo = cmDtls.RegistrationNo },
                                                              Password = userDtls.Password,
                                                              Note = userDtls.Note,
                                                              PhotoUrl = userDtls.PhotoUrl,
                                                              RoleId = userDtls.RoleId,
                                                              //RoleName = userDtls.RoleName,
                                                              UserName = userDtls.UserName,
                                                              PostalCode = userDtls.PostalCode,
                                                              Country = userDtls.Country,
                                                              City = userDtls.City,
                                                              Address = userDtls.Address,
                                                          }).FirstOrDefault();
                        objDB.PhotoUrl = item.PhotoUrl;
                        objDB.Note = item.Note;
                        objDB.FormName = item.FormName;
                        objDB.OrderCost = item.OrderCost;
                        objDB.AuditItems = item.AuditItems;
                        objDB.PlaceId = item.PlaceId;
                        objDB.Place_Details = (from plsDtls in DbContext.PlacesDetails
                                               where plsDtls.Id == item.PlaceId
                                               select new Places_Detail { Id = plsDtls.Id, Name = plsDtls.Name, IsActive = plsDtls.IsActive, Address = plsDtls.Address, State = plsDtls.State, PostalCode = plsDtls.PostalCode, Country = plsDtls.Country, CountryCode = plsDtls.CountryCode, Note = plsDtls.Note, Website = plsDtls.Website, PhotoUrl = plsDtls.PhotoUrl, PlaceId = plsDtls.PlaceId, Latitude = plsDtls.Latitude, Longitude = plsDtls.Longitude, Tags = plsDtls.Tags }).FirstOrDefault();


                        objActDashList.Add(objDB);
                    }


                }
                return objActDashList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public object GetUsersActivitiesCommentsByActivityId(int actId)
        {
            try
            {
                var getUserAct = (from userComments in DbContext.UseActivitiesComments
                                  join userDtls in DbContext.Users on userComments.CommentByUserId equals userDtls.Id
                                  where userComments.UsersActivitiesId == actId
                                  select new UserComments { Id = userComments.CommentId, UserActivityId = userComments.UsersActivitiesId, UserComment = userComments.UserComment, CommentByUserId = userComments.CommentByUserId, CommentByUserName = (userDtls.FirstName + " " + userDtls.LastName), CreatedDate = userComments.CreatedDate }).ToList();
                return getUserAct;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public AddCustomFormsResponse AddNotesActivities(AddNotesActivities notesAct)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (string.IsNullOrEmpty(notesAct.Note))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "User comment can't be blank!";
                }
                else if (notesAct.UserId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "UserId!";
                }
                else if (notesAct.PlaceId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "PlaceId Can't blank!";
                }
                else
                {
                    // TODO: Add values in  CustomForm table.
                    NotesActivity objACTComm = new NotesActivity();
                    objACTComm.PlaceId = notesAct.PlaceId;
                    objACTComm.UserId = notesAct.UserId;
                    objACTComm.Note = notesAct.Note;
                    objACTComm.CreatedDate = System.DateTime.Now;
                    objACTComm.ModifiedDate = System.DateTime.Now;


                    // TODO: Perform on db
                    DbContext.NotesActivities.Add(objACTComm);
                    DbContext.SaveChanges();



                    // TODO : Add logs in UserActivity
                    UsersActivity objUAct = new UsersActivity();

                    objUAct.ActivityId = 4;
                    objUAct.UserId = (int)objACTComm.UserId;
                    objUAct.PhotoUrl = string.Empty;
                    objUAct.Note = objACTComm.Note;
                    objUAct.PlaceId = objACTComm.PlaceId;
                    AddUsersActivities(objUAct);



                    objResp.Status = "Success";
                    objResp.Message = "User Notes Activity Successfully Added!";
                }
            }
            catch (Exception ex)
            {
                objResp.Status = "Failed";
                objResp.Message = ex.Message;
            }
            return objResp;
        }

        public AddCustomFormsResponse AddPhotoctivities(AddPhotoActivities photoAct)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (string.IsNullOrEmpty(photoAct.PhotoUrl))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please Select Photo!";
                }
                else if (photoAct.UserId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "UserId!";
                }
                else if (photoAct.PlaceId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "PlaceId Can't blank!";
                }
                else
                {
                    // TODO: Add values in  CustomForm table.
                    PhotoActivity objACTComm = new PhotoActivity();
                    objACTComm.PhotoUrl = photoAct.PhotoUrl;
                    objACTComm.Tags = photoAct.Tags;
                    objACTComm.PlaceId = photoAct.PlaceId;
                    objACTComm.UserId = photoAct.UserId;
                    objACTComm.Note = photoAct.Note;
                    objACTComm.CreatedDate = System.DateTime.Now;
                    objACTComm.ModifiedDate = System.DateTime.Now;

                    // TODO: Perform on db...
                    DbContext.PhotoActivities.Add(objACTComm);
                    DbContext.SaveChanges();


                    // TODO : Add logs in UserActivity
                    UsersActivity objUAct = new UsersActivity();

                    objUAct.UserId = (int)objACTComm.UserId;
                    objUAct.PhotoUrl = photoAct.PhotoUrl;
                    objUAct.Note = objACTComm.Note;
                    //objUAct.Tags = objACTComm.Tags;
                    objUAct.PlaceId = objACTComm.PlaceId;
                    AddUsersActivities(objUAct);

                    objResp.Status = "Success";
                    objResp.Message = "User Photo Activity Successfully Added!";
                }
            }
            catch (Exception ex)
            {
                objResp.Status = "Failed";
                objResp.Message = ex.Message;
            }
            return objResp;
        }

        public object GetAssignedPlacesByUserId(int userId)
        {
            try
            {
                List<PlaceDetail_WithUserModel> objPlaceDtlsList = new List<PlaceDetail_WithUserModel>();

                var getUserList = (from user in DbContext.Users
                                   where user.CreatedById == userId
                                   select user).ToList();

                foreach (var item in getUserList)
                {
                    var getAssignedPlaceId = (from uAPlace in DbContext.UserAssignedPlaces
                                              where uAPlace.UserId == item.Id
                                              select uAPlace).ToList();

                    foreach (var itemAP in getAssignedPlaceId)
                    {
                        var getPlaceDtls = (from uAPlaceDlt in DbContext.PlacesDetails
                                            where uAPlaceDlt.Id == itemAP.PlaceId
                                            select new PlaceDetail_WithUserModel
                                            {
                                                Id = uAPlaceDlt.Id,
                                                Name = uAPlaceDlt.Name,
                                                IsActive = uAPlaceDlt.IsActive,
                                                Address = uAPlaceDlt.Address,
                                                State = uAPlaceDlt.State,
                                                PostalCode = uAPlaceDlt.PostalCode,
                                                Country = uAPlaceDlt.Country,
                                                CountryCode = uAPlaceDlt.CountryCode,
                                                Note = uAPlaceDlt.Note,
                                                Website = uAPlaceDlt.Website,
                                                PhotoUrl = uAPlaceDlt.PhotoUrl,
                                                PlaceId = uAPlaceDlt.PlaceId,
                                                Latitude = uAPlaceDlt.Latitude,
                                                Longitude = uAPlaceDlt.Longitude,
                                                Tags = uAPlaceDlt.Tags,
                                                UserName = (item.FirstName + " " + item.LastName),
                                                UserId = item.Id,
                                            }).FirstOrDefault();

                        objPlaceDtlsList.Add(getPlaceDtls);
                    }
                }

                return objPlaceDtlsList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
