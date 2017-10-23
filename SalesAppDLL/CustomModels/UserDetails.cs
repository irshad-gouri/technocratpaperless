using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
  public class UserDetails
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Language { get; set; }
        public string Teritory { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public int CompanyId { get; set; }
        public string Password { get; set; }
        public string Note { get; set; }
        public string PhotoUrl { get; set; }
        public int RoleId { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public Nullable<int> CreatedById { get; set; }
        public string CompanyName { get; set; }
        public string CompanyAddress { get; set; }
        public string RegistrationNo { get; set; }
    }
}
