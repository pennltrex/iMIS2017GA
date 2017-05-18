<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.OfferingMain" Codebehind="OfferingMain.ascx.cs" %>
<%@ Register Src="OfferingSummary.ascx" TagName="Summary" TagPrefix="offering" %>
<%@ Register Src="OfferingEdit.ascx" TagName="Edit" TagPrefix="offering" %>

<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" BorderStyle="None">  
    <div class="FloatRight" style="padding-bottom:10px;">
        <asiWeb:StyledButton ID="btnSaveAs" runat="server" />
        <asiweb:StyledButton ID="btnNewOffering" runat="server" CausesValidation="false" />
        <asiweb:StyledButton ID="btnDeleteOffering" runat="server" CausesValidation="false" />
    </div>       
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" />
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
        </Tabs>
    </telerik:RadTabStrip>     
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px;">
        <telerik:RadPageView runat="server" ID="SummaryPage">                                              
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <offering:Summary ID="offeringSummary" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>                                                        
        </telerik:RadPageView>    
        <telerik:RadPageView runat="server" ID="DefinitionPage">                                         
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <offering:Edit ID="offeringEdit" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>                                                        
        </telerik:RadPageView>
    </telerik:RadMultiPage>  
</asiweb:PanelTemplateControl2>
