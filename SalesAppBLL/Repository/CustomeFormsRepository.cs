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
                var getFormsList = (from user in DbContext.CustomForms
                                   where user.UserId == userId
                                   select user).ToList();

                return getFormsList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
