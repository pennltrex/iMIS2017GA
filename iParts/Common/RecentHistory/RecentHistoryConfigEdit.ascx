<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentHistoryConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.RecentHistory.RecentHistoryConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl ID="contactUserDefinedPanelsEdit" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
    <asiweb:SmartControl ID="MaxDisplayCount" runat="server" BoundPropertyName="MaxDisplayCount" DisplayCaption="true" AutoPostBack="true"
        DataSaveUponStateChange="false" /> 
    <div class="AutoWidth">
        <asiweb:SmartControl ID="ShowAllTypes" runat="server" BoundPropertyName="ShowAllTypes" DisplayCaption="true" AutoPostBack="true"
        DataSaveUponStateChange="false" PositionCaption="Top">
            <div class="SubItems">
                <asiweb:MultiSelectControl2 id="typeSelector" Height="200px" Width="250px" runat="server" Visible="false" NoneSelectedText='<%# Asi.ResourceManager.GetPhrase("Asi.Web.iParts.RecentHistory.TypeSelector", "Select one or more types") %>' /> 
                <asp:Label ID="selectedTypesError" runat="server" CssClass="Error" Visible="false" Text='<%#Asi.ResourceManager.GetPhrase("Asi.Web.iParts.AvailableTypesError", "You must select at least one available type") %>'/>
            </div>
        </asiweb:SmartControl>
    </div>
    
    <div class="AutoWidth">
        <asiweb:SmartControl ID="AllowChangingType" runat="server" BoundPropertyName="AllowChangingType" DisplayCaption="true" AutoPostBack="true"
            DataSaveUponStateChange="false" PositionCaption="Right" />    
        <asiweb:SmartControl ID="StaffOnly" runat="server" BoundPropertyName="StaffOnly" DisplayCaption="true" AutoPostBack="true"
            DataSaveUponStateChange="false" PositionCaption="Right" />      
    </div>
</asiweb:PanelTemplateControl>