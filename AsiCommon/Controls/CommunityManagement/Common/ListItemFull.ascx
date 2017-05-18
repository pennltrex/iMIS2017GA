<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_ListItemFull" Codebehind="ListItemFull.ascx.cs" %>

<td><asiweb:BusinessHyperLink runat="server" ID="SelectLinkControl" NavigateType="SameWindow" Visible="false" /></td>
<td><asiweb:SmartControl runat="server" BoundPropertyName="CreatedByUserKey" ID="PostedByControl" DataTextField="FullName" DisplayType="ReadOnlyField" DisplayCaption="false" /></td>
<td><asiweb:BusinessLabel runat="server" ID="InstituteNameControl"/></td>
<td><asiweb:SmartControl runat="server" BoundPropertyName="CreatedOn" ID="PostedDateControl" DisplayType="ReadOnlyField" DisplayCaption="false" /></td>
<td><asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundPropertyName="AtomKey" BoundDisplayPropertyName="Title" OnNeedBoundAtom="NameLink_NeedBoundAtom" NavigateType="SameWindow" HtmlEncode="true" /></td> 
<td><asiweb:SmartControl runat="server" BoundPropertyName="UpdatedOn" ID="UpdatedDateControl" DisplayType="ReadOnlyField" DisplayCaption="false" /></td>  

