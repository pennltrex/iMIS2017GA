<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ProcessManager.NoteActionEdit" Codebehind="NoteActionEdit.ascx.cs" %>

<script type="text/javascript">
    function CloseWindowAndReturnValue(result)
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        oWindow.result = result;
        oWindow.Close();
    }
</script>

<div class="CommandBar">           
    <asiweb:StyledButton ID="btnDeleteTask" OnClick="btnDelete_Click" runat="server" />
    <asiweb:StyledButton ID="btnContinueTask" OnClick="btnContinue_Click" runat="server" />             
</div>
<asp:UpdatePanel ID="upnlNoteAction" UpdateMode="Conditional" runat="server">
    <ContentTemplate>
        <div class="PanelBlock FullWidth">
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel id="lblSubject" runat="server" CssClass="Required" AssociatedControlID="txtSubject" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox id="txtSubject" runat="server" />
                </div>
            </div>
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel id="lblBody" runat="server" AssociatedControlID="txtBody" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox id="txtBody" runat="server" textmode="MultiLine" />
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>