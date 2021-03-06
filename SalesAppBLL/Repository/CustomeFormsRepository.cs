﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppDLL;
using SalesAppDLL.CustomModels;

namespace SalesAppBLL.Repository
{
    public class CustomeFormsRepository : Repository<CustomForm>
    {
        public CustomeFormsRepository()
        { }

        public object GetAllCustomFormsById(int userId)
        {
            try
            {
                var getFormsList = (from user in DbContext.FormsVisibleOnTheseReps join customFrm in DbContext.CustomForms on user.CustomFormsId equals customFrm.Id
                                   where user.UserId == userId
                                   select customFrm).ToList();

                return getFormsList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public object GetAllCustomFormsByIdAdminDashboard(int userId)
        {
            try
            {
                var getFormsList = (from i in DbContext.CustomForms 
                                    where i.UserId == userId
                                    select i).ToList();

                return getFormsList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public object GetFormDetailsByFormIdRepo(int formId)
        {
            try
            {
                var getFormsList = (from i in DbContext.CustomForms
                                    where i.Id == formId
                                    select i).FirstOrDefault();

                return getFormsList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public object GetAllFormsAnswerByUserIdPlaceIdFormIdAndCreatedDate(int UserId, int PlaceId, int FormId, DateTime createdDate)
        {
            try
            {
                var getFormsAns = (from i in DbContext.FormsAnswers

                                   join ques in DbContext.FormsQuestionFields on i.FormsQuestionId equals ques.Id
                                   where i.UserId == UserId && i.FormId == FormId && i.PlaceId == PlaceId && i.CreatedDate==createdDate
                                   select new {
                                       Id = i.Id,
                                       FormsQuestionId = i.FormsQuestionId,
                                       UserId = i.UserId,
                                       PlaceId = i.PlaceId,
                                       Answer = i.Answer,
                                       ModifiedDate = i.ModifiedDate,
                                       CreatedDate = i.CreatedDate,
                                       CreatedBy = i.CreatedBy,
                                       FormId = ques.FormId,
                                       Question = ques.Question,
                                       Mandatory = ques.IsMandatory,
                                       InputFieldsId=ques.InputFieldsId,
                                       ListOptions = ques.ListOptions}).ToList();

              
                                
                return getFormsAns;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool UpdateQuestionAnsersRepo(List<FormsAnswer> formAns)
        {
            try
            {
                foreach (var value in formAns)
                {
                    var questionNo = DbContext.FormsAnswers.Where(i => i.CreatedDate == value.CreatedDate &&
                    i.FormId == value.FormId && i.FormsQuestionId == value.FormsQuestionId
                    && i.PlaceId == value.PlaceId && i.UserId == value.UserId).FirstOrDefault();
                    questionNo.Answer = value.Answer;
                    questionNo.ModifiedDate = System.DateTime.Now;
                    
                }
                DbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            
        }

        public bool UpdateCustomFormsRepo(CustomFormsDetails customFormDetails)
        {
            try
            {
                foreach (var value in customFormDetails.FormsQuestionFieldDetail)
                {
                    var questionName = DbContext.FormsQuestionFields.Where(i => i.Id.Equals(value.Id)).FirstOrDefault();
                    questionName.InputFieldsId = value.InputFieldsId;
                    questionName.IsMandatory = value.IsMandatory;
                    if (questionName.ListOptions != null)
                    {

                    questionName.ListOptions = value.ListOptions;
                    }
                    questionName.Question = value.Question;
                    
                }
                DbContext.SaveChanges();
                var formsVisbRep = DbContext.FormsVisibleOnTheseReps.Where(i => i.CustomFormsId == customFormDetails.Id).ToList();
                foreach (var val in formsVisbRep)
                {
                    DbContext.FormsVisibleOnTheseReps.Remove(val);
                }
                DbContext.SaveChanges();
                if (customFormDetails.FormsVisibleOnTheseRepsDetail != null)
                {
                    //TODO: Add FormsVisibleOnTheseReps list.
                    
                    
                    foreach (var item in customFormDetails.FormsVisibleOnTheseRepsDetail)
                    {
                        FormsVisibleOnTheseRep objfrmVisOnThsRep;
                        objfrmVisOnThsRep = new FormsVisibleOnTheseRep();
                        objfrmVisOnThsRep.UserId = item.Id;
                        objfrmVisOnThsRep.CustomFormsId = customFormDetails.Id;
                        // TODO: Perform on db
                        DbContext.FormsVisibleOnTheseReps.Add(objfrmVisOnThsRep);
                        
                    }
                    DbContext.SaveChanges();
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public object GetAssignedUserOfFormRepo(int? formId,int? adminId)
        {
            try
            {
                var getFormsList = (from i in DbContext.FormsVisibleOnTheseReps
                                    where i.CustomFormsId == formId  join m in DbContext.Users
                                    on i.UserId equals m.Id 
                                    select m).ToList();

                return getFormsList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<CustomForm> GetFormDetailsByCreatedId(int? UserId)
        {
            try
            {
                var getFormsList = (from i in DbContext.CustomForms
                                    where i.UserId == UserId
                                    select i).ToList();

                return getFormsList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
