using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class UserActivityDashBoardList
    {
        public int Id { get; set; }
        public int ActivityId { get; set; }
        public Activities_Type Activity_Type { get; set; }
        public int UserId { get; set; }
        public User_Detail AcivityAdded_UserDetails { get; set; }
        public string PhotoUrl { get; set; }
        public string Note { get; set; }
        public string FormName { get; set; }
        public decimal? OrderCost { get; set; }
        public int? AuditItems { get; set; }
        public int? PlaceId { get; set; }
        public int? FormId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Places_Detail Place_Details { get; set; }
    }

    public class User_Detail
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Language { get; set; }
        public string Teritory { get; set; }
        public int CompanyId { get; set; }
        public Company_Detail ComplanyDetail { get; set; }
        public string Password { get; set; }
        public string Note { get; set; }
        public string PhotoUrl { get; set; }
        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public string UserName { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
    }

    public class Company_Detail
    {
        public int Id { get; set; }
        public string CompanyName { get; set; }
        public string Address { get; set; }
        public string RegistrationNo { get; set; }
    }

    public class Places_Detail
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool? IsActive { get; set; }
        public string Address { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string CountryCode { get; set; }
        public string Note { get; set; }
        public string Website { get; set; }
        public string PhotoUrl { get; set; }
        public string PlaceId { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
        public string Tags { get; set; }
        public DateTime? CreatedDate { get; set; }
    }

    public class Activities_Type
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
    }

    public class UserComments
    {
        public int Id { get; set; }
        public int? UserActivityId { get; set; }
        public string UserComment { get; set; }
        public int? CommentByUserId { get; set; }
        public string CommentByUserName { get; set; }
        public DateTime? CreatedDate { get; set; }
    }

}
