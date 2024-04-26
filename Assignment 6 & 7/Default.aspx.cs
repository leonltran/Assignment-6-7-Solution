using PasswordHash;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;

namespace Assignment_6___7
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHash_Click(object sender, EventArgs e)
        {
            // https://stackoverflow.com/questions/1344221/how-can-i-generate-random-alphanumeric-strings
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[16];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }



            var pass = txtPass.Text;
            var salt = new String(stringChars);
            txtHash.Text = PassHash.Hash(pass, salt); 
        }

        protected void btnEncode_Click(object sender, EventArgs e)
        {
            String text = txtToEncode.Text;

            // URI 
            Uri baseUri = new Uri("http://webstrar131.fulton.asu.edu/page4/RESTfulService.svc");
            UriTemplate myTemplate = new UriTemplate("TextEncode?text={text}");
            Uri completeUri = myTemplate.BindByPosition(baseUri, text);

            // create connection
            WebClient channel = new WebClient();

            // access RESTful service
            byte[] abc = channel.DownloadData(completeUri); // return byte array
            Stream strm = new MemoryStream(abc); // convert to mem stream
            DataContractSerializer obj = new DataContractSerializer(typeof(string));
            string randString = obj.ReadObject(strm).ToString(); // convert to string


            txtEncoded.Text = randString;
        }

        protected void btnTime_Click(object sender, EventArgs e)
        {
            txtTime.Text = Session["timeStart"].ToString();
        }
    }
}