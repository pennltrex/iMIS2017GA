<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FriendraisingImporterDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.FriendraisingImporter.FriendraisingImporterDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />

    <div>
        <asiweb:StyledLabel ID="ErrorLabel" runat="server" Text="" CssClass="Error"></asiweb:StyledLabel>                        
        <asiweb:StyledLabel ID="InfoLabel" runat="server" Text="" CssClass="Info"></asiweb:StyledLabel>                        
    </div>
    
    <asiweb:PanelTemplateControl ID="Ex3Fields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None"  GroupingText="top"   >
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn3" runat="server" LabelWidth="19em"  >
            <asp:Button runat="server" ID="DownloadButton" OnClick="DownloadButtonClick" />
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>    
</asp:Panel>       
