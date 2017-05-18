<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesPEDesignerTab1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesPEDesignerTab1.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<div class="PanelField Left">
    <asp:Label id="lblName" runat="server" AssociatedControlID="txtName"/>
    <div class="PanelFieldValue FloatNone">
        <asp:textbox id="txtName" runat="server" MaxLength="50" CssClass="InputXLarge"></asp:textbox>
        <asp:checkbox id="chkRuntime" runat="server"></asp:checkbox>
    </div>
</div>
<div class="PanelField Left">
    <asp:label id="lblDescription" runat="server" AssociatedControlID="txtDescription"></asp:label>
    <div class="PanelFieldValue"><asp:textbox id="txtDescription" runat="server" MaxLength="250" TextMode="MultiLine" CssClass="InputXLarge" Rows="5"></asp:textbox></div>
</div>
<div class="PanelField FloatNone">
    <asp:checkbox id="chkPreview" runat="server" TextAlign="Right"></asp:checkbox>
</div>
