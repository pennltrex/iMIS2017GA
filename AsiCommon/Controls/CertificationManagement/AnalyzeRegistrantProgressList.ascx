<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.AnalyzeRegistrantProgressList" Codebehind="AnalyzeRegistrantProgressList.ascx.cs" %>
  
<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Enrollments by program" ShowHeader="True" Collapsible="False" BorderStyle="None">
            
    <asiweb:Lister2 ID="ProgramList"
        runat="server" 
        TargetUrl="~/iMIS/CertificationManagement/AnalyzeRegistrantProgressProgram.aspx"
        LinkTargetBehavior="SameWindow"
        LinkProperty="Name"
        SelectColumnLocation="None"
        AllowNaturalSort="false"
        SortPropertiesList="Name" />
     
</asiweb:PanelTemplateControl2>