<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryProfilePictureListDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.QueryProfilePictureList.QueryProfilePictureListDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" runat="server" />
    
    <asiweb:StyledLabel ID="errorLabel" CssClass="Error" runat="server" visible="false" />
               
    <div id="divDescription" runat="server" visible="false" />

    <asp:Placeholder id="ListPlaceholder" runat="server"></asp:Placeholder> 
    
    <div id="divNoRecordsFound" runat="server" visible="false" /> 
                  
</asp:Panel>       
