using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class Product_Details
    {
        public string Name { get; set; }
        public string EAN { get; set; }
        public decimal? DefaultPrice { get; set; }
        public string Note { get; set; }
        public bool IsActive { get; set; }
        public int AdminId { get; set; }
        public string Tags { get; set; }
        public int ProductGroupId { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int ModifiedBy { get; set; }
    }
}
