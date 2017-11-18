using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SalesAppBLL.Repository;
using SalesAppBLL;
using SalesAppDLL;
using SalesAppDLL.CustomModels;

namespace SalesApp.Api
{
    [RoutePrefix("api/product")]
    public class ProductController : ApiController
    {
        private readonly ProductRepository _productRepo = new ProductRepository();

        [HttpPost, Route("addproductgroup")]
        public ResponseData AddProductGroup(ProductsGroup productGroup)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _productRepo.AddProductGroup(productGroup);
                data.Data = lst;
                data.Status = "SUCCESS";
                data.Error = "";
                data.ErrorCode = "";
                return data;
            }
            catch (Exception ex)
            {
                data.Data = "FAIL";
                data.Status = "FAIL";
                data.Error = ex.Message;
                data.ErrorCode = "";
                return data;
            }
        }

        [HttpGet, Route("getproductgroup")]
        public ResponseData GetProductGroup()
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _productRepo.GetProductGroup();
                data.Data = lst;
                data.Status = "SUCCESS";
                data.Error = "";
                data.ErrorCode = "";
                return data;
            }
            catch (Exception ex)
            {
                data.Data = "FAIL";
                data.Status = "FAIL";
                data.Error = ex.Message;
                data.ErrorCode = "";
                return data;
            }
        }

        [HttpPost, Route("addproduct")]
        public ResponseData AddProduct(Product_Details apr)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _productRepo.AddProduct(apr);
                data.Data = lst;
                data.Status = "SUCCESS";
                data.Error = "";
                data.ErrorCode = "";
                return data;
            }
            catch (Exception ex)
            {
                data.Data = "FAIL";
                data.Status = "FAIL";
                data.Error = ex.Message;
                data.ErrorCode = "";
                return data;
            }
        }

        [HttpGet, Route("getproducts")]
        public ResponseData GetProducts(int adminId)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _productRepo.GetProducts(adminId);
                data.Data = lst;
                data.Status = "SUCCESS";
                data.Error = "";
                data.ErrorCode = "";
                return data;
            }
            catch (Exception ex)
            {
                data.Data = "FAIL";
                data.Status = "FAIL";
                data.Error = ex.Message;
                data.ErrorCode = "";
                return data;
            }
        }

        [HttpPost, Route("addproductorderdetails")]
        public ResponseData AddProductOrderDetails(AddProductOrderDetails prOrderDetails)
        {
            ResponseData data = new ResponseData();
            try
            {
                var lst = _productRepo.AddProductOrderDetails(prOrderDetails);
                data.Data = lst;
                data.Status = "SUCCESS";
                data.Error = "";
                data.ErrorCode = "";
                return data;
            }
            catch (Exception ex)
            {
                data.Data = "FAIL";
                data.Status = "FAIL";
                data.Error = ex.Message;
                data.ErrorCode = "";
                return data;
            }
        }
    }
}