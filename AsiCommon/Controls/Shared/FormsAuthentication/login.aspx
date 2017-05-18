<%@ Page language="c#" Title="iMIS Login" Inherits="Asi.WebRoot.AsiCommon.Controls.Shared.FormsAuthentication.Login" Codebehind="Login.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="Login" Src="Login.ascx" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<script type="text/javascript">
		/* 
		Temporary frame breakout for login page. 
		Redirects back to requested target parent frame after authentication.
		*/
		try
		{
			if (parent !== self)
				self.parent.location.replace(document.URL.replace(/\?ReturnUrl=.*$/i, "?ReturnUrl=" + escape(parent.document.URL)));
		}
		catch(e){}
	</script>
    <div id="login">
	    <uc1:Login id="Login1" runat="server"></uc1:Login>
    </div>	
</asp:Content>
