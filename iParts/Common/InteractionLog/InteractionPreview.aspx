<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InteractionPreview.aspx.cs" Inherits="Asi.Web.iParts.Common.InteractionLog.InteractionPreview" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:content id="MainContent" contentplaceholderid="TemplateBody" runat="server">
<asp:Panel runat="server" ID="MessagePanel" Style="padding:0 1% 3.5em 1%;">
    <div class="ButtonPanel NotPrinted">
        <div class="CommandBar" style="width:98%;top:1em;left:0;position:absolute;">
            <asiweb:StyledButton ID="sendBtn" runat="server" OnClick="SendEmail" Text="Resend" CssClass="TextButton PrimaryButton" /> 
            <asiweb:StyledButton ID="printBtn" runat="server" OnClick="PrintEmail" Text="Download" CssClass="TextButton PrimaryButton" />             
        </div> 
    </div>   
    <div class="ClearFix">
        <div class="PanelField">
            <span class="Label">To</span>
            <div class="PanelFieldValue" runat="server" ID="ToDiv"></div>
        </div>
        <div class="PanelField">
            <span class="Label">CC</span>
            <div class="PanelFieldValue" runat="server" ID="CCDiv">someone@advsol.com</div>
        </div>
        <div class="PanelField">
            <span class="Label">From</span>
            <div class="PanelFieldValue" runat="server" ID="FromDiv">admin@advsol.com</div>
        </div>
        <div class="PanelField">
            <span class="Label">Subject</span>
            <div class="PanelFieldValue" runat="server" ID="SubjectDiv"></div>
        </div>
    </div>
    <hr />
    <div runat="server" id="MessageDiv">
        <asp:Literal runat="server" ID="LiteralMessage"/>
    </div>
    <div runat="server" id="AttachmentDiv" Visible="False">
        <div class="PanelField">
            <label runat="server" ID="AttachmentLabel" CssClass="PanelFieldLabel"></label>
        </div>
    </div>
    <div class="ClearFix"></div>      
</asp:Panel>

<div class="ButtonPanel NotPrinted">
    <div class="CommandBar" style="width:98%;bottom:0.5em;position:absolute;">            
        <asiweb:StyledButton ID="btnClose" runat="server" OnClientClick="GetRadWindow().Close();" Text="Close" CssClass="TextButton Cancel" />
    </div> 
</div>             
</asp:content>