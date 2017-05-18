<%@ Page Language="C#" AutoEventWireup="true" Inherits="BusinessTreeDialog" Codebehind="BusinessTreeDialog.aspx.cs" %>
<%@ Register Src="BusinessTree.ascx" TagName="BusinessTree" TagPrefix="uc2" %>


<asp:Content id="TreeContent" runat="server" ContentPlaceHolderID="TemplateBody">

<div style="width:100%">
       <uc2:BusinessTree ID="BusinessTree1" runat="server"></uc2:BusinessTree>    
</div>

</asp:Content>
