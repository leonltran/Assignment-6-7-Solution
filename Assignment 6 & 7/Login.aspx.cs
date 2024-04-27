using PasswordHash;
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
                string fLocation = Path.Combine(Request.PhysicalApplicationPath, @"App_Data\Members.xml");
                if (File.Exists(fLocation))
                {
                    FileStream FS = new FileStream(fLocation, FileMode.Open);
                    XmlDocument xd = new XmlDocument();
                    xd.Load(FS);
                    FS.Close();

                    XmlNodeList users = xd.SelectNodes("//User");

                    foreach (XmlNode user in users)
                    {

                        string userUsername = user.SelectSingleNode("Username").InnerText;
                        string userPassword = user.SelectSingleNode("Password").InnerText;
                        string userSalt = user.SelectSingleNode("Salt").InnerText;

                        password = PassHash.Hash(password, userSalt); // hash password with retrieved salt to compare to stored values

                        if (userUsername == username)
                        {
                            if (userPassword == password)
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
            } 
            else
            {
                if (Session["generatedString"].Equals(TextBox3.Text))
                {
                    string fLocation = Path.Combine(Request.PhysicalApplicationPath, @"App_Data\Members.xml");
                    if (File.Exists(fLocation))
                    {
                        FileStream FS = new FileStream(fLocation, FileMode.Open);
                        XmlDocument xd = new XmlDocument();
                        xd.Load(FS);
                        FS.Close();

                        XmlNodeList users = xd.SelectNodes("//User");

                        foreach (XmlNode user in users)
                        {

                            string userUsername = user.SelectSingleNode("Username").InnerText;
                            string userPassword = user.SelectSingleNode("Password").InnerText;

                            if (userUsername == username)
                            {
                                if (userPassword == password)
                                {
                                    errLabel.Text = "Account exists, please login.";
                                    return false;
                                }
                            }
                        }

                        XmlNode root = xd.DocumentElement;
                        XmlNode newUser = xd.CreateElement("User");

                        XmlNode newUsername = xd.CreateElement("Username");
                        newUsername.InnerText = username;
                        newUser.AppendChild(newUsername);

                        // generate salt
                        // https://stackoverflow.com/questions/1344221/how-can-i-generate-random-alphanumeric-strings
                        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                        var stringChars = new char[16];
                        var random = new Random();
                        for (int i = 0; i < stringChars.Length; i++)
                        {
                            stringChars[i] = chars[random.Next(chars.Length)];
                        }
                        var salt = new String(stringChars);


                        XmlNode newPassword = xd.CreateElement("Password");
                        newPassword.InnerText = PassHash.Hash(password, salt);
                        newUser.AppendChild(newPassword);

                        XmlNode newSalt = xd.CreateElement("Salt");
                        newSalt.InnerText = salt;
                        newUser.AppendChild(newSalt);

                        root.AppendChild(newUser);
                        xd.Save(fLocation);

                        

                        HttpCookie cookies = new HttpCookie("loginCookies");
                        cookies["Username"] = username;
                        cookies["Password"] = password;
                        cookies.Expires = DateTime.Now.AddMonths(6);
                        Response.Cookies.Add(cookies);

                        Response.Redirect("~/SiteMember/Member.aspx");

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