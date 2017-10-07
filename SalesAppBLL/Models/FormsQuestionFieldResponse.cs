using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppBLL.Models
{
    public class FormsQuestionFieldResponse
    {
        public int Id { get; set; }
        public int? FormId { get; set; }
        public string Question { get; set; }
        public Nullable<bool> IsMandatory { get; set; }
        public int? InputFieldsId { get; set; }
        public string InputFieldName { get; set; }
        public string ListOptions { get; set; }
    }
}
