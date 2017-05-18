<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ProcessEngine.PEController" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="PEController.ascx.cs" %>

<style type="text/css">
.PEControllerPrompt
{
    width: 20%;
    vertical-align: text-top;
}
.PEControllerValue, .PEControllerValue TD
{
    white-space: nowrap;         
}
.PEControllerValue, .PEControllerValue TD, .FilterTable2 TR
{
    border-collapse: separate !important;
    padding: 1.5px;    
}
</style>
<style type="text/css">
.PEControllerPrompt
{
    width: 20%;
}
.PEControllerValue, .PEControllerValue TD
{
    white-space: nowrap;
}
</style>
<asp:PlaceHolder id="controlPlaceholder" runat="server"></asp:PlaceHolder>
