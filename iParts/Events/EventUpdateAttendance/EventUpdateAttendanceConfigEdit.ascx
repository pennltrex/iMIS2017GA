<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventUpdateAttendanceConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Events.EventUpdateAttendance.EventUpdateAttendanceConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
    
<asiweb:paneltemplatecontrol ID="PanelTemplateControl1" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">    
    <asp:UpdatePanel runat="server" ID="KeyPanel">
    <ContentTemplate>
        <asiweb:SmartControl ID="EventKey" runat="server" BoundPropertyName="EventKey" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
        <asiweb:BusinessRadioButtonList ID="KeyMode"  OnSelectedIndexChanged="ModeList_SelectedIndexChanged" AutoPostBack="True" runat="server" DisplayCaption="True" Caption="Mode"
                RenderPanelField="True" CssClass="AutoWidth">
                <asp:ListItem Text="Overall event" Value="Event" Selected="True"/>
                <asp:ListItem Text="Specific function" Value="Function" />
        </asiweb:BusinessRadioButtonList>
        <div runat="server" id="FunctionDiv" class="PanelField Left LabelSpacer">
            <asiweb:SmartControl ID="FunctionKey" runat="server" BoundPropertyName="FunctionKey" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
        </div>
    </ContentTemplate>
    </asp:UpdatePanel>
 </asiweb:paneltemplatecontrol>


