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
    public class RepresentativeRepository : Repository<User>
    {
        public RepresentativeRepository()
        { }

        public object GetAllRepresentativeByCreatedById(int userId)
        {
            try
            {
                var getUserList = (from user in DbContext.Users
                                   where user.CreatedById == userId
                                   select user).ToList();


                return getUserList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool UpdateRepresentative(User represen)
        {
            try
            {
                     var alldata = represen;
                     var repDetails = DbContext.Users.Where(i => i.Id == represen.Id).FirstOrDefault();
              
                repDetails.FirstName = alldata.FirstName;
                repDetails.LastName = alldata.LastName;
                repDetails.Language = alldata.Language;
                repDetails.IsActive = alldata.IsActive;
                repDetails.UserName = alldata.UserName;
                repDetails.CompanyDetail = alldata.CompanyDetail;
                repDetails.CompanyId = alldata.CompanyId;
                repDetails.Country = alldata.Country;
                repDetails.Address = alldata.Address;
                repDetails.City = alldata.City;
                repDetails.Email = alldata.Email;
                repDetails.CreatedById = alldata.CreatedById;
                repDetails.Phone = alldata.Phone;
                repDetails.Password = alldata.Password;
                repDetails.PostalCode = alldata.PostalCode;
                repDetails.RoleId = alldata.RoleId;
                repDetails.Teritory = alldata.Teritory;
                repDetails.Note = alldata.Note;


                DbContext.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
    }
}
