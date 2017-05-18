<%@ Reference Control="~/asicommon/controls/querybuilder/designclassic.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.DesignClassicSummary" Codebehind="DesignClassicSummary.ascx.cs" %>
<style scoped>.IE8 { width: 100%; max-width: 42em;}</style>
<asiweb:PanelTemplateControl runat="server" ID="SummaryPanel" ShowHeader="false" Collapsible="False" BorderStyle="None">
    <h1 class="screen-reader-text" translate="yes">Query Summary</h1>
    <div class="PanelField">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel ID="QueryNameLabel" runat="server" AssociatedControlID="QueryName" CssClass="Required" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox ID="QueryName" runat="server" class="InputXLarge WideTextBox" />
        </div>
        <asp:RequiredFieldValidator runat="server" id="QueryNameValidator" ControlToValidate="QueryName" ErrorMessage="Name is a required field." CssClass="Important" /> 
    </div>

    <asiweb:BusinessTextBox runat="server" ID="Description" TextMode="MultiLine" Rows="4" RenderPanelField="true" DisplayCaption="true" CssClass="InputXXLarge" />
    <asiweb:BusinessTextBox runat="server" ID="ScreenReaderCaption" TextMode="MultiLine" Rows="4" RenderPanelField="true" DisplayCaption="true" CssClass="InputXXLarge" />
    <div class="AutoWidth">
        <asiweb:BusinessCheckBox runat="server" ID="ScreenReaderCaptionTextInvisible" RenderPanelField="true" DisplayCaption="true" PositionCaption="Right" />
    </div>
    <asiweb:StyledLabel runat="server" ID="CreatedBy" RenderPanelField="true" DisplayCaption="true" />
    <asiweb:StyledLabel runat="server" ID="CreatedOn" RenderPanelField="true" DisplayCaption="true" />
    <asiweb:StyledLabel runat="server" ID="UpdatedBy" RenderPanelField="true" DisplayCaption="true" />
    <asiweb:StyledLabel runat="server" ID="UpdatedOn" RenderPanelField="true" DisplayCaption="true" />

    <div runat="server" id="DivAdvancedMode">
        <div class="FloatLeft">
            <asiweb:BusinessCheckBox runat="server" ID="UseCaching" RenderPanelField="true" DisplayCaption="true" PositionCaption="Right" />
        </div>
            <asiweb:InfoControl runat="server" ID="UseCachingInfo" CssClass="Left" 
                Text='Enabling this option will improve performance by periodically refreshing the query results. It’s recommended that this option is only enabled for queries that display summary lists, such as Dashboard queries. If you must have current data, do not enable this option.'></asiweb:InfoControl>
        
        <asiweb:BusinessTextBox runat="server" ID="SQLTextField" ReadOnly="true" TextMode="MultiLine" Rows="8" RenderPanelField="true" DisplayCaption="true" CssClass="InputXXLarge" ValidateRequestMode="Disabled" />
    </div>

    <asp:placeholder id="ChildControlsPlaceHolder" runat="server"></asp:placeholder>
    <asp:Label id="ErrorMsgLabel" runat="server" CssClass="Error"></asp:Label>

</asiweb:PanelTemplateControl>