<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentTaggedListEdit" Codebehind="ContentTaggedListEdit.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" TagName="TagSelector" TagPrefix="uc1" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/DateRangeSelector/DateRangeSelector.ascx" TagName="DateRangeSelector" TagPrefix="uc2" %>

<asiweb:PanelTemplateControl ID="TaggedListFields" runat="server" FieldSet="true" TemplateTitle="Properties" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="ListFormatKey" runat="server" BoundPropertyName="ListFormatKey" DisplayCaption="true" PositionCaption="Left" DataSortField="Name" /> 
    <asiweb:SmartControl ID="ItemTitle" runat="server" BoundPropertyName="ListTitle" DisplayCaption="true" PositionCaption="Left" />
    <div class="AutoWidth"> 
        <asiweb:SmartControl ID="ShowTitleNoContentFlag" runat="server" BoundPropertyName="ShowTitleNoContentFlag" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
    <asiweb:SmartControl ID="FilterByPropertyName" OnClientChange="FilterByPropertyName_Change(this);" runat="server" 
        BoundPropertyName="FilterByPropertyName" DisplayCaption="true" PositionCaption="Left">     
        <div id="divFilterAs" class="FloatNone AutoWidth" runat="server">
            <asp:Label AssociatedControlID="DateRangeSelector1" ID="lblFilterAs" runat="server" /><br/>
            <uc2:DateRangeSelector ID="DateRangeSelector1" runat="server" /> 
        </div>
    </asiweb:SmartControl>
    <asiweb:SmartControl ID="SortByPropertyName" OnClientChange="SortByPropertyName_Change(this);" runat="server" 
        BoundPropertyName="SortByPropertyName" DisplayCaption="true" PositionCaption="Left">
        
        <div id="divSortType" class="FloatNone AutoWidth" runat="server">                   
            <asp:Label AssociatedControlID="SortType" ID="lblSortType" runat="server" />
            <div style="padding-left:32px;white-space: nowrap;">
                <asiweb:SmartControl ID="SortType" runat="server" BoundPropertyName="SortType" DisplayCaption="false" PositionCaption="Left" />             
            </div>
        </div>
    </asiweb:SmartControl> 
    <asiweb:SmartControl ID="MaxNumResults" runat="server" BoundPropertyName="MaxNumResults" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl ID="ViewAllMessage" runat="server" BoundPropertyName="ViewAllMessage" DisplayCaption="true" PositionCaption="Left" Width="100%" /> 
    <asiweb:SmartControl ID="ViewAllCssClass" runat="server" BoundPropertyName="ViewAllCssClass" DisplayCaption="true" PositionCaption="Left" Width="100%" /> 
    <asiweb:SmartControl ID="IncludeSocialSharingIcons" runat="server" BoundPropertyName="IncludeSocialSharingIcons" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
</asiweb:PanelTemplateControl>
<asiweb:PanelTemplateControl ID="PanelSelectedTags" TemplateTitle="SelectedTagsx" runat="server" Collapsed="false" FieldSet="true">
    <div class="AutoWidth FloatNone">
        <uc1:TagSelector ID="TagSelector1" runat="server"/>
    </div>
    <div class="AutoWidth FloatNone">
        <asiweb:SmartControl ID="TagMatchType" runat="server" BoundPropertyName="TagMatchType" DisplayCaption="false" PositionCaption="Right" /> 
    </div>
</asiweb:PanelTemplateControl>