using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class CustomFormsDetails
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public string Tags { get; set; }
        public int UserId { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime ModifiedDate { get; set; }
        public List<FormsQuestionFieldDetails> FormsQuestionFieldDetail { get; set; }
        public List<FormsVisibleOnTheseRepsDetails> FormsVisibleOnTheseRepsDetail { get; set; }
    }

    public class FormsQuestionFieldDetails
    {
        public int Id { get; set; }
        public int FormId { get; set; }
        public string Question { get; set; }
        public bool IsMandatory { get; set; }
        public int InputFieldsId { get; set; }
        public string ListOptions { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime ModefiedDate { get; set; }
    }

    public class FormsVisibleOnTheseRepsDetails
    {
        public int Id { get; set; }
        public int UserId { get; set; }
    }
}
