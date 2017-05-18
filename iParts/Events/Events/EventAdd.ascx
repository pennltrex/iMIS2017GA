<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventAdd.ascx.cs" Inherits="Asi.Web.iParts.Events.EventAdd" %>
<%@ Register Assembly="Telerik.Web.UI" TagPrefix="telerik" Namespace="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<script>
    function ShowLoadingPanel() {
        jQuery("#<%#LoadingPanel.ClientID%>").show();
    }
</script>
 <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false" 
 BackgroundPosition="Center" Skin="Metro" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></telerik:RadAjaxLoadingPanel>

<telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" >
<asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" ShowHeader="True" TemplateTitle="Add event" Collapsible="False" FieldSet="true" ShowBorder="False" translate="yes">
    <fieldset id="DivAddEvent" runat="server" Visible="True">
        <legend><asiweb:StyledLabel id="EventContentLegend" runat="server"></asiweb:StyledLabel></legend>
        <asiweb:StyledRadioButton runat="server" ID="RadioBlank" GroupName="SelectionList" Text="Blank event" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right" Checked="true" AutoPostBack="True" OnCheckedChanged="ShowBaseCopyOptions" />
        
        <asiweb:StyledRadioButton runat="server" ID="RadioTemplate" GroupName="SelectionList" Text="Template" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right" AutoPostBack="True" OnCheckedChanged="ShowBaseCopyOptions" />
        <div id="DivTemplateSelection" runat="server" class="PanelField Left SubItems">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelSelectTemplate" Text="Select a template" AssociatedControlID="SelectTemplate" CssClass="screen-reader-text"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList runat="server" ID="SelectTemplate" AutoPostBack="false" DisplayCaption="False" IncludeNullItem="False" />
                <asiweb:StyledLabel runat="server" ID="LabelNoTemplatesAvailable" Visible="false"></asiweb:StyledLabel>
            </div>
        </div>
        <asiweb:StyledRadioButton runat="server" ID="RadioEvent" GroupName="SelectionList" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right" AutoPostBack="True" OnCheckedChanged="ShowBaseCopyOptions" />
        <div id="DivEventSelection" runat="server" class="PanelField Left SubItems">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelSelectEvent" Text="Select an event" AssociatedControlID="SelectEvent" CssClass="screen-reader-text"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessComboBox runat="server" ID="SelectEvent" AutoPostBack="True" EnableLoadOnDemand="True" OnItemsRequested="EventListItemsRequested"  
                    CssClass="WideTextBox" TranslateOnlyCaptionAndToolTip="True" ShowMoreResultsBox="True" EnableVirtualScrolling="True"  ItemsPerRequest="10" ShowNullItem="false" Height="185px"  />
                <asiweb:StyledLabel runat="server" ID="LabelNoEventsAvailable" Visible="false"></asiweb:StyledLabel>
            </div>
        </div>
        <div class="clearfix">&nbsp;</div>
        <div class="PanelField Left" id="DivCode" runat="server" Visible="False">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelCode" CssClass="Required" AssociatedControlID="TextCode"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="TextCode" MaxLength="10"  />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorCode" ControlToValidate="TextCode" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
            </div>
        </div>
    </fieldset>
</asiweb:PanelTemplateControl2>
</telerik:RadAjaxPanel>
