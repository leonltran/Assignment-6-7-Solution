using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_6___7
{
    public partial class imageProcess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            Captcha.ServiceClient client = new Captcha.ServiceClient();

            string myStr, userLen;
            if (Session["generatedString"] == null)
            {
                if (Session["generatedString"] == null)
                {
                    userLen = "6";
                } else
                {
                    userLen = Session["generatedString"].ToString();
                }

                myStr = client.GetVerifierString(userLen);
                Session["generatedString"] = myStr;
            } else
            {
                myStr = Session["generatedString"].ToString();
            }
            
            Stream myStream = client.GetImage(myStr);
            System.Drawing.Image myImage = System.Drawing.Image.FromStream(myStream);
            Response.ContentType = "image/jpeg";
            myImage.Save(Response.OutputStream, ImageFormat.Jpeg);
        }
    }
}