<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Assignment_6___7._Member" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">Member Page: </h1>
            <p>Logged in as user:
                <asp:Label ID="userLabel" runat="server"></asp:Label>
            </p>
            <p>This page is only accessible by people who have logged in and/or signed up which involves passing a captcha test. We will encrypt/hash the password through the DLL function that is implemented in this page as well. (I was not responsible for DLL hashing so it will be implemented in A7)</p>
            <p>&nbsp;</p>
            <p>A list of services this page offers: File Similarity, Service 2, Service 3</p>
            <p>&nbsp;</p>
            <p>Service 1: File Similarity Score</p>
            <p>File Similarity: Submit two txt files max of 5000 characters each and get a similarity score between them<br />
                &nbsp;- Uses online api to do this<br />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:FileUpload ID="FileUpload2" runat="server" />
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Get Similarity" />
                <asp:Label ID="simLabel" runat="server" Text="Similarity Here"></asp:Label>
            </p>
            <p>&nbsp;</p>
            <p>Service 2: </p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>Service 3:
                </p>
            <p>&nbsp;</p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="XML FILE HERE (Proof of component)"></asp:Label>
            </p>
            <p>
                <br />
                <asp:TextBox ID="xmlBox" runat="server" Height="357px" OnTextChanged="xmlBox_TextChanged" TextMode="MultiLine" Width="451px"></asp:TextBox>
            </p>
        </section>
    </main>

</asp:Content>
