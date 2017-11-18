using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesAppDLL.CustomModels
{
    public class AddProductOrderDetails
    {
        public Transaction ProductTransactionDtl { get; set; }
        public OrderDetails ProductOrderDtl { get; set; }
    }

    public class Transaction
    {
        public int TotalQuantity { get; set; }
        public decimal TotalAmountPayable { get; set; }
        public decimal DiscountPercentage { get; set; }
        public decimal TaxPercentage { get; set; }
        public int DueDays { get; set; }
        public string Signature { get; set; }
        public decimal TotalAmount { get; set; }
    }

    public class OrderDetails
    {
        public int UserId { get; set; }
        public int PlaceId { get; set; }
        public decimal OrderPrice { get; set; }
        public int ProductId { get; set; }
        public decimal ProductPrice { get; set; }
        public int Quantity { get; set; }
        public int CreatedBy { get; set; }
    }
}
