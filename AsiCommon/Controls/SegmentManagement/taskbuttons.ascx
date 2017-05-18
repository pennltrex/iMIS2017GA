<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.TaskButtons" Codebehind="TaskButtons.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>

<asiweb:StyledButton ID="btnNew" runat="server" Text="New Job" OnClick="btnNew_ServerClick" />
<asiweb:StyledButton ID="btnClose" visible=false runat="server" Text="Close" OnClick="btnClose_ServerClick" />
