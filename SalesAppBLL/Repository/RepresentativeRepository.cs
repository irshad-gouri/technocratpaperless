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
    }
}
