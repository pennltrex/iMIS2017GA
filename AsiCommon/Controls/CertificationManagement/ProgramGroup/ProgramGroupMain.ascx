<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.ProgramGroup" Codebehind="ProgramGroupMain.ascx.cs" %>
<%@ Register Src="ProgramGroupSummary.ascx" TagName="ProgramGroupSummary" TagPrefix="asiweb" %>
<%@ Register Src="ProgramGroupDefinition.ascx" TagName="ProgramGroupDefinition" TagPrefix="asiweb" %>
<asiweb:PanelTemplateControl2 ID="ptcProgramGroup" runat="server" Collapsible="false" BorderStyle="None">
    <div class="FloatRight">
        <asiweb:StyledButton ID="btnNewProgramGroup" runat="server" CausesValidation="false" />
        <asiweb:StyledButton ID="btnDeleteProgramGroup" runat="server" CausesValidation="false" />
    </div> 
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" >
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" />
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
        </Tabs>
    </telerik:RadTabStrip> 
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay">
        <telerik:RadPageView runat="server" ID="SummaryPage">                
            <asiweb:ProgramGroupSummary ID="ProgramGroupSummary1" runat="server"/>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="DefinitionPage">     
             <asiweb:ProgramGroupDefinition ID="ProgramGroupDefinition1" runat="server"/>
        </telerik:RadPageView>
    </telerik:RadMultiPage>        
</asiweb:PanelTemplateControl2>
