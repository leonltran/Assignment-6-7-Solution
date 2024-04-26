<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment_6___7._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">A6 Component Table and TryIt Page</h1>
        </section>

                <asp:Table ID="Table1" runat="server"
                CellPadding="4" 
                GridLines="Both"
                HorizontalAlign="Center">

                <asp:TableRow runat="server">  
                    <asp:TableCell runat="server" ColumnSpan="4"><b>Application and Components Summary Table</b></asp:TableCell>
                </asp:TableRow>  

                <asp:TableRow runat="server" BackColor="#CCCCCC">  
                    <asp:TableCell runat="server"  ColumnSpan="4">The application is deployed at: http://webstrar131.fulton.asu.edu/page5/Default.aspx</asp:TableCell> 
                </asp:TableRow>  

                <asp:TableRow runat="server">  
                    <asp:TableCell runat="server"  ColumnSpan="4">Percentage of contribution: Leon Tran: 100% (individual)
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server" BackColor="#CCCCCC">  
                    <asp:TableCell runat="server" style="width:20%">Provider name</asp:TableCell>
                    <asp:TableCell runat="server" style="width:20%">Page and component type, e.g., aspx, DLL, SVC, etc.</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">Component description: What does the component do? What are input/parameter and output/return value?</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">Actual resources and methods used to implement the component and where this component is used.</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">  
                    <asp:TableCell runat="server" style="width:20%">Leon Tran</asp:TableCell>
                    <asp:TableCell runat="server" style="width:20%">Default.aspx</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">Default public page, main website entry point that links to other pages</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">GUI design and C# code</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server" BackColor="#CCCCCC">  
                    <asp:TableCell runat="server" style="width:20%">Leon Tran</asp:TableCell>
                    <asp:TableCell runat="server" style="width:20%">Global.asax event handler</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">Event handler that fires with every session start. Will eventually be used for session-specific needs</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">Back-end C# codem linked to Default.aspx</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">  
                    <asp:TableCell runat="server" style="width:20%">Leon Tran</asp:TableCell>
                    <asp:TableCell runat="server" style="width:20%">DLL</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">Password hashing function:<br />Input: string<br />Output: string</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">C# Class Library, added as .dll; will be used to save hashed passwords in XML</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server" BackColor="#CCCCCC">  
                    <asp:TableCell runat="server" style="width:20%">Leon Tran</asp:TableCell>
                    <asp:TableCell runat="server" style="width:20%">SVC Service</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">string TextEncode(string text); Encodes a plaintext string in Base64.</asp:TableCell>
                    <asp:TableCell runat="server" style="width:30%">C# RESTful Service, used in Default.aspx</asp:TableCell>
                </asp:TableRow>

            </asp:Table>

        <br />

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Global.asax Handler</h2>
                <p>
                    The Session_Start event handler records the time a user&#39;s session started. You can check it here; this event handler will likely be used for something more application specific later. Feel free to open an incognito tab to check with a new timestamp as that will start a new session.</p>
                <p><asp:Button ID="btnTime" runat="server" Text="Get Session Start Time" OnClick="btnTime_Click"/></p>
                <p><asp:TextBox ID="txtTime" runat="server" style="width:100%" ></asp:TextBox></p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">.dll Class Library</h2>
                <p>
                    DLL class library that provides the password hashing function using a random salt
                </p>
                <p><asp:TextBox ID="txtPass" runat="server" style="width:100%" ></asp:TextBox></p>
                <p><asp:Button ID="btnHash" runat="server" Text="Hash Password" OnClick="btnHash_Click" /></p>
                <p><asp:TextBox ID="txtHash" runat="server" TextMode="MultiLine" style="width:100%" ></asp:TextBox></p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">Web Service</h2>
                <p>
                    WSDL Web Service from Assignment 3/4. Encodes any plaintext string with Base64.
                </p>
                <p><asp:TextBox ID="txtToEncode" runat="server" style="width:100%" ></asp:TextBox></p>
                <p><asp:Button ID="btnEncode" runat="server" Text="Encode" OnClick="btnEncode_Click"/></p>
                <p><asp:TextBox ID="txtEncoded" runat="server" TextMode="MultiLine" style="width:100%" ></asp:TextBox></p>
            </section>
        </div>
    </main>

</asp:Content>
