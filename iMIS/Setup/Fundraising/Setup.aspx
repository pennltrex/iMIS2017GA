<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.FundraisingSetup" CodeBehind="Setup.aspx.cs" %>

<%@ Import Namespace="Asi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" Style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">

        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">

            <div class="SectionLabel"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("Fundraising.Setup.Receipting", "Receipting")) %></div>

            <div class="PanelField Section">
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox ID="StartingReceiptNumberTextBox" runat="server" DisplayCaption="true" PositionCaption="left" RenderPanelField="true" />
                </div>
                <asp:CustomValidator ID="StartingReceiptNumberValidator" runat="server" ControlToValidate="StartingReceiptNumberTextBox" ClientValidationFunction="ReceiptNumberValidate" />
            </div>

            <div class="SectionLabel"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("Fundraising.Setup.PremiumsAsProducts", "Premiums as products")) %></div>  
            <asiweb:BusinessDropDownList ID="PremiumOrderTypeDropDownList" runat="server" CssClass="Section" IncludeNullItem="false" DisplayCaption="true" PositionCaption="left" RenderPanelField="true" />
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <asp:HiddenField ID="StartingReceiptValue" runat="server" />

    <script type="text/javascript">
        //<![CDATA[
        function ShowLoadingPanel() {
            if (Page_IsValid)
                jQuery("#<%#LoadingPanel.ClientID%>").show();
        }

        function ReceiptNumberValidate(oSrc, args) {
            args.IsValid = true;
            StartingNumber = jQuery("#<%#StartingReceiptValue.ClientID%>").val();
            var regEx = new RegExp("^[0-9]*$");
            if (!args.Value || !regEx.test(args.Value)) {
                oSrc.innerText = "Value must be a number";
                args.IsValid = false;
            }

            if (+args.Value < +StartingNumber) {
                oSrc.innerText = "Counter number cannot be changed to a lower value";
                args.IsValid = false;
            }
        }
        //]]>
    </script>
</asp:Content>
