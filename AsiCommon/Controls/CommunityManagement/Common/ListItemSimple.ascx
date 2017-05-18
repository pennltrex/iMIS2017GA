<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_ListItemSimple" Codebehind="ListItemSimple.ascx.cs" %>

<td><asiweb:SmartControl runat="server" BoundPropertyName="CreatedByUserKey" ID="PostedByControl" DataTextField="FullName" DisplayType="ReadOnlyField" DisplayCaption="false" /></td>
<td><asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundPropertyName="AtomKey" BoundDisplayPropertyName="Title" OnNeedBoundAtom="NameLink_NeedBoundAtom" NavigateType="SameWindow" /></td>   
<td><asiweb:SmartControl runat="server" BoundPropertyName="CreatedOn" ID="PostedDateControl" DisplayType="ReadOnlyField" DisplayCaption="false" /></td>