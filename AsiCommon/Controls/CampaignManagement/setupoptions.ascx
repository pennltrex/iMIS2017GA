<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.SetupOptions" Codebehind="SetupOptions.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl2 ID="OptionsPanel" runat="server" Collapsible="false" FieldSet="true" ShowHeader="false" translate ="yes">
    <div class="PanelField">
        <asp:label id="lblCodeMode" runat="server" CssClass="Label" />
        <div class="PanelFieldValue Left" id="rdoButtonList" runat="server">
		    <asp:radiobutton  Text="Mannually-Assigned" id="rdoManual" runat="server" AutoPostBack="True" GroupName="rdoMode"></asp:radiobutton>
		    <asp:radiobutton id="rdoAuto" runat="server" AutoPostBack="True" GroupName="rdoMode"></asp:radiobutton>
        </div>
    </div>
    <div class="PanelField">
        <asp:label id="lblCodeFormat" runat="server" CssClass="Label" />
        <%--<div class="PanelFieldValue AutoWidth">--%>
            <asp:placeholder id="SourceCodeConfigPlaceHolder" runat="server"></asp:placeholder>
        <%--</div>--%>
    </div>
    <div class="PanelField">
        <asp:label id="lblBudgetLevel" runat="server" CssClass="Label" />
        <div class="PanelFieldValue AutoWidth" id="rdoBudgetList" runat="server">
		    <asp:radiobutton id="rdoBudgetAppeal" runat="server" GroupName="rdoBudget"></asp:radiobutton>
		    <asp:radiobutton id="rdoBudgetSourceCode" runat="server" GroupName="rdoBudget"></asp:radiobutton>
        </div>
    </div>
    <div class="PanelField Right">       
        <div class="PanelFieldValue"><asp:CheckBox id="chkAutoMap" runat="server"></asp:CheckBox></div>
        <asp:Label ID="lblAutoMap" runat="server" AssociatedControlID="chkAutoMap"></asp:Label>
    </div>
    <div class="PanelField">
        <asiweb:BusinessLabel ID="OptOutUrlLabel" runat="server" ToolTip="The url clients can take to opt out of solicitations." AssociatedControlID="OptOutUrlInput" />
        <asp:TextBox runat="server" ID="OptOutUrlInput" Text='<%#Asi.iBO.iboAdmin.ReferenceData.GetSystemParameterValue("CampaignManagement.OptOutUrl")%>' Columns="50" ToolTip="The url clients can take to opt out of solicitations." />
    </div>
    <div class="PanelField">
        <asiweb:BusinessLabel ID="OptOutKeyLabel" runat="server"  ToolTip="The key to use to generate opt out url's in solicitations." AssociatedControlID="OptOutKeyInput" />
        <asp:TextBox runat="server" ID="OptOutKeyInput" Text='<%#Asi.iBO.iboAdmin.ReferenceData.GetSystemParameterValue("CampaignManagement.OptOutKey")%>' Columns="50"  ToolTip="The key to use to generate opt out url's in solicitations." />
    </div>
</asiweb:PanelTemplateControl2>
