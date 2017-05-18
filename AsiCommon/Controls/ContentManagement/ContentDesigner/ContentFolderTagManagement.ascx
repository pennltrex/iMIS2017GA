<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentFolderTagManagement" Codebehind="ContentFolderTagManagement.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" TagName="TagSelector" TagPrefix="uc1" %>
<%@ Register Src="~/AsiCommon/Controls/ContentManagement/InheritedTags.ascx" TagName="InheritedTags" TagPrefix="uc1" %>

<div style="width: 75%; max-width: 500px;">
    <uc1:TagSelector ID="TagSelector1" runat="server"></uc1:TagSelector>
    <uc1:InheritedTags ID="InheritedTags1" runat="server"></uc1:InheritedTags>
</div>