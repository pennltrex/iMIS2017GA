<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentResults" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="SegmentResults.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:listmanager id="ListManager1" runat="server" CssClass="Grid"></asiweb:listmanager>
<asp:placeholder id="StatPlaceHolder1" runat="server"></asp:placeholder>
<asp:Button runat="server" id="addItemTrigger" style="display:none" Text=""></asp:Button>