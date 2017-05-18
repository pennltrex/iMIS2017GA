<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ExperienceManagement.Program" Codebehind="Program.ascx.cs" %>
<%@ Register Src="ProgramSummary.ascx" TagName="ProgramSummary" TagPrefix="asiweb" %>
<%@ Register Src="ProgramDefinition.ascx" TagName="ProgramDefinition" TagPrefix="asiweb" %>
<%@ Register Src="ExperienceDefinitionList.ascx" TagName="ExperienceDefinitionList" TagPrefix="asiweb" %>

<asiweb:PanelTemplateControl ID="ptcProgram" runat="server" Collapsible="false" BorderStyle="None">
    <div class="CommandBar">
        <asiWeb:StyledButton ID="btnSaveAs" runat="server" />
        <asiweb:StyledButton ID="btnNewProgram" runat="server" CausesValidation="false" />
        <asiweb:StyledButton ID="btnDeleteProgram" runat="server" CausesValidation="false" />
    </div>
    <div>
        <ajaxToolkit:TabContainer ID="tabContainer" runat="server">
            <ajaxToolkit:TabPanel ID="tabSummary" runat="server" HeaderText="Summary">
                <ContentTemplate>
                    <asiweb:ProgramSummary runat="server"/>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tabDefinition" runat="server" HeaderText="Definition">
                <ContentTemplate>
                    <asiweb:ProgramDefinition runat="server"/>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tabExperiences" runat="server" HeaderText="Experiences" Enabled="<%# !IsNewObject%>">
                <ContentTemplate>
                    <asiweb:ExperienceDefinitionList runat="server" />
                </ContentTemplate>
           </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
</asiweb:PanelTemplateControl>
