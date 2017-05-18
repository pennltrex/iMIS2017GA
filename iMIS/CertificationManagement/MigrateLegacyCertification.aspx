<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MigrateLegacyCertification.aspx.cs" Inherits="iMIS_CertificationManagement_MigrateLegacyCertification" %>
<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">           
    <asiweb:PanelTemplateControl2 ID="LegacyCertificationMigration" runat="server" Collapsible="false" ShowBorder="False" ShowHeader="False">
        <asiweb:StyledButton runat="server" Id="MigrateLegacyCertification" Text="Migrate legacy certification" OnClick="MigrateLegacyCertification_OnClick" Visible="False" />        
        <asiweb:StyledButton runat="server" Id="Refresh" Text="Refresh" OnClick="Refresh_OnClick" Visible="False"/>
        <asiweb:StyledButton runat="server" Id="Resume" Text="Resume" OnClick="Resume_OnClick" Visible ="False"/>            
    </asiweb:PanelTemplateControl2>   
</asp:Content>