<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_ResponseStagingContainer" Codebehind="ResponseStagingContainer.ascx.cs" %>

<asp:HiddenField runat="server" ID="AllStageLines" />

<div style="width:95%">
    <div style="width:100%; margin-bottom: 15px;">
        <div class="CommandBar">
            <asiWeb:StyledButton runat="server" ID="CancelButton" Text="Cancel" />&nbsp;
            <asiWeb:StyledButton runat="server" ID="SaveButton" Text="Continue" />
        </div>
    </div>
    <h3 style="margin-bottom: 15px;"><%#CampaignName%></h3>
    <div style="overflow :auto">
    <asp:Table runat="server" ID="ResponseStagingTable" CssClass="Grid" >
        <asp:TableRow runat="server" CssClass="GridHeader" ID="HeaderRow">
            <asp:TableCell><asiweb:StyledLabel runat="server" Text="Appeal" /></asp:TableCell>
            <asp:TableCell><asiweb:StyledLabel runat="server" Text="Solicitation" /></asp:TableCell>
            <asp:TableCell><asiweb:StyledLabel runat="server" Text="SourceCode" /></asp:TableCell>
            <asp:TableCell><asiweb:StyledLabel runat="server" Text="Comparison" /></asp:TableCell>
            <asp:TableCell><asiweb:StyledLabel runat="server" Text="State" /></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="AddRow" CssClass="PanelTableData">
            <asp:TableCell><asp:DropDownList id="AppealInput" runat="server" /></asp:TableCell>
            <asp:TableCell><asp:DropDownList id="SolicitationInput" runat="server" /></asp:TableCell>
            <asp:TableCell><asp:DropDownList id="SourceCodeInput" runat="server" /></asp:TableCell>
            <asp:TableCell><asp:DropDownList id="ComparatorInput" runat="server"><asp:ListItem Value="Equal">Equal</asp:ListItem><asp:ListItem value="NotEqual">Not Equal</asp:ListItem></asp:DropDownList></asp:TableCell>
            <asp:TableCell><asp:DropDownList id="StateInput" runat="server" DataSource="<%#GetResponseTypes()%>"  /></asp:TableCell>
            <asp:TableCell><a href="javascript:AddButtonClick()" title="Add">add</a></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
    <asp:DropDownList id="ConnectiveInput" runat="server">
        <asp:ListItem Value="AND">AND</asp:ListItem>
        <asp:ListItem Value="OR">OR</asp:ListItem>
    </asp:DropDownList>
</div>
