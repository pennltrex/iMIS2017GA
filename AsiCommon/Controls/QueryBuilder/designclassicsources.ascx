<%@ Reference Control="~/asicommon/controls/querybuilder/designclassic.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.DesignClassicSources" Codebehind="DesignClassicSources.ascx.cs" %>
<script type="text/javascript"> 
    function BSABrowserCallback(radWindow)
    {
        if (radWindow.result == null) return;
        var selectedKeysId = document.getElementById('SelectedKeys');
        selectedKeysId.value = radWindow.result;
        submitForm(selectedKeysId);
    }
</script>
<input type="hidden" id="SelectedKeys" runat="server" onserverchange="AddObjects" ClientIDMode="Static" />

<asp:Label id="ErrorMsgLabel" runat="server" CssClass="Error"></asp:Label>

<asiweb:PanelTemplateControl2 runat="server" ID="SourcesPanel" ShowHeader="False" BorderStyle="None" Collapsible="false"> 
    <h1 class="screen-reader-text" translate="yes">Query Sources</h1>    
    <asp:PlaceHolder ID="ChildControlsPlaceHolder" Runat="server"></asp:PlaceHolder>
    <asiweb:PanelTemplateControl2 runat="server" ID="OptionsPanel" ShowHeader="false" BorderStyle="None" Collapsible="False">
        <h2 runat="server" id="sectionH2" class="screen-reader-text" translate="yes">Advanced options</h2> 
        <span  runat="server" id="sectionTitle" class="SectionTitle section" translate="yes">Advanced options</span>
    <div class="AutoWidth">
        <asiweb:BusinessCheckBox ID="ForceOrderChkBox" runat="server" OnCheckedChanged="DynamicStateChange" RenderPanelField="true" DisplayCaption="true" PositionCaption="Right" />    
        <asiweb:BusinessCheckBox ID="NoLockChkBox" runat="server" OnCheckedChanged="DynamicStateChange"  RenderPanelField="true" DisplayCaption="true" PositionCaption="Right" />
        <asiweb:BusinessCheckBox ID="SecurityJoinChkBox" runat="server" OnCheckedChanged="DynamicStateChange" RenderPanelField="true" DisplayCaption="true" PositionCaption="Right" />
    </div>
    </asiweb:PanelTemplateControl2>   
</asiweb:PanelTemplateControl2>