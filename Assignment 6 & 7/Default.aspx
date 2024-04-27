<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment_6___7._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">Default - Assignment 7</h1>
        </section>

        <div class="Table">
			<div class="TableRow">
				<b>Application and Components Summary Table</b>
			</div>
			<div class="TableRow">
				This page is at <a href="http://webstrar131.fulton.asu.edu/Page10/Default.aspx">http://webstrar131.fulton.asu.edu/Page10/Default.aspx </a>
			</div>
			<div class="TableRow">
				Percentage of contribution: <i>Aeric Plitz: 33.3%, Jackson Rhea: 33.3%, Leon Tran 33.3%</i>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Provider Name
				</div>
				<div class="ServiceCell Type">
					Page and component type, e.g., aspx, DLL, SVC, etc.
				</div>
				<div class="ServiceCell ComponentDescription">
					Service Description
				</div>
				<div class="ServiceCell ActualResources">
					Actual resources and methods used to implement the component and where this component is used.
				</div>
			</div>

			<%--Aeric--%>
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Aeric Plitz
				</div>
				<div class="ServiceCell Type">
					aspx page
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/Protected/Staff.aspx">Try It</a>
				</div>
				<div class="ServiceCell ComponentDescription">
					The Staff Page
				</div>
				<div class="ServiceCell ActualResources">
					GUI design and C# code behind GUI
				</div>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Aeric Plitz
				</div>
				<div class="ServiceCell Type">
					aspx page
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/StaffLogin.aspx">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					The Staff Login Page
				</div>
				<div class="ServiceCell ActualResources">
					GUI design and C# code behind GUI, is redirected to if attempting to access Staff.xml without auth
				</div>
			</div>
			
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Aeric Plitz
				</div>
				<div class="ServiceCell Type">
					XML file
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/App_Data/Staff.xml">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					The Staff Login Credentials
				</div>
				<div class="ServiceCell ActualResources">
					Linked to Staff Login page
				</div>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Aeric Plitz
				</div>
				<div class="ServiceCell Type">
					XML file
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/App_Data/Members.xml">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					Stand-in for Member login credentials
				</div>
				<div class="ServiceCell ActualResources">
					Linked to Staff page to allow for XML file manipulation testing.
				</div>
			</div>
			
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Aeric Plitz
				</div>
				<div class="ServiceCell Type">
					SVC service(RESTful)
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/Protected/Staff.aspx">Try It</a>
				</div>
				<div class="ServiceCell ComponentDescription">
					Output user/pass from Members xml file
				</div>
				<div class="ServiceCell ActualResources">
					Linked to Staff page
					For full application it will be edited to not display passwords
				</div>
			</div>
			
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Aeric Plitz
				</div>
				<div class="ServiceCell Type">
					Cookies
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/Protected/Staff.aspx">Try It</a>
				</div>
				<div class="ServiceCell ComponentDescription">
					Staff Login Cookies
				</div>
				<div class="ServiceCell ActualResources">
					Utilizing persistant as detailed in the slides
				</div>
			</div>

			
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Aeric Plitz
				</div>
				<div class="ServiceCell Type">
					XML manipulation
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/Protected/Staff.aspx">Try It</a>
				</div>
				<div class="ServiceCell ComponentDescription">
					Members.xml manipulation(search, add, delete)
				</div>
				<div class="ServiceCell ActualResources">
					C# code behind usage, search, add, and delete are all implemented.
				</div>
			</div>

			<%--Jackson--%>
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Jackson Rhea
				</div>
				<div class="ServiceCell Type">
					aspx page
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/Login.aspx">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					The Login Page (Has signup option)
				</div>
				<div class="ServiceCell ActualResources">
					GUI design and C# code behind GUI
				</div>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Jackson Rhea
				</div>
				<div class="ServiceCell Type">
					aspx page
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/SiteMember/Member.aspx">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					The Member Page (Contains Service)
				</div>
				<div class="ServiceCell ActualResources">
					GUI design, C# code behind it, should be redirected if not logged in via cookies
				</div>
			</div>
			
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Jackson Rhea
				</div>
				<div class="ServiceCell Type">
					Members.xml file
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/SiteMember/Member.aspx">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					To view xml file I put it on the member page, will be able to see it update with each signup
				</div>
				<div class="ServiceCell ActualResources">
					Textbox containing entire member.xml file
				</div>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Jackson Rhea
				</div>
				<div class="ServiceCell Type">
					Captcha
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/Login.aspx">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					In signup option there will be a captcha that needs to be completed
				</div>
				<div class="ServiceCell ActualResources">
					Links to login page to show captcha (must click signup)
				</div>
			</div>
			
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Jackson Rhea
				</div>
				<div class="ServiceCell Type">
					SVC service WSDL
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page7/Service1.svc">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					Compare two text files and get similarity score between them
				</div>
				<div class="ServiceCell ActualResources">
					Linked to Member page
				</div>
			</div>
			
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Jackson Rhea
				</div>
				<div class="ServiceCell Type">
					Cookies
				</div>
				<div class="ServiceCell TryIt">
					<a href="http://webstrar131.fulton.asu.edu/Page10/Login.aspx">Try It </a>
				</div>
				<div class="ServiceCell ComponentDescription">
					Member Login Cookies
				</div>
				<div class="ServiceCell ActualResources">
					Utilizing persistant via slide info
				</div>
			</div>

			<%--Leon--%>
			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Leon Tran
				</div>
				<div class="ServiceCell Type">
					Default.aspx
				</div>
				<div class="ServiceCell TryIt">
					You are here!
				</div>
				<div class="ServiceCell ComponentDescription">
					Default public page, main website entry point that links to other pages
				</div>
				<div class="ServiceCell ActualResources">
					GUI design and C# code
				</div>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Leon Tran
				</div>
				<div class="ServiceCell Type">
					Global.asax event handler
				</div>
				<div class="ServiceCell TryIt">
				You are here!
				</div>
				<div class="ServiceCell ComponentDescription">
					Event handler that fires with every session start.
				</div>
				<div class="ServiceCell ActualResources">
					Back-end C# code linked to Default.aspx
				</div>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Leon Tran
				</div>
				<div class="ServiceCell Type">
					Hashing DLL
				</div>
				<div class="ServiceCell TryIt">
				You are here!
				</div>
				<div class="ServiceCell ComponentDescription">
					Password hashing function:
					Input: string
					Output: string
				</div>
				<div class="ServiceCell ActualResources">
					C# Class Library, added as .dll; will be used to save hashed passwords in XML
				</div>
			</div>

			<div class="ServiceRow">
				<div class="ServiceCell ProviderName">
					Leon Tran
				</div>
				<div class="ServiceCell Type">
					SVC Service (RESTful)
				</div>
				<div class="ServiceCell TryIt">
				You are here!
				</div>
				<div class="ServiceCell ComponentDescription">
					string TextEncode(string text); Encodes a plaintext string in Base64.
				</div>
				<div class="ServiceCell ActualResources">
					C# RESTful Service, used in Default.aspx
				</div>
			</div>


		</div>

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