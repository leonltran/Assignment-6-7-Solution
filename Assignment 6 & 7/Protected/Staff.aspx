<%@ Page Title="Staff Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Assignment_6___7.Protected.Staff" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<main>
		<h1><%: Title %></h1>

		<div>
			<div>
				<asp:Button ID="HomeButton" runat="server" Text="Home" OnClick="HomeButton_Click" />
			</div>
			<div>
				<% Response.Write("You are logged in as " + Context.User.Identity.Name + "."); %>
			</div>
		</div>
		<div style="height: 20px"></div>
		<div>
			<div>
				<asp:Label ID="SearchMemberLabel" runat="server" Text="Searches Members.xml for the user inputted."></asp:Label>
			</div>
			<div>
				<asp:TextBox ID="SearchMemberInput" runat="server" Style="width: 100%"></asp:TextBox>
			</div>
			<div>
				<asp:Button ID="SearchMemberButton" runat="server" Text="Run SearchMember" OnClick="SearchMemberButton_Click" />
			</div>
			<div>
				<asp:Label ID="SearchMemberOutput" runat="server" Text="Result goes here."></asp:Label>
			</div>
		</div>
		<div style="height: 20px"></div>
		<div>
			<div>
				<div>
					<asp:Label ID="DeleteUserLabel" runat="server" Text="Searches Members.xml for the user inputted, and deletes them."></asp:Label>
				</div>
				<div>
					<asp:TextBox ID="DeleteUserInput" runat="server" Style="width: 100%"></asp:TextBox>
				</div>
				<div>
					<asp:Button ID="DeleteUserButton" runat="server" Text="Run DeleteUser" OnClick="DeleteUserButton_Click" />
				</div>
				<div>
					<asp:Label ID="DeleteUserOutput" runat="server" Text="Result goes here."></asp:Label>
				</div>
			</div>
		</div>
		<div style="height: 20px"></div>

		<div>
			<div>
				<div>
					<asp:Label ID="AddUserLabel" runat="server" Text="Adds a new user to Members.xml"></asp:Label>
				</div>
				<div>
					Username:
					<asp:TextBox ID="AddUserInputUser" runat="server" Style="width: 100%"></asp:TextBox>
				</div>
				<div>
					Password:
					<asp:TextBox ID="AddUserInputPass" runat="server" Style="width: 100%"></asp:TextBox>
				</div>
				<div>
					<asp:Button ID="AddUserButton" runat="server" Text="Run AddUser" OnClick="AddUserButton_Click" />
				</div>
				<div>
					<asp:Label ID="AddUserOutput" runat="server" Text="Result goes here."></asp:Label>
				</div>
			</div>
		</div>
		<div style="height: 20px"></div>

		<h1>Services (RESTful)</h1>
		<div>
			Service URL: <a href="http://webstrar131.fulton.asu.edu/page1/Service1.svc">http://webstrar131.fulton.asu.edu/page1/Service1.svc</a>
		</div>
		<div style="height: 20px"></div>
		<div>
			<div>
				<asp:Label ID="Label5" runat="server" Text="string XMLFilter(string input)"></asp:Label>
			</div>
			<div>
				<asp:Label ID="Label9" runat="server" Text="/XMLFilter?input={input}"></asp:Label>
			</div>
			<div>
				<asp:Label ID="XMLFilterLabel" runat="server" Text="This service takes a XML document string(of format '[Members][User][childNode1][childNode2][/][/][/][User][...][/][/]' and filters out XML nodes."></asp:Label>
			</div>
			<div>
				<asp:TextBox ID="XMLFilterInput" runat="server" TextMode="MultiLine" Style="width: 100%"></asp:TextBox>
			</div>
			<div>
				<asp:Button ID="XMLFilterButton" runat="server" Text="Run XMLFilter" OnClick="XMLFilter_Click" />
			</div>
			<div>
				<asp:Label ID="XMLFilterOutput" runat="server" Text="Result goes here."></asp:Label>
			</div>
		</div>
	</main>


</asp:Content>
