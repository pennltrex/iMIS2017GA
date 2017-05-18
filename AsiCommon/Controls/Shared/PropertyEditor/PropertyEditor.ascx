<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_PropertyEditor_PropertyEditor" Codebehind="PropertyEditor.ascx.cs" %>
<%@ Register TagPrefix="propedit" TagName="PropertyDefinition" Src="~/AsiCommon/Controls/Shared/PropertyEditor/PropertyDefinition.ascx" %>
<%@ Register TagPrefix="propedit" TagName="PropertyDisplay" Src="~/AsiCommon/Controls/Shared/PropertyEditor/PropertyDisplay.ascx" %>
<%@ Register TagPrefix="propedit" TagName="PropertyValues" Src="~/AsiCommon/Controls/Shared/PropertyEditor/PropertyValues.ascx" %>
<propedit:PropertyDefinition ID="PropertyDefinition" runat="server" UseParentAtomObject="true"></propedit:PropertyDefinition>
<propedit:PropertyDisplay ID="PropertyDisplay" runat="server" UseParentAtomObject="true"></propedit:PropertyDisplay>
<propedit:PropertyValues ID="PropertyValues" runat="server" UseParentAtomObject="true"></propedit:PropertyValues>