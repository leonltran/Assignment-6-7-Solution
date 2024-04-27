using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_6___7
{
	public partial class StaffLogin : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Login(object sender, EventArgs e)
		{
			if (LoginAuth(UserNameInput.Text, PasswordInput.Text))
				FormsAuthentication.RedirectFromLoginPage(UserNameInput.Text, Persistent.Checked); //cookie
			else
				Output.Text = "Username or Password is incorrect.";
		}
		protected bool LoginAuth(string username, string password)
		{
			string fileLoc = HttpRuntime.AppDomainAppPath + @"\App_Data\Staff.xml";
			bool auth = false;

			if (File.Exists(fileLoc))
			{
				FileStream fileStream = new FileStream(fileLoc, FileMode.Open);
				System.Xml.XmlDocument xDoc = new System.Xml.XmlDocument();
				xDoc.Load(fileStream);
				System.Xml.XmlNode node = xDoc.ChildNodes[1];
				System.Xml.XmlNodeList children = node.ChildNodes;
				foreach (System.Xml.XmlNode child in children)
				{
					//System.Diagnostics.Debug.WriteLine(child);
					if (child["user"].InnerText == username)
					{
						/// todo do hashing stuff
						if (child["pass"].InnerText == password)
						{
							auth = true; break;
						}
					}
				}
				fileStream.Close();
			}
			else
			{
				System.Diagnostics.Debug.WriteLine("File does not exist");
			}
			return auth;
		}
	}
}