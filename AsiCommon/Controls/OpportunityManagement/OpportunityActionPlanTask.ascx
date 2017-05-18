<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityActionPlanTask" Codebehind="OpportunityActionPlanTask.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<div align="right">
		<asiweb:StyledButton id="btnDelete" runat="server" OnClick="btnDelete_ServerClick" Text="Delete"/> 
		<asiweb:StyledButton id="btnContinue" runat="server" OnClick="btnContinue_ServerClick" Text="Continue"/>
</div>

<asiweb:PanelTemplateControl ID="PropertiesPanel" runat="server" Text="Properties" Collapsed="false" FieldSet="true">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server">
    <div class="PanelField">
        <asiweb:BusinessLabel id="lblSubject" runat="server" Text="Subject" AssociatedControlID="txtSubject" CssClass="Required" />
        <asp:textbox id="txtSubject" runat="server"/>
        </div>
    <div class="PanelField">
        <asiweb:BusinessLabel id="lblDescription" runat="server" Text="Description" AssociatedControlID="txtDescription"/>
		<asp:textbox id="txtDescription" runat="server" textmode="MultiLine"/>
        </div>
    <div class="PanelField">
        <asiweb:BusinessLabel id="lblComment" runat="server" Text="Comment" AssociatedControlID="txtComment"/>
		<asp:textbox id="txtComment" runat="server" textmode="MultiLine"/>
		</div>
    <div class="PanelField">
        <asiweb:BusinessLabel id="lblDaysAllowed" runat="server" Text="Days Allowed" AssociatedControlID="txtDaysAllowed"/>
		<asp:textbox id="txtDaysAllowed" runat="server" cssclass="InputShort"/>&nbsp;<asp:rangevalidator id="DaysValidator" runat="server" type="Integer" minimumvalue="0" maximumvalue="99999999"
				errormessage="RangeValidator" controltovalidate="txtDaysAllowed"/>
				</div>
    <div class="PanelField">
        <asiweb:BusinessLabel id="lblPriority" runat="server" Text="Priority" AssociatedControlID="cboPriority"/>
		<asp:dropdownlist id="cboPriority" runat="server" cssclass="SelectStandard"/>
		</div>
    <div class="PanelField">
        <asiweb:BusinessLabel id="lblAssignedTo" runat="server" Text="Assignee" AssociatedControlID="ddlAssignedGroup" CssClass="Required"/>
		<asp:DropDownList Runat="server" ID="ddlAssignedGroup"  cssclass="SelectStandard"/>&nbsp;<asp:label id="lblAssignedGroupRequired" runat="server" forecolor="Red" />
		</div>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>