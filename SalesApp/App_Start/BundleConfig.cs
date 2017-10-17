using System.Web;
using System.Web.Optimization;

namespace SalesApp
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/angular").Include(
                "~/Scripts/angular.min.js",
                "~/Scripts/angular-ui/ui-bootstrap.min.js",
                "~/Scripts/angular-route.min.js",
                "~/Scripts/angular-ui-router.min.js"));
            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/all.css",
                      "~/Content/angular-ui-tree.min.css",
                      "~/Content/custom.css",
                      "~/Content/StyleSheet_Main.css",
                       "~/Content/forms.min.css",
                      "~/Content/ngDialog-theme-default.min.css",
                      "~/Content/ngDialog.min.css",
                      "~/Content/font-awesome.min.css",
                      "~/Content/ui-bootstrap-csp.css"));

            bundles.Add(new ScriptBundle("~/bundles/TechnocratWeb").Include(
                     "~/Scripts/TechnocratWeb/js/app.js",
                      "~/Scripts/TechnocratWeb/js/service.js",
                     "~/Scripts/TechnocratWeb/js/authService.js",
                     "~/Scripts/TechnocratWeb/js/controllers.js",
                     "~/Scripts/TechnocratWeb/js/formsdashboard.js",
                     "~/Scripts/TechnocratWeb/js/filter.js",
                     "~/Scripts/TechnocratWeb/js/login.js",
                     "~/Scripts/TechnocratWeb/js/orders.js",
                     "~/Scripts/TechnocratWeb/js/placedashboard.js",
                     "~/Scripts/TechnocratWeb/js/productDetail.js",
                     "~/Scripts/TechnocratWeb/js/requestService.js",
                     "~/Scripts/TechnocratWeb/js/updateProduct.js",
                     "~/Scripts/TechnocratWeb/js/representativeDashboard.js"
                     ));
            bundles.Add(new ScriptBundle("~/bundles/lib").Include(
                    "~/Scripts/TechnocratWeb/lib/ng-file-upload.min.js",
                    "~/Scripts/TechnocratWeb/lib/ngDialog.min.js"
                    ));
        }
    }
}
