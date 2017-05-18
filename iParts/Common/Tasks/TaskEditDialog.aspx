<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskEditDialog.aspx.cs" Inherits="Asi.Web.iParts.Common.Tasks.TaskEditDialog" %>
<%@ Register tagPrefix="uc1" tagName="TaskControl" src="Task.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">    
    <uc1:TaskControl ID="TaskUserControl" runat="server" />
</asp:Content>
