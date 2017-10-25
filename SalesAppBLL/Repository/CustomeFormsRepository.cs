using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppDLL;


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

        public object GetAllFormsAnswerByUserIdPlaceIdFormIdAndCreatedDate(int UserId, int PlaceId, int FormId, DateTime CreatedDate)
        {
            try
            {
                var getFormsAns = (from i in DbContext.FormsAnswers
                                    where i.UserId == UserId && i.FormId == FormId && i.PlaceId == PlaceId && i.CreatedDate == CreatedDate
                                    select i).ToList();

                return getFormsAns;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
