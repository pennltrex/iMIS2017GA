<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.DocumentLoadUtility.DocumentDownloader" AutoEventWireup="true" Codebehind="DocumentDownloader.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asp:Label id="DownloadLabel" runat="server">Label</asp:Label>&nbsp;
<asp:Label id="FileName" runat="server"></asp:Label>
<asiweb:StyledButton runat="server" value="DownloadButton" id="DownloadButton" name="DownloadButton" onserverclick="DownloadButton_ServerClick" />
