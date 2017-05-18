<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelEditorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelEditorConfigEdit" %>

<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<script type="text/javascript">
    function ConfirmDeletePanel() {
        var answer = confirm("Delete this panel?");
        if (!answer)
            return false;
        return true;
    }
</script>

<telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
    <ajaxsettings>
        <telerik:AjaxSetting AjaxControlID="panelList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="panelList" />
                <telerik:AjaxUpdatedControl ControlID="panelEditDelete" />
                <telerik:AjaxUpdatedControl ControlID="editPropertiesDiv" />
                <telerik:AjaxUpdatedControl ControlID="MultiInstancePropertiesDiv" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="refreshTrigger">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="panelList" />
                <telerik:AjaxUpdatedControl ControlID="panelEditDelete" />
                <telerik:AjaxUpdatedControl ControlID="editPropertiesDiv" />
                <telerik:AjaxUpdatedControl ControlID="MultiInstancePropertiesDiv" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </ajaxsettings>
</telerik:RadAjaxManagerProxy>
<asp:Button runat="server" ID="refreshTrigger" OnClick="RefreshTriggerClick" Style="display: none" Text=""></asp:Button>
<asiweb:PanelTemplateControl2 ID="contactUserDefinedFieldsEdit" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
                   
    <asiweb:SmartControl ID="panelList" runat="server" BoundPropertyName="PanelDefinitionId" DisplayCaption="true"
     DataSaveUponStateChange="false" AutoPostBack="true" OnDataChange="PanelListChanged" EnableAjaxPostback="true">
        <asp:Panel runat="server" ID="panelEditDelete">
            <asp:Button ID="linkEditPanel" runat="server" CssClass="unitText"></asp:Button>
            <asp:Button ID="linkDeletePanel" runat="server" OnClick="LinkDeletePanelClick" 
                CssClass="unitText" OnClientClick="if (!ConfirmDeletePanel()) return false;"></asp:Button>
            <asp:Button ID="linkImportPanels" runat="server" OnClick="LinkImportPanelsClick" CssClass="unitText"/><asiweb:StyledLabel runat="server" ID="UserMessage" Visible="false" />
        </asp:Panel>              
    </asiweb:SmartControl>
    <div class="AutoWidth">               
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />                           
        <asiweb:SmartControl ID="HidePanelWhenEmpty" runat="server" 
            BoundPropertyName="HidePanelWhenEmpty" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />  	
            <div id="MultiInstancePropertiesDiv" runat="server" class="ShowFieldset" >
                <label><%=ResourceManager.GetPhrase("MultiInstancePanelOptions", "Multi-Instance Panel Options") %></label>
                <asiweb:SmartControl ID="ScrollingGridEnabled" runat="server" BoundPropertyName="ScrollingGridEnabled" DisplayCaption="true" PositionCaption="Right"
                        AutoPostBack="true" EnableAjaxPostback="true" DataSaveUponStateChange="false" style="padding-left:30px"/>
                    <div id="gridSizeDiv" runat="server" style="padding-left:30px">
                        <asiweb:SmartControl ID="ScrollingGridWidth" runat="server" BoundPropertyName="ScrollingGridWidth" DisplayCaption="True" 
                            DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" style="padding-left:20px"/>
                        <asiweb:SmartControl ID="ScrollingGridHeight" runat="server" BoundPropertyName="ScrollingGridHeight" DisplayCaption="True" 
                            DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" style="padding-left:20px"/>
                    <asiweb:SmartControl ID="ScrollingCellsEnabled" runat="server" BoundPropertyName="ScrollingCellsEnabled" DisplayCaption="true" PositionCaption="Right"
                        AutoPostBack="false" DataSaveUponStateChange="false" />
                    <asiweb:SmartControl ID="allowAdd" runat="server" BoundPropertyName="AllowAdd" DisplayCaption="true" PositionCaption="Right" 
                        DataSaveUponStateChange="false" />
                    <asiweb:SmartControl ID="allowDelete" runat="server" BoundPropertyName="AllowDelete" DisplayCaption="true" PositionCaption="Right" 
                        DataSaveUponStateChange="false" />
                    </div>
            </div>
            <div style="clear: both;"/> 
    </div>        
    <div class="AutoWidth">
        <div id="editPropertiesDiv" runat="server">
            <asiweb:SmartControl ID="allowEdit" runat="server" BoundPropertyName="AllowEdit" DisplayCaption="true" PositionCaption="Right"
             AutoPostBack="True" DataSaveUponStateChange="false" />
           <div id="editAllowedPropertiesDiv" runat="server" style="padding-left:20px">
                <div id="defaultEditDiv" runat="server"> 
                    <asiweb:SmartControl ID="defaultEdit" runat="server" BoundPropertyName="DefaultEditMode" DisplayCaption="true" PositionCaption="Right"
                    AutoPostBack="True" DataSaveUponStateChange="false" />
                    <asiweb:SmartControl ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" DisplayCaption="true" PositionCaption="Left" 
                    AutoPostBack="False" DataSaveUponStateChange="false" MinValue="0" /> 
                </div>
                <asiweb:SmartControl ID="editWindowWidth" runat="server" BoundPropertyName="EditWindowWidth" DisplayCaption="True" 
                 DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
                <asiweb:SmartControl ID="editWindowHeight" runat="server" BoundPropertyName="EditWindowHeight" DisplayCaption="True" 
                 DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
            </div>
        </div>
    </div>
</asiweb:PanelTemplateControl2>
