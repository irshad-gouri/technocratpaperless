using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class AddNotesActivities
    {
        public int PlaceId { get; set; }
        public string Note { get; set; }
        public int UserId { get; set; }
        public int CreatedBy { get; set; }
    }
}
