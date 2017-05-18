<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.Documents" Codebehind="Documents.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server" />
<uc1:ObjectBrowser id="ObjectBrowser1" runat="server" OnLoad="ObjectBrowser1_Load" TypeFilter="FOL,TXT,HTM,DOC,PPT,XLS,PDF"
    ShowHierarchyTree="false" ShowContainers="true" ShowSummary="false" AllowMultiSelect="false"
    AllowUpwardNavigation="false" ShowFilename="false" />