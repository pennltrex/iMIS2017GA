<%@ Page Title="Import Tag Hierarchy" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_TagImport" Codebehind="TagImport.aspx.cs" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <script type="text/javascript">
    // this function is called by clicking the OK button.
    // it calls the appropriate function based on what stage we're in.
    function OK_Click()
    {
        var step = <%= CurrentStep %>;
        switch (step)
        {
            case 1:
                // Stage 1 - upload a file
                document.getElementById('<%= UploadButton.ClientID %>').click();
                break;
            case 2:
                // stage 2 - after importing
                document.getElementById('<%= CleanupButton.ClientID %>').click();
                break;
            default:
                ReturnAndClose();
                break;
        }
    }
    function ReturnAndClose()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        oWindow.Close();
    }
    </script>
    <asiweb:PanelTemplateControl2 ID="ImporterControlPanel" runat="server" FieldSet="true" Collapsible="false" TemplateTitle="Import Settings" ShowHeader="false" ShowBorder="False">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="FileUploadPanel" runat="server">
                    <div class="PanelField Left Section">
                        <asp:label id="FileToImportLabel" runat="server" Text="Import File" AssociatedControlID="FileUpload" />
                        <div class="PanelFieldValue">
                            <input type="file" id="FileUpload" accept="text/xml" runat="server" />
                        </div>
                    </div>
                    <asiweb:StyledButton ID="UploadButton" runat="server" Text="Upload and Import Tags" OnClick="UploadButton_Click" CssClass="PrimaryButton" />
                </asp:Panel>
                <asp:Panel ID="ImportPanel" runat="server" Visible="false">
                    <div class="PanelField Top">
                        <asp:label id="MessagesLabel" runat="server" Text="Messages" AssociatedControlID="MessagesPanel" />
                        <asp:Panel CssClass="PanelFieldValue AddPadding" id="MessagesPanel" BackColor="white" runat="server" BorderWidth="1" style="overflow: auto;" 
                            Height="500px" Width="100%">
                            <asp:Repeater id="MessagesRepeater" runat="server">
                                <ItemTemplate>
                                    <asp:label id="Message1" Width="100%" runat="server" CssClass="GridRow" /><br />
                                </ItemTemplate>
                                <AlternatingItemTemplate><asp:label id="Message2" Width="100%" runat="server" CssClass="GridAlternateRow"></asp:label><br></AlternatingItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </div>
                </asp:Panel>
                <asp:Button ID="CleanupButton" runat="server" OnClick="CleanupButton_Click" style="display:none;" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="UploadButton" />
                <asp:PostBackTrigger ControlID="CleanupButton" />
            </Triggers>
        </asp:UpdatePanel>
    </asiweb:PanelTemplateControl2>
</asp:Content>
