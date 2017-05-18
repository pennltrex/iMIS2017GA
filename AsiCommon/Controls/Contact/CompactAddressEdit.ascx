<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Contact.CompactAddressEdit" Codebehind="CompactAddressEdit.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<div id="PhysicalAddressSection" visible='<%# IsEditMode %>' runat="server">
    <asi:SmartControl runat="server" AtomComponentName="PhysicalAddress" BoundPropertyName="Address1" 
        ID="Address1Control" DisplayType="EditableField" DisplayCaption="true"/>
    <asi:SmartControl runat="server" AtomComponentName="PhysicalAddress" BoundPropertyName="City" 
        ID="CityControl" DisplayType="EditableField" DisplayCaption="true"/>
    <asi:SmartControl runat="server" AtomComponentName="PhysicalAddress" BoundPropertyName="StateProvinceCode" 
        ID="StateControl" DisplayType="EditableField" DisplayCaption="true"/>
</div>
<asi:SmartControl runat="server" AtomComponentName="PhysicalAddress" BoundPropertyName="FormattedAddress" 
    ID="FormattedAddressControl" DisplayType="ReadOnlyField" DisplayCaption="false" visible='<%# !IsEditMode %>' />




