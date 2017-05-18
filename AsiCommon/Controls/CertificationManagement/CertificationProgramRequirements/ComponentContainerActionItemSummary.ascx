<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.ComponentContainerActionItemSummary" Codebehind="ComponentContainerActionItemSummary.ascx.cs" %>
<%@ Register Src="ComponentActionItemSetSummary.ascx" TagName="ComponentActionItem" TagPrefix="ProcessBlueprint" %>
<%@ Register Src="BooleanBinaryOperatorEdit.ascx" TagName="BBinaryOperator" TagPrefix="ProcessBlueprint" %>
    
    <asp:LinkButton ID="btnAddSet" runat="server" />

    <asp:Repeater ID="rptComponent" runat="server">
        <ItemTemplate>
            <ProcessBlueprint:ComponentActionItem 
                CertificationProgramKey='<%# CertificationProgramKey %>'
                StageId='<%# StageId %>' 
                ActionItemId='<%# ActionItemId %>' 
                OperandIndex='<%# Container.ItemIndex %>'
                runat="server" />
        </ItemTemplate>
        <AlternatingItemTemplate>
            <ProcessBlueprint:BBinaryOperator 
                StageId='<%# StageId %>' 
                ActionItemId='<%# ActionItemId %>' 
                OperandIndex='<%# Container.ItemIndex %>' 
                runat="server" />
        </AlternatingItemTemplate>
    </asp:Repeater>