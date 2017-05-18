<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressMapperDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.AddressMapper.AddressMapperDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:BusinessLabel ID="errorText" runat="server" CssClass="Error" style="display:none;" />
 <div runat="server" style="height: 350px;width:350px;" id="MapPanel">
    

</div>
<asiweb:BusinessHyperLink ID="EmbeddedMapsLink" Target="_blank" translate="yes" runat="server" style="display:none;"></asiweb:BusinessHyperLink>
