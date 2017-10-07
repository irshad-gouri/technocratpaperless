using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class AddUserActivityComments
    {
        public Nullable<int> UsersActivitiesId { get; set; }
        public string UserComment { get; set; }
        public int CommentByUserId { get; set; }
    }
}
