<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EngagementScoreFormulaCreator.aspx.cs" Inherits="Asi.Web.iParts.Communications.EngagementScoreFormulaList.EngagementScoreFormulaCreator" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Register TagName="PanelDialog" TagPrefix="uc1" Src="EngagementScoreFormulaEdit.ascx" %>

<asp:content contentplaceholderid="TemplateBody" id="ContentBody" runat="server">    
    <uc1:PanelDialog ID="MethodSetEditor" runat="server"></uc1:PanelDialog>    
</asp:content>