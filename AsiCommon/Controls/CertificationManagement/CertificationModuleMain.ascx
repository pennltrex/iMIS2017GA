<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.CertificationModuleMain" Codebehind="CertificationModuleMain.ascx.cs" %>
<%@ Register Src="CertificationModuleSummary.ascx" TagName="Summary" TagPrefix="certificationModule" %>
<%@ Register Src="CertificationModuleDefinition.ascx" TagName="Definition" TagPrefix="certificationModule" %>
<%@ Register Src="../experiencemanagement/OfferingList.ascx" TagName="OfferingList" TagPrefix="certificationModule" %>
<%@ Register Src="CertificationModuleProductList.ascx" TagName="CertificationModuleProduct" TagPrefix="certificationModule" %>

<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" BorderStyle="None">
    <div class="FloatRight" style="padding-bottom:10px;">
        <asiWeb:StyledButton ID="btnSaveAs" runat="server" />
        <asiweb:StyledButton ID="btnNewCertificationModule" runat="server" CausesValidation="false" />
        <asiweb:StyledButton ID="btnDeleteCertificationModule" runat="server" CausesValidation="false" />
    </div>   
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" />
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
            <telerik:RadTab Text="Offerings" PageViewID="OfferingsPage" />
            <telerik:RadTab Text="Products" PageViewID="ProductsPage" Visible="false" />
        </Tabs>
    </telerik:RadTabStrip>        
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px;">
        <telerik:RadPageView runat="server" ID="SummaryPage">                                              
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <certificationModule:Summary ID="certificationModule" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>                                                        
        </telerik:RadPageView>    
        <telerik:RadPageView runat="server" ID="DefinitionPage">                                         
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <certificationModule:Definition ID="certificationModuleDefinition" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>                                                        
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="OfferingsPage">                                         
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <certificationModule:OfferingList id="offeringList" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>                                                        
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="ProductsPage">                                         
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <certificationModule:CertificationModuleProduct ID="CertificationModuleProductsList" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>                                                        
        </telerik:RadPageView>		
    </telerik:RadMultiPage>        
</asiweb:PanelTemplateControl2>
