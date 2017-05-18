<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Events.EventDisplayConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Import Namespace="Asi"%>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" Visible="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>    
    <asiweb:SmartControl ID="EventKey" runat="server" BoundPropertyName="EventKey" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
    <asiweb:SmartControl ID="ImageWidth" runat="server" BoundPropertyName="ImageWidth" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
    <asiweb:SmartControl ID="RegistrantInfoMessage" runat="server" BoundPropertyName="RegistrantInfoMessage" DisplayCaption="true" PositionCaption="Left" 
        DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
    <asiweb:SmartControl ID="AddToCalendarOption" runat="server" BoundPropertyName="AddToCalendarButtonDisplayMode" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false"></asiweb:SmartControl>
    <asiweb:SmartControl ID="IQAQueryPath" runat="server" BoundPropertyName="IQAQueryPath" DisplayCaption="true" PositionCaption="Left" 
        DataSaveUponStateChange="false" AutoPostBack="false" InputFieldCssClass="InputXLargeWrapper" />
    
    <asiweb:SmartControl ID="IQAQueryPathEvtGuest" runat="server" BoundPropertyName="IQAQueryPathEvtGuest" DisplayCaption="true" PositionCaption="Left" 
        DataSaveUponStateChange="false" AutoPostBack="false" InputFieldCssClass="InputXLargeWrapper"/>
    
    <div style="clear: both;"></div>
    <div>
        <div class="ShowFieldset">
            <fieldset>
                <legend>New contact settings</legend> 
                <asiweb:SmartControl 
                    ID="CreateAddressPurpose" runat="server" 
                    BoundPropertyName="CreateAddressPurpose" DisplayCaption="true" 
                    PositionCaption="Left" DataSaveUponStateChange="false" />
                <asiweb:SmartControl
                    ID="OrganizationListQueryPathControl" runat="server" 
                    BoundPropertyName="OrganizationListQueryPath" DisplayCaption="True"
                    DataSaveUponStateChange="False" DocumentTypesAllowed="IQD" HIControlType="DocumentPathSelector" InputFieldCssClass="InputXLargeWrapper" />
            </fieldset>
        </div>
    </div>
 </asiweb:paneltemplatecontrol>