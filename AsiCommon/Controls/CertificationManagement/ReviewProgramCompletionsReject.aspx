<%@ Page Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CertificationManagement_ReviewProgramCompletionsReject" Codebehind="ReviewProgramCompletionsReject.aspx.cs" %>
<asp:Content id="RejectDialog" runat="server" ContentPlaceHolderID="TemplateBody">
<script type="text/javascript">    
    function ReturnRejectInfo()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        var txtRejectNote = document.getElementById("<%= txtRejectNote.ClientID %>");
        var hdnProgramRegKey = document.getElementById("<%= hdnProgramRegKey.ClientID %>");
        oWindow.RejectNote = txtRejectNote.value;
        oWindow.RejectKey = hdnProgramRegKey.value;
        oWindow.result = "RejectDialog";
        oWindow.Close();
    }
    
</script>
<input type="hidden" id="hdnProgramRegKey" runat="server" />
<table>
    <tr>
        <td class="PanelTablePrompt">
            <asp:Label id="lblNote" runat="server" text=""></asp:Label>&nbsp
        </td>
        <td class="PanelTablePrompt">
            <asp:TextBox id="txtRejectNote" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
</asp:Content>

