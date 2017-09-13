using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppDLL;

namespace SalesAppBLL.Repository
{
   public class LogHandler
    {
        public static void SaveLogInfo(string logtxt, string KeyDescription, int keyId)
        {
            try
            {
                Repository<SalesAppLogInfo> _logobj = new Repository<SalesAppLogInfo>();
                SalesAppLogInfo _obj = new SalesAppLogInfo { KeyId = keyId, KeyDescription = KeyDescription, Description = logtxt, CreatedOn = System.DateTime.Now };
                _logobj.Add(_obj);
            }
            catch (System.Exception ex)
            {
                throw;
            }
        }
    }
}
