<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WordMergeEngine.WordMergePreview" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WordMergePreview.ascx.cs" %>

<asp:placeholder id="Placeholder1" runat="server"></asp:placeholder>
 
 <script text=javascript>
    // window.status= 'Please wait 1 to 2 minutes for the Word Merge control to load' ;
 </script>
<table class="DataTable" cellspacing="1" cellpadding="2" border="0" width="100%">
	<tr>
		<td class="Value" valign="top">
<object id=EditMergeWinControl width="100%" 
classid="<% = Asi.Web.Utilities.GetDocumentBaseUri() %>DownloadBin/Asi.Windows.Controls.WordMerge.dll#Asi.Windows.Controls.WordMerge.WordMergeExec" standby="Loading the Word Merge control, please wait ..." viewastext>
	<PARAM NAME="AppPrincipalState" VALUE="<% = Asi.Security.AppPrincipal.SerializeAppPrincipal() %>">
	<PARAM NAME="ProcessEngineString" VALUE="<% = this.SerializePE() %>">
	<PARAM NAME="HostCookies" VALUE="<% = this.SerializeCookies() %>">
	<PARAM NAME="HostDomain" VALUE="<% = this.HostDomain() %>">
	<param name="WebApplicationPath" value="<% = Asi.Web.Utilities.GetDocumentBaseUri() %>">
	The Word Merge Executor was unable to load.  Please check the client's installed version of the .Net Framework (should be Framework version 1.1).
</object>
		</td>
	</tr>
</table>
 
 
    





  
 