using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Management;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace Assignment_6___7
{
    public partial class _Member : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie login = Request.Cookies["loginCookies"];
            if (login != null)
            {
                userLabel.Text = login["Username"];
            } else
            {
                Response.Redirect("/Login.aspx");
            }

            string fLocation = Path.Combine(Request.PhysicalApplicationPath, @"App_Data\Member.xml");
            if (File.Exists(fLocation))
            {
                XDocument memberDoc = XDocument.Load(fLocation);
                xmlBox.Text = memberDoc.ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var file1 = FileUpload1.PostedFile;
            var file2 = FileUpload2.PostedFile;
            try
            {
                WSDLServices.Service1Client textClient = new WSDLServices.Service1Client();

                System.IO.Stream stream = file1.InputStream;
                string file1Words = textClient.GetWordsFromFile(stream);

                stream = file2.InputStream;
                string file2Words = textClient.GetWordsFromFile(stream);

                string score = textClient.GetSimilarityScore(file1Words, file2Words);

                simLabel.Text = score;
            } catch
            {
                Console.WriteLine("BOZO");
            }
        }

        protected void xmlBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}