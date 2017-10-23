using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class PlaceDetailModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string Address { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string CountryCode { get; set; }
        public string Note { get; set; }
        public string Website { get; set; }
        public string PhotoUrl { get; set; }
        public string PlaceId { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public string Tags { get; set; }
        public DateTime? CreatedDate { get; set; }
    }

    public class PlaceDetail_WithUserModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string Address { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string CountryCode { get; set; }
        public string Note { get; set; }
        public string Website { get; set; }
        public string PhotoUrl { get; set; }
        public string PlaceId { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public string Tags { get; set; }
        public string UserName { get; set; }
        public int UserId { get; set; }
    }
}
