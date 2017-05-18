<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfirmationDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ConfirmationDisplay.ConfirmationDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="order" TagName="ConfirmationEmail" Src="~/iParts/Commerce/OrderConfirmationDisplay/OrderConfirmationDisplayDisplay.ascx" %>
<div runat="server" id="DisplayMessage"></div>
<div class="DisplayNone">
    <order:ConfirmationEmail runat="server" ID="OrderConfirmationEmailItem" />
</div>
