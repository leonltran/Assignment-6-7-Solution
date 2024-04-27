using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Runtime.Serialization;

namespace Assignment_6___7.Protected
{
	public partial class Staff : Page
	{
		//base address
		Uri SERVICE1URI = new Uri("http://webstrar131.fulton.asu.edu/page1/Service1.svc");
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void HomeButton_Click(object sender, EventArgs e)
        {
			Response.Redirect("../Default.aspx");
		}

		protected void SearchMemberButton_Click(object sender, EventArgs e)
		{
			string username = SearchMemberInput.Text;
			if (FindMemberNode(username))
			{
				SearchMemberOutput.Text = "Member " + username + " exists.";
			}
			else
			{
				SearchMemberOutput.Text = "Member " + username + " does not exist.";
			}
		}

		protected void DeleteUserButton_Click(object sender, EventArgs e)
		{
			
			string username = DeleteUserInput.Text;
			bool userDeleted = DeleteMember(username);
		
			if (userDeleted)
			{
				DeleteUserOutput.Text = "Member " + username + " was deleted.";
			}
			else
			{
				DeleteUserOutput.Text = "Member " + username + " does not exist.";
			}
		}

		protected void AddUserButton_Click(object sender, EventArgs e)
		{
			string username = AddUserInputUser.Text;
			string password = AddUserInputPass.Text;
			AddUserOutput.Text = AddMember(username, password);
		}

		protected bool DeleteMember(string username)
		{
			bool userDeleted = false;
			string fileLoc = HttpRuntime.AppDomainAppPath + @"\App_Data\Members.xml";

			XmlDocument xDoc = new System.Xml.XmlDocument();
			xDoc.Load(fileLoc);
			XmlNode node = xDoc.ChildNodes[1];
			XmlNodeList children = node.ChildNodes;
			foreach (System.Xml.XmlNode child in children)
			{
				//System.Diagnostics.Debug.WriteLine(child);
				if (child["user"].InnerText == username)
				{
					child.ParentNode.RemoveChild(child);
					xDoc.Save(fileLoc);
					userDeleted = true;
					break;
				}
			}
			return userDeleted;
		}

		protected bool FindMemberNode(string username)
		{
			string fileLoc = HttpRuntime.AppDomainAppPath + @"\App_Data\Members.xml";
			bool foundMember = false;
			if (System.IO.File.Exists(fileLoc))
			{
				FileStream fileStream = new FileStream(fileLoc, System.IO.FileMode.Open);
				XmlDocument xDoc = new XmlDocument();
				xDoc.Load(fileStream);
				XmlNode node = xDoc.ChildNodes[1];
				XmlNodeList children = node.ChildNodes;
				foreach (XmlNode child in children)
				{
					//System.Diagnostics.Debug.WriteLine(child);
					if (child["user"].InnerText == username)
					{
						foundMember = true;
						break;
					}
				}
				fileStream.Close();
			}
			else
			{
				System.Diagnostics.Debug.WriteLine("File does not exist");
			}
			return foundMember;
		}

		protected string AddMember(string username, string password)
		{
			string fileLoc = HttpRuntime.AppDomainAppPath + @"\App_Data\Members.xml";
			bool foundMember = false;
			string output = "";
			if (File.Exists(fileLoc))
			{
				FileStream fileStream = new FileStream(fileLoc, System.IO.FileMode.Open);
				XmlDocument xDoc = new XmlDocument();
				xDoc.Load(fileStream);
				XmlNode node = xDoc.ChildNodes[1];
				XmlNodeList children = node.ChildNodes;
				foreach (XmlNode child in children)
				{
					//System.Diagnostics.Debug.WriteLine(child);
					if (child["user"].InnerText == username)
					{
						foundMember = true;
						break;
					}
				}

				if (foundMember)
				{
					output = "Member with that username already exists.";
					fileStream.Close();
					return output;
				}
				else
				{
					using(XmlWriter writer = node.CreateNavigator().AppendChild())
					{
						writer.WriteStartElement("User");
						writer.WriteElementString("user", "",username);
						writer.WriteElementString("pass", "",password);
						writer.WriteEndElement();
					}
					fileStream.Close();
					xDoc.Save(fileLoc);
					output = "Member added.";
				}
			}
			else
			{
				System.Diagnostics.Debug.WriteLine("File does not exist");
			}
			return output;
		}

		protected void XMLFilter_Click(object sender, EventArgs e)
		{
			string input = XMLFilterInput.Text;
			UriTemplate uriTemplate = new UriTemplate("XMLFilter?input={input}");

			Uri funcUri = uriTemplate.BindByPosition(SERVICE1URI, new string[] { input });
			WebClient webClient = new WebClient();
			byte[] bytes = webClient.DownloadData(funcUri);
			Stream stream = new MemoryStream(bytes);
			DataContractSerializer dataContractSerializer = new DataContractSerializer(typeof(string));
			XMLFilterOutput.Text = dataContractSerializer.ReadObject(stream).ToString();
		}
	}
}