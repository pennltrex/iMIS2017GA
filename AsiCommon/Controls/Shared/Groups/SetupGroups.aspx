<%@ Page Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_Groups_SetupGroups" Codebehind="SetupGroups.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="SetupGroups" Src="setupgroups.ascx" %>
<asp:Content id="SetupGroups" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:setupgroups id="SetupGroupsControl" runat="server" UseParentAtomObject="true" />
</asp:Content>