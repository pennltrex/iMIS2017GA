<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommunicationPreview.aspx.cs" Inherits="Asi.Web.iParts.Communications.CommunicationCreator.CommunicationPreview" %>

<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>


<asp:content id="Content1" contentplaceholderid="TemplateBody" runat="Server">
    <div class="AddPadding">
        <div runat="server" id="DivPreviewContainer">
            <div id="DivEmailHeader" class="ClearFix Section">
                <div class="PanelBlock FloatLeft">
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel ID="LabelFrom" runat="server" AssociatedControlID="TxtFrom" Text="From"/>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" Enabled="False" ID="TxtFrom" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" />
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel ID="LabelTo" runat="server" AssociatedControlID="TxtTo" Text="To"/>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" Enabled="False" ID="TxtTo" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" />
                        </div>
                    </div>
                    <div class="PanelField Left" runat="server" ID="CCField">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel ID="LabelCopyTo" runat="server" AssociatedControlID="TxtCc" Text="Cc"/>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" Enabled="False" ID="TxtCc" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" />
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel ID="LabelSubject" runat="server" AssociatedControlID="TxtSubject" Text="Subject"/>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" Enabled="False" ID="TxtSubject" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" />
                        </div>
                    </div>
                </div>
                <div class="FloatRight AlignRight">
                    <div class="Section">
                        <asiweb:StyledLabel runat="server" ID="txtRecordNumber"></asiweb:StyledLabel>
                        <asiweb:StyledButton runat="server" ID="PrevButton" OnClientClick="DisableAllButtons();" OnClick="PrevButton_Click" />
                        <asiweb:StyledButton runat="server" ID="NextButton" OnClientClick="DisableAllButtons();" OnClick="NextButton_Click" />
                    </div>
                    <asiweb:StyledButton runat="server" CssClass="PrimaryButton" ID="ButtonSend" OnClientClick="DisableAllButtons();CloseDialog('SendEmails');" Text="Send All Now" />
                </div>
            </div>
            <hr />
            <asp:Panel runat="server" ID="EmailTextPanel">
                <asp:Literal runat="server" ID="LiteralEmailBody"></asp:Literal>
            </asp:Panel>
        </div>
    </div>
    
    <script type="text/javascript">
        // close the dialog

        function CloseDialog(action) {
            var w = GetRadWindow();
            if (w == null) return;
            var r = ConstructResultsObject();
            r.Action = action;
            w.AsiResults = r;
            w.Close();
        }

        // construct the return object
        function ConstructResultsObject() {
            return { Action: "" };
        }

        function DisableAllButtons() {
            jQuery(":button").attr('disabled', 'disabled');
        }

    </script>
</asp:content>

