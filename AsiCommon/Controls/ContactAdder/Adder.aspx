<%@ Page Language="c#" AutoEventWireup="false" Inherits="ContactAdder.Adder" Title="Select Item" Codebehind="Adder.aspx.cs" %>

<%@ Register TagPrefix="uc1" TagName="Adder" Src="Adder.ascx" %>

<asp:Content id="AdderContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:Adder id="Adder1" runat="server"/>
</asp:Content>
