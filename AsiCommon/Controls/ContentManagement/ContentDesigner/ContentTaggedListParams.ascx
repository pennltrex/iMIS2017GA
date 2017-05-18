<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentTaggedListParams" Codebehind="ContentTaggedListParams.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" TagName="TagSelector" TagPrefix="uc1" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/DateRangeSelector/DateRangeSelector.ascx" TagName="DateRangeSelector" TagPrefix="uc2" %>

<asiweb:SmartControl ID="ItemTitle" runat="server" DisplayCaption="true" PositionCaption="Left">
<div class="AutoWidth">    
    <asiweb:SmartControl BoundPropertyName="ShowTitleNoContentFlag" DataSaveUponStateChange="false" DisplayCaption="true" ID="ShowTitleNoContentFlag" PositionCaption="Right" runat="server" />
</div>
</asiweb:SmartControl>
<asiweb:SmartControl ID="FilterByPropertyName" OnClientChange="FilterByPropertyName_Change(this);" runat="server" 
    BoundPropertyName="FilterByPropertyName" DisplayCaption="true">
   <div id="divFilterAs" class="FloatNone AutoWidth" runat="server">
        <asp:Label AssociatedControlID="DateRangeSelector1" ID="lblFilterAs" runat="server" /><br/>
        <uc2:DateRangeSelector ID="DateRangeSelector1" runat="server" /> 
    </div>
</asiweb:SmartControl>
<asiweb:SmartControl ID="SortByPropertyName" OnClientChange="SortByPropertyName_Change(this);" runat="server" 
    BoundPropertyName="SortByPropertyName" DisplayCaption="true">
    <div id="divSortType" class="FloatNone AutoWidth" runat="server">                   
        <asp:Label AssociatedControlID="SortType" ID="lblSortType" runat="server" />
        <div style="padding-left:32px;white-space: nowrap;">
            <asiweb:SmartControl ID="SortType" runat="server" BoundPropertyName="SortType" DisplayCaption="false" PositionCaption="Left" />             
        </div>
    </div>
</asiweb:SmartControl> 
<div class="AutoWidth">
    <asiweb:SmartControl ID="MaxNumResults" runat="server" BoundPropertyName="MaxNumResults" DisplayCaption="true" />
</div>
<asiweb:PanelTemplateControl2 ID="PanelSelectedTags" TemplateTitle="SelectedTagsx" Collapsible="false" runat="server">           
    <uc1:TagSelector ID="TagSelector1" runat="server"/>
    <br />
    <div class="AutoWidth">
        <asiweb:SmartControl ID="TagMatchType" runat="server" BoundPropertyName="TagMatchType" DisplayCaption="false" PositionCaption="Right"/> 
    </div>
</asiweb:PanelTemplateControl2>