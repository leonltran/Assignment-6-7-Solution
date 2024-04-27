using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Assignment_6___7
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Button1.Text == "Login")
            {
                Image1.Visible = false;
                Label1.Visible = false;
                TextBox3.Visible = false;
            } else
            {
                Image1.Visible = true;
                Label1.Visible = true;
                TextBox3.Visible = true;
            }
            
            Image1.ImageUrl = "~/imageProcess.aspx";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string location = HttpRuntime.AppDomainAppPath + @"\App_Data\Member.xml";

            //string username = TextBox1.Text;
            //string password = TextBox2.Text;

            //XmlDocument xmlDocument = new XmlDocument();
            //xmlDocument.Load(location);
            //XmlElement root = xmlDocument.DocumentElement;

            //foreach (XmlNode node in xmlDocument.ChildNodes)
            //{
            //    if (node["username"].InnerText == username)
            //    {
            //        if (node["password"].InnerText == password)
            //        {
            //            HttpCookie cookies = new HttpCookie("loginCookies");
            //            cookies["Username"] = TextBox1.Text;
            //            cookies["Password"] = TextBox2.Text;
            //            cookies.Expires = DateTime.Now.AddMonths(6);
            //            Response.Cookies.Add(cookies);
            //            Response.Redirect("Member.aspx");
            //            return;
            //        }
            //        else
            //        {
            //            errLabel.Text = "Username and password do not match";
            //        }
            //    }
            //}
           
        }

        public bool loginAuthenticate(string username, string password)
        {

            if (Button1.Text == "Login")
            {
                string fLocation = Path.Combine(Request.PhysicalApplicationPath, @"App_Data\Member.xml");
                if (File.Exists(fLocation))
                {
                    FileStream FS = new FileStream(fLocation, FileMode.Open);
                    XmlDocument xd = new XmlDocument();
                    xd.Load(FS);
                    FS.Close();

                    XmlNodeList members = xd.SelectNodes("//Member");

                    foreach (XmlNode member in members)
                    {

                        string memberUsername = member.SelectSingleNode("Username").InnerText;
                        string memberPassword = member.SelectSingleNode("Password").InnerText;

                        if (memberUsername == username)
                        {
                            if (memberPassword == password)
                            {
                                HttpCookie cookies = new HttpCookie("loginCookies");
                                cookies["Username"] = username;
                                cookies["Password"] = password;
                                cookies.Expires = DateTime.Now.AddMonths(6);
                                Response.Cookies.Add(cookies);
                                //Response.Redirect("Member.aspx");
                                return true;
                            }
                            else
                            {
                                errLabel.Text = "Username and password do not match";
                                return false;
                            }
                        }
                        else
                        {
                            errLabel.Text = "Username and password do not match";
                            return false;
                        }
                    }
                }
                return false;
            } else
            {
                if (Session["generatedString"].Equals(TextBox3.Text))
                {
                    string fLocation = Path.Combine(Request.PhysicalApplicationPath, @"App_Data\Member.xml");
                    if (File.Exists(fLocation))
                    {
                        FileStream FS = new FileStream(fLocation, FileMode.Open);
                        XmlDocument xd = new XmlDocument();
                        xd.Load(FS);
                        FS.Close();

                        XmlNodeList members = xd.SelectNodes("//Member");

                        foreach (XmlNode member in members)
                        {

                            string memberUsername = member.SelectSingleNode("Username").InnerText;
                            string memberPassword = member.SelectSingleNode("Password").InnerText;

                            if (memberUsername == username)
                            {
                                if (memberPassword == password)
                                {
                                    errLabel.Text = "Account exists, please login.";
                                    return false;
                                }
                            }
                        }

                        XmlNode root = xd.DocumentElement;
                        XmlNode newMember = xd.CreateElement("Member");

                        XmlNode newUsername = xd.CreateElement("Username");
                        newUsername.InnerText = username;
                        newMember.AppendChild(newUsername);

                        XmlNode newPassword = xd.CreateElement("Password");
                        newPassword.InnerText = password;
                        newMember.AppendChild(newPassword);

                        root.AppendChild(newMember);
                        xd.Save(fLocation);

                        HttpCookie cookies = new HttpCookie("loginCookies");
                        cookies["Username"] = username;
                        cookies["Password"] = password;
                        cookies.Expires = DateTime.Now.AddMonths(6);
                        Response.Cookies.Add(cookies);

                        Response.Redirect("Member.aspx");

                    }
                    return false;
                }
                else
                {
                    errLabel.Text = "CAPTCHA invalid, please retry";
                    return false;
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Button2.Text == "Go back to login")
            {
                Image1.Visible = false;
                Label1.Visible = false;
                TextBox3.Visible = false;
                Button2.Text = "New User? Sign Up Here!";
                Button1.Text = "Login";
                Label2.Text = "Login to view project";
            } else
            {
                Image1.Visible = true;
                Label1.Visible = true;
                TextBox3.Visible = true;
                Button2.Text = "Go back to login";
                Button1.Text = "Create Account";
                Label2.Text = "Signup to view project";
            }

        }
    }
}