using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class AddPhotoActivities
    {
        public string PhotoUrl { get; set; }
        public string Tags { get; set; }
        public int PlaceId { get; set; }
        public int UserId { get; set; }
        public string Note { get; set; }

    }
}
