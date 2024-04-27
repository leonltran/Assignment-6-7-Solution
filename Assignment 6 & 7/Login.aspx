<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment_6___7.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="Label2" runat="server" Text="Login to view project"></asp:Label>
        &nbsp;(TA is implemented plus test ones, TA: Cse44598)</p>
        <p>
            Username:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p>
            Password:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Width="107px" />
            <asp:Label ID="errLabel" runat="server"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Image ID="Image1" runat="server" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Enter the string here"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="New User? Sign Up Here!" Width="163px" />
        </p>
    </form>
</body>
</html>

<script language="C#" runat="server">
    void Button1_Click(Object sender, EventArgs e)
    {
        if (loginAuthenticate(TextBox1.Text, TextBox2.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, true);
        } 
    }
</script>