<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="Assignment6_WebApplication1.StaffLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<main aria-labelledby="title">
      <%--  <h2 id="title"><%: Title %>.</h2> --%>
        <h2>Login to your Staff account to continue to the Staff page.</h2>

		<table cellpadding="8">
		<tr> <td>User Name:</td>
		<td> <asp:TextBox ID="UserNameInput" runat="server" /></td> </tr>
		<tr> <td> Password: </td>
		<td><asp:TextBox ID="PasswordInput" TextMode="password" runat="server" /> </td> </tr>
		<tr>
		<td><asp:Button Text="Log In" OnClick="Login" runat="server" /></td>
		<td><asp:CheckBox Text="Keep me signed in" ID="Persistent"
		runat="server"/> </td>
		</tr>
		</table>

		<p>TA login information is implemented(TA, Cse44598)</p>

		<hr> <h3><asp:Label ID="Output" runat="server" /></h3>
	</main>
</asp:Content>

