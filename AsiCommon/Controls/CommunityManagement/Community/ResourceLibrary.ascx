<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Community_ResourceLibrary" Codebehind="ResourceLibrary.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="DocumentExplorer" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asiweb:PanelTemplateControl2 ID="ResourceLibraryPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
  
    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

    <uc1:DocumentExplorer id="ObjectBrowser1" Runat="server" Height="300px" />
    <asiweb:StyledLabel ID="lblDesignModeMessage" runat="server" Visible="false" />           
     
</asiweb:PanelTemplateControl2>