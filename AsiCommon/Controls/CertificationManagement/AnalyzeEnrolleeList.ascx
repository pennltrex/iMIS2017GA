<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CertificationManagement_AnalyzeEnrolleeList" Codebehind="AnalyzeEnrolleeList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Enrollments by enrollee" ShowHeader="True" Collapsible="False" ShowBorder="False">
            
    <asiweb:Lister2 ID="ProgramList"
        runat="server" 
        LinkTargetBehavior="SameWindow"
        LinkProperty="Name"
        SelectColumnLocation="None"
        AllowNaturalSort="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/RegistrantSearch/ByEnrollee"
        CollapsiblePanelTemplate="false"
        DisableQueryEdit="true" />
     
</asiweb:PanelTemplateControl2>