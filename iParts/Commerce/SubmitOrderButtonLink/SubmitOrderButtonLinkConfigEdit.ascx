<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmitOrderButtonLinkConfigEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.SubmitOrderButtonLink.SubmitOrderButtonLinkConfigEdit" %>
<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="PromptUnauthenticatedUsers" runat="server" BoundPropertyName="PromptUnauthenticatedUsers" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false"/> 
            <asiweb:SmartControl TextBoxWidth="20em" ID="OrderConfirmationUrl" runat="server" BoundPropertyName="OrderConfirmationUrl" DisplayCaption="true" DataSaveUponStateChange="false" />
    </div>
    <asiweb:SmartControl 
        ID="OrderPurpose" runat="server" BoundPropertyName="OrderPurpose" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" RenderPanelField="true" ShowNullItem="false" AutoPostBack="True" />
    <asiweb:SmartControl ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
    DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />                    

</asiweb:PanelTemplateControl>