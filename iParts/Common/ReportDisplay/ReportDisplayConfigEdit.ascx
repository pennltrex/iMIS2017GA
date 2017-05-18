<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.ReportDisplay.ReportDisplayConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web"  %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowPDFButtonControl" runat="server" BoundPropertyName="ShowPDFButton" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />        
        <asiweb:SmartControl 
            ID="ShowExcelButtonControl" runat="server" BoundPropertyName="ShowExcelButton" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            TextBoxWidth="20em" ID="ReportTemplatePathControl" runat="server" BoundPropertyName="ReportTemplatePath" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="false" 
            OnDataChange="ReportTemplatePathControlDataChanged" />
        <asiweb:SmartControl 
            ID="HideParameterPanelControl" runat="server" BoundPropertyName="HideParameterPanel" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
    <div style="clear: both;"/>
    <div class="ShowFieldset">
        <fieldset>
            <legend>Toolbar</legend> 
            <div class="PanelFieldValue AutoWidth FloatLeft">
                <asp:RadioButton runat="server" ID="HideNone" GroupName="HideToolbarItem" Text="Display full toolbar" />
            </div><br/>
            <div class="PanelFieldValue AutoWidth FloatLeft">
                <asp:RadioButton runat="server" ID="HideToolbar" GroupName="HideToolbarItem" Text="Hide the toolbar" />
            </div><br/>
            <div class="PanelFieldValue AutoWidth FloatLeft">
                <asp:RadioButton runat="server" ID="HidePageNavigationControls" GroupName="HideToolbarItem" Text="Hide the page navigation controls on the toolbar" />
            </div><br/>
            <div class="PanelFieldValue AutoWidth FloatLeft">
                <asp:RadioButton runat="server" ID="HideAllButPrint" GroupName="HideToolbarItem" Text="Hide all toolbar controls except the Print button" />
            </div>
        </fieldset>
    </div>
    <div style="clear: both;"/>
    <div>&nbsp;</div>
    <div class="AutoWidth">
        <asp:UpdatePanel runat="server" ID="updatePanel">
            <ContentTemplate>
                <asiweb:SmartControl 
                    runat="server" ID="DisplayForAuthorizedUsersOnly" EnableAjaxPostback="True" AutoPostBack="True"
                    BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="True"
                    PositionCaption="Right" DataSaveUponStateChange="False" />
                <asiweb:SmartControl 
                    ID="HasParametersInUrlControl" runat="server" EnableAjaxPostback="True" AutoPostBack="True" BoundPropertyName="HasParametersInUrl"
                    DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
                <div class="SubItems"> 
                        <asiweb:SmartControl runat="server" ID="HideParametersIfInUrl" EnableAjaxPostback="True" AutoPostBack="True"
                            BoundPropertyName="HideParametersIfInUrl" DisplayCaption="True"
                            PositionCaption="Right" DataSaveUponStateChange="False" /> 
                </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        <asiweb:SmartControl 
            ID="HasParametersInSessionControl" runat="server" BoundPropertyName="HasParametersInSession" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />        
    </div>
 </asiweb:paneltemplatecontrol>
