<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationProgram" Codebehind="CertificationProgramMain.ascx.cs" %>
<%@ Register Src="CertificationProgramSummary.ascx" TagName="CertificationProgramSummary" TagPrefix="asiweb" %>
<%@ Register Src="CertificationProgramDefinition.ascx" TagName="CertificationProgramDefinition" TagPrefix="asiweb" %>
<%@ Register Src="CertificationProgramRequirements/CertificationRequirementEdit.ascx" TagName="CertificationProgramRequirement" TagPrefix="asiweb" %>
<%@ Register Src="CertificationProgramProductList.ascx" TagName="CertificationProgramProduct" TagPrefix="asiweb" %>

<script type="text/javascript">
    function ActiveTabChanged(sender, e) {
        var activeTab = $get('<%=activeTab.ClientID%>');
        activeTab.value = sender._selectedIndex;
    }
</script>

<asiweb:PanelTemplateControl2 ID="ptcCertificationProgram" runat="server" Collapsible="false" BorderStyle="None">
    
    <div class="FloatRight" style="padding-bottom:10px;">
        <asiWeb:StyledButton ID="btnEditProgramGroup" runat="server" CausesValidation="false" />
        <asiWeb:StyledButton ID="btnSaveAs" runat="server" />
        <asiweb:StyledButton ID="btnNewCertificationProgram" runat="server" CausesValidation="false" />
        <asiweb:StyledButton ID="btnDeleteCertificationProgram" runat="server" CausesValidation="false" />
    </div>
    
    <asp:HiddenField ID="activeTab" runat="server" /> 
    
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" OnClientTabSelected="ActiveTabChanged">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" />
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
            <telerik:RadTab Text="Requirement" PageViewID="RequirementPage" />
            <telerik:RadTab Text="Products" PageViewID="ProductsPage" Visible="False"/>
        </Tabs>
    </telerik:RadTabStrip> 
              
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay">
        <telerik:RadPageView runat="server" ID="SummaryPage">                
            <asiweb:CertificationProgramSummary ID="CertificationProgramSummary1" runat="server"/> 
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="DefinitionPage">     
            <asiweb:CertificationProgramDefinition ID="CertificationProgramDefinition1" runat="server"/>    
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RequirementPage">
            <asiweb:CertificationProgramRequirement ID="CertificationProgramRequirement" runat="server" />
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="ProductsPage" Enabled="False">
            <asiweb:CertificationProgramProduct ID="CertificationProgramProductsList" runat="server"  />
        </telerik:RadPageView>
    </telerik:RadMultiPage> 
                
</asiweb:PanelTemplateControl2>
