<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentBlockEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.ContentBlockEdit" %>
<%@ Register TagPrefix="asi" TagName="TagSelector" Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" %>

<asiweb:paneltemplatecontrol2 ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" DataSaveUponStateChange="false" />
    
    <asiweb:SmartControl ID="MaxDisplayItems" runat="server" BoundPropertyName="MaxDisplayItems" DisplayCaption="true" MinValue="0" MaxValue="100" DataSaveUponStateChange="false" />
    <asiweb:SmartControl ID="DisplayMode" runat="server" BoundPropertyName="DisplayMode" DisplayCaption="true" ShowNullItem="false" DataSaveUponStateChange="false" />      
   
    <asiweb:BusinessDropDownList ID="PostSortList" 
        DataSource="<%#SortDropDownValues %>" 
        runat="server"
        RenderPanelField="true" 
        DisplayCaption="true"
        ShowNullItem="false"
        Caption='<%# Asi.ResourceManager.GetPhrase("ContentBlock.SortBy", "Sort by") %>' />
            
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DoNotRenderInDesignMode" runat="server" BoundPropertyName="DoNotRenderInDesignMode" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayPostDateAndAuthor" runat="server" BoundPropertyName="DisplayPostDateAndAuthor" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="AllowChildPosts" runat="server" BoundPropertyName="AllowChildPosts" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="AllowReplies" runat="server" BoundPropertyName="AllowReplies" 
            DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" DataSaveUponStateChange="false" />
        <div class="SubItems">
            <asiweb:SmartControl ID="AllowHtml" runat="server" BoundPropertyName="AllowHtml" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
            <asiweb:SmartControl ID="AllowAttachments" runat="server" BoundPropertyName="AllowAttachments" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        </div>        
        <asiweb:SmartControl ID="IncludeSocialSharingIcons" runat="server" BoundPropertyName="IncludeSocialSharingIcons"
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />      
    </div>

    <asiweb:SmartControl ID="ItemDefaultHtml" runat="server" BoundPropertyName="ItemDefaultHtml" DisplayCaption="true" PositionCaption="Top" CaptionStyle="Width:auto!Important;" DataSaveUponStateChange="false" />   
        <%--Tag Selector--%>
    <div class="PanelField Top">
        <label id="Tag" runat="server"></label>
        <div class="PanelFieldValue">
            <asi:TagSelector ID="TagSelector" runat="server" />
        </div>
    </div>
    
</asiweb:paneltemplatecontrol2>