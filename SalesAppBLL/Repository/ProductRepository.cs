using SalesAppDLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppBLL.Models;
using SalesAppDLL.CustomModels;

namespace SalesAppBLL.Repository
{
    public class ProductRepository : Repository<User>
    {
        public ProductRepository()
        { }

        public AddCustomFormsResponse AddProductGroup(ProductsGroup pgDetails)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (string.IsNullOrEmpty(pgDetails.Description))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please fill description title!";
                }
                else if (pgDetails.AdminId == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Admin Id can't be blank!";
                }
                else if (string.IsNullOrEmpty(pgDetails.DisplayCode))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "DisplayCode can't be blank!";
                }
                else
                {
                    pgDetails.CreatedDate = System.DateTime.Now;
                    pgDetails.ModifiedDate = System.DateTime.Now;
                    DbContext.ProductsGroups.Add(pgDetails);
                    DbContext.SaveChanges();

                    objResp.Status = "Success";
                    objResp.Message = "Product Group Successfully Saved!";
                }
                return objResp;
            }
            catch (System.Exception ex)
            {
                return null;
            }
        }

        public object GetProductGroup()
        {
            try
            {
                var getProductGrp = (from prgroup in DbContext.ProductsGroups
                                     where prgroup.IsActive == true
                                     select prgroup).ToList();
                return getProductGrp;
            }
            catch (System.Exception ex)
            {
                return null;
            }
        }

        public AddCustomFormsResponse AddProduct(Product_Details prDetails)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (string.IsNullOrEmpty(prDetails.EAN))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please fill EAN!";
                }
                else if (prDetails.DefaultPrice == 0)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please enter default price!";
                }
                else if (string.IsNullOrEmpty(prDetails.Name))
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Please  enter the product name!";
                }
                else
                {
                    Product pr = new Product();
                    pr.Name = prDetails.Name;
                    pr.EAN = prDetails.EAN;
                    pr.DefaultPrice = prDetails.DefaultPrice;
                    pr.Note = prDetails.Note;
                    pr.IsActive = prDetails.IsActive;
                    pr.AdminId = prDetails.AdminId;
                    pr.Tags = prDetails.Tags;
                    pr.ProductGroupId = prDetails.ProductGroupId;
                    pr.CreatedDate = System.DateTime.Now;
                    pr.ModifiedBy = prDetails.ModifiedBy;

                    DbContext.Products.Add(pr);
                    DbContext.SaveChanges();

                    objResp.Status = "Success";
                    objResp.Message = "Product Successfully Saved!";
                }
                return objResp;
            }
            catch (System.Exception ex)
            {
                return null;
            }
        }

        public object GetProducts(int adminId)
        {
            try
            {
                var getProductGrp = (from prdtls in DbContext.Products
                                     where prdtls.AdminId == adminId
                                     select prdtls).ToList();
                return getProductGrp;
            }
            catch (System.Exception ex)
            {
                return null;
            }
        }

        public AddCustomFormsResponse AddProductOrderDetails(AddProductOrderDetails prOrderDetails)
        {
            AddCustomFormsResponse objResp = new AddCustomFormsResponse();
            try
            {
                if (prOrderDetails.ProductOrderDtl == null)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Product Order Details Can't Be Blank!";
                }
                else if (prOrderDetails.ProductTransactionDtl == null)
                {
                    objResp.Status = "Failed";
                    objResp.Message = "Product Transaction Details Can't Be Blank!";
                }
                else
                {
                    // TODO : Save Trasaction Details.
                    ProductTransaction prTras = new ProductTransaction();
                    prTras.TotalQuantity = prOrderDetails.ProductTransactionDtl.TotalQuantity;
                    prTras.TotalAmountPayable = prOrderDetails.ProductTransactionDtl.TotalAmountPayable;
                    prTras.DiscountPercentage = prOrderDetails.ProductTransactionDtl.DiscountPercentage;
                    prTras.TaxPercentage = prOrderDetails.ProductTransactionDtl.TaxPercentage;
                    prTras.DueDays = prOrderDetails.ProductTransactionDtl.DueDays;
                    prTras.Signature = prOrderDetails.ProductTransactionDtl.Signature;
                    prTras.TotalAmount = prOrderDetails.ProductTransactionDtl.TotalAmount;
                    DbContext.ProductTransactions.Add(prTras);
                    DbContext.SaveChanges();


                    //TODO : Save Order Details.
                    ProductOrderDetail prOrdDtl = new ProductOrderDetail();
                    prOrdDtl.UserId = prOrderDetails.ProductOrderDtl.UserId;
                    prOrdDtl.PlaceId = prOrderDetails.ProductOrderDtl.PlaceId;
                    prOrdDtl.OrderPrice = prOrderDetails.ProductOrderDtl.OrderPrice;
                    prOrdDtl.ProductId = prOrderDetails.ProductOrderDtl.ProductId;
                    prOrdDtl.ProductPrice = prOrderDetails.ProductOrderDtl.ProductPrice;
                    prOrdDtl.Quantity = prOrderDetails.ProductOrderDtl.Quantity;
                    prOrdDtl.TransactionId = prTras.Id;
                    prOrdDtl.CreatedDate = System.DateTime.Now;
                    prOrdDtl.CreatedBy = prOrderDetails.ProductOrderDtl.CreatedBy;
                    DbContext.ProductOrderDetails.Add(prOrdDtl);
                    DbContext.SaveChanges();

                    objResp.Status = "Success";
                    objResp.Message = "Product Order Successfully Saved!";
                }
                return objResp;
            }
            catch (System.Exception ex)
            {
                objResp.Status = "Failed";
                objResp.Message = ex.Message;
                return objResp;
            }
        }
    }
}
