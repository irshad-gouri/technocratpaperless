using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;



namespace SalesAppBLL
{
  public  class Utility
    {
        public static void SendEmail(string subject, string body, string toEmail)
        {
            
            string fromEmail = ConfigurationManager.AppSettings["fromEmail"];

            string EmailUsername = ConfigurationManager.AppSettings["EmailUsername"];
            string EmailPassword = ConfigurationManager.AppSettings["EmailPassword"];
            string EmailHost = ConfigurationManager.AppSettings["EmailHost"];
            string EmailPort = ConfigurationManager.AppSettings["EmailPort"];
            string EmailEnableSSL = ConfigurationManager.AppSettings["EmailEnableSSL"];


            using (MailMessage mm = new MailMessage(fromEmail, toEmail))
            {
                mm.Subject = subject;
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = EmailHost;
                smtp.EnableSsl = Convert.ToBoolean(EmailEnableSSL);
                NetworkCredential NetworkCred = new NetworkCredential(EmailUsername, EmailPassword);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port =Convert.ToInt32(EmailPort);
                smtp.Send(mm);

            }
        }
        public static string SaveImage(string ImgStr, string ImgName, string baseUrl)
        {
            String path = baseUrl; //Path

            //Check if directory exist
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path); //Create directory if it doesn't exist
            }
            string imageName = ImgName + ".jpg";
            //set the image path
            string imgPath = Path.Combine(baseUrl, imageName);
            byte[] imageBytes = Convert.FromBase64String(ImgStr);

            File.WriteAllBytes(imgPath, imageBytes);
            string profileImagePath = "ProfileImage/" + imageName;
            return profileImagePath;
        }

    
    }
}
