<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.SetupOpportunityTypeDocuments" Codebehind="SetupOpportunityTypeDocuments.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="DocumentExplorer" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>
<div style="padding:5px;">
    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
    <uc1:DocumentExplorer id="DocumentExplorer1" runat="server"></uc1:DocumentExplorer>	
</div>