<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayListDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ProductDisplayList.ProductDisplayListDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Label ID="ErrorMsg" runat="server" CssClass="Error" Visible="false" />  

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
   
    <asiweb:StyledLabel translate="no" ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>

    <asiweb:Lister2 id="ResultsGrid" runat="server"       
        DeleteColumnLocation="None"        
        SelectColumnLocation="None"
        OnNeedDataSource="ResultsGridNeedDataSource"
        DisplayShortcut="ProductDisplay"
        HeaderVisible="false"
        EnableClientSideDelete="false"
        TargetPreserveStatefulBusinessContainer="true"
        AllowRowSelecting="false"
        OnItemDataBound="ResultsGridItemDataBound"
        DisableQueryEdit="true"
    />     
</asp:Panel>       

