//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SalesAppDLL
{
    using System;
    using System.Collections.Generic;
    
    public partial class FormsQuestionField
    {
        public int Id { get; set; }
        public Nullable<int> FormId { get; set; }
        public string Question { get; set; }
        public Nullable<bool> IsMandatory { get; set; }
        public Nullable<int> InputFieldsId { get; set; }
        public string ListOptions { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModefiedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    }
}
