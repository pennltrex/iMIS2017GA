<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="AsiCommon_Controls_experiencemanagement_ReviewExperienceReject" Codebehind="ReviewExperienceReject.aspx.cs" %>
<asp:Content id="RejectDialog" runat="server" ContentPlaceHolderID="TemplateBody">
<script type="text/javascript">    
    function ReturnRejectInfo()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        var txtRejectNote = document.getElementById("<%= txtRejectNote.ClientID %>");
        var hdnCustomerExperienceKey = document.getElementById("<%= hdnCustomerExperienceKey.ClientID %>");
        oWindow.RejectAction = GetRadioButtonValue("<%= rdReject.ClientID %>");
        oWindow.RejectNote = txtRejectNote == null ? "" : txtRejectNote.value;
        oWindow.RejectKey = hdnCustomerExperienceKey.value;
        oWindow.result = "RejectDialog";
        oWindow.Close();
        
    }
    
    function GetRadioButtonValue(id)
    {
        if (document.getElementById(id) != null) {
            var radio = document.getElementById(id).getElementsByTagName("input");
            for (var j = 0; j < radio.length; j++) {
                if (radio[j].checked)
                    return(radio[j].value);
            }
            return "";
        }
        return "";
    }

</script>
<asp:Panel id="ContentPanel" runat="server" Visible="true" >
    
    <input type="hidden" id="hdnCustomerExperienceKey" runat="server" />

    <asp:RadioButtonList id="rdReject" runat="server" OnSelectedIndexChanged="rdReject_OnSelectedIndexChanged" AutoPostBack="True"></asp:RadioButtonList>

    <div class="PanelField Left" ID="NoteDiv" runat="server">
        <div class="PanelFieldLabel"> 
            <asp:Label id="lblNote" runat="server" text="" AssociatedControlID="txtRejectNote"></asp:Label>
        </div>
        <div class="PanelFieldValue"> 
            <asp:TextBox id="txtRejectNote" runat="server" TextMode="MultiLine" CssClass="InputXLarge" Rows="5"></asp:TextBox>
        </div>
    </div>

</asp:Panel>
</asp:Content>