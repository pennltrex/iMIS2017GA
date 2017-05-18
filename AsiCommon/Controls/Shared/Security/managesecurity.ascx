<%@ Register TagPrefix="asiWeb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityControls.ManageSecurityControl" AutoEventWireup="true" Codebehind="ManageSecurity.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="SecurityPanel" runat="server" TemplateTitle="Security" Collapsible="false" BorderStyle="None" translate="yes">

<div class="PanelField">
    <div class="PanelFieldLabel">
        <asp:label id="AccessLabel" runat="server" AssociatedControlID="ShareRadio"></asp:label>
    </div>
    <div class="PanelFieldValue FloatNone">
        <div>
            <asp:radiobutton id="ShareRadio" runat="server" GroupName="Mode" AutoPostBack="True"
			    Text="Share" oncheckedchanged="RadioCheckedChanged"></asp:radiobutton>
        </div>
        <div>
            <asp:radiobutton id="PrivateRadio" runat="server" GroupName="Mode" AutoPostBack="True"
		        Text="Private" oncheckedchanged="RadioCheckedChanged"></asp:radiobutton>
        </div>
        <div>
            <asp:radiobutton id="AdvancedRadio" runat="server" GroupName="Mode" AutoPostBack="True"
		        Text="Advanced" oncheckedchanged="RadioCheckedChanged"></asp:radiobutton>
        </div>
        <div class="SubItems">
            <asp:dropdownlist id="AdvancedDropDownList" cssclass="SelectStandard" runat="server"
		        AutoPostBack="True" onselectedindexchanged="AdvancedDropDownList_SelectedIndexChanged"></asp:dropdownlist>
        </div>
        <div>
            <asp:Label id="MirrorLabel" runat="server"></asp:Label>
        </div>
    </div>
</div>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>

<asiResultsViewer:QueryResultGrid ID="AvailableLister" runat="server" SelectItemBehavior="RaiseEvent" 
		            PageSize="20" QueryPath="$/Common/Queries/SecurityAdministration/AccessGranteeList" SelectEnabled="True" />
</asiweb:PanelTemplateControl2>
