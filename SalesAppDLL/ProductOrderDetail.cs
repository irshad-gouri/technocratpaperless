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
    
    public partial class ProductOrderDetail
    {
        public int Id { get; set; }
        public Nullable<int> UserId { get; set; }
        public Nullable<int> PlaceId { get; set; }
        public Nullable<decimal> OrderPrice { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<decimal> ProductPrice { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> TransactionId { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    
        public virtual PlacesDetail PlacesDetail { get; set; }
        public virtual Product Product { get; set; }
        public virtual ProductTransaction ProductTransaction { get; set; }
        public virtual User User { get; set; }
    }
}