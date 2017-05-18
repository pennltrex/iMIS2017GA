<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.CertificationStageEdit" Codebehind="CertificationStageEdit.ascx.cs" %>

<asiweb:PanelTemplateColumn ID="StageUIPanelColumn1" runat="server">
    <div class="PanelField">
        <asiweb:StyledLabel ID="lblName" runat="server" AssociatedControlID="txtName" />
        <asiweb:BusinessTextBox ID="txtName" runat="server" CssClass="WideTextBox" />
    </div>
    <div class="PanelField">
        <asiweb:StyledLabel ID="lblDescription" runat="server" AssociatedControlID="txtDescription" />
        <asiweb:BusinessTextBox ID="txtDescription" runat="server" TextMode="MultiLine" />
    </div>        
</asiweb:PanelTemplateColumn>
<asiweb:PanelTemplateColumn ID="StageUIPanelColumn2" runat="server">
    <div class="AutoWidth">
        <asiweb:BusinessCheckBox ID="cbRequired" runat="server"  TextAlign="Right" RenderPanelField="true" DisplayCaption="true" PositionCaption="Right" Caption="Required" />
    </div>
</asiweb:PanelTemplateColumn>
