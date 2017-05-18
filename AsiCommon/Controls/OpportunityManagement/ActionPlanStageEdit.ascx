<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.OpportunityManagement.ActionPlanStageEdit" Codebehind="ActionPlanStageEdit.ascx.cs" %>

    <asiweb:PanelTemplateColumn ID="StageUIPanelColumn1" runat="server" style="clear:right;">
        <div class="PanelField">
            <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName"></asp:Label>
            <asp:textbox id="txtName" runat="server"></asp:textbox>
        </div>
        <div class="PanelField">
            <asp:label id="lblDescription" runat="server" AssociatedControlID="txtDescription"></asp:label>
            <asp:textbox id="txtDescription" runat="server" textmode="MultiLine"></asp:textbox>
        </div>
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="StageUIPanelColumn2" runat="server">
        <div class="PanelField">
            <asp:label id="lblUpdateWinProbability" runat="server" AssociatedControlID="ddUpdateWinProbability"></asp:label>
            <asp:dropdownlist id="ddUpdateWinProbability" runat="server" cssclass="SelectStandard"></asp:dropdownlist>
        </div>
        <div class="PanelField">
            <asp:label id="lblUpdateOppStatus" runat="server" AssociatedControlID="ddUpdateOppStatus"></asp:label>
            <asiweb:BusinessDropDownList ID="ddUpdateOppStatus" runat="server" DataSourceComponentName="OpportunityStatusRef"></asiweb:BusinessDropDownList>
        </div>
    </asiweb:PanelTemplateColumn>