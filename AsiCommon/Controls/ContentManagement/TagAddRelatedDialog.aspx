<%@ Page Language="C#" AutoEventWireup="True" Inherits="Asi.Web.UI.Common.ContentManagement.TagAddRelatedDialog" Codebehind="TagAddRelatedDialog.aspx.cs" %>
<%@ Register Src="TagAddRelated.ascx" TagName="TagAddRelated" TagPrefix="uc2" %>

<asp:Content id="TreeContent" runat="server" ContentPlaceHolderID="TemplateBody">
<asp:Panel id="ContentPanel" runat="server" Visible="true" >
<div style="width:100%">
       <uc2:TagAddRelated ID="TagAddRelated1" runat="server"></uc2:TagAddRelated>    
</div>
</asp:Panel>
</asp:Content>
