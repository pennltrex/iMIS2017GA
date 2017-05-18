<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.ExperienceDefinition" Codebehind="ExperienceDefinition.ascx.cs" %>
<%@ Register Src="ExperienceDefinitionSummary.ascx" TagName="Summary" TagPrefix="experienceDefinition" %>
<%@ Register Src="ExperienceDefinitionEdit.ascx" TagName="Edit" TagPrefix="experienceDefinition" %>
<%@ Register Src="OfferingList.ascx" TagName="OfferingList" TagPrefix="experienceDefinition" %>

<asiweb:PanelTemplateControl ID="mainPanel" runat="server" Collapsible="false" BorderStyle="None">

    <div class="CommandBar">
        <asiWeb:StyledButton ID="btnSaveAs" runat="server" />
        <asiweb:StyledButton ID="btnNewExperience" runat="server" CausesValidation="false" />
        <asiweb:StyledButton ID="btnDeleteExperience" runat="server" CausesValidation="false" />
    </div>
    
    <div>
        <ajaxToolkit:TabContainer ID="tabContainer" runat="server">
            <ajaxToolkit:TabPanel ID="summary" runat="server" HeaderText="Summary">
                <ContentTemplate>
                    <experienceDefinition:Summary ID="experienceDefinition" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="definition" runat="server" HeaderText="Definition">
                <ContentTemplate>
                    <experienceDefinition:Edit ID="editableExperienceDefinition" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="offerings" runat="server" HeaderText="Offerings" Enabled=<%# !IsNewObject %>>
                <ContentTemplate>
                    <experienceDefinition:OfferingList id="offeringList" runat="server" />
                </ContentTemplate>
           </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
</asiweb:PanelTemplateControl>
