<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" EnableViewState="true" CodeBehind="ProductCategoriesDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.ProductCategoriesDialog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" Style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" InitialDelayTime="200" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">

        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox ID="CategoryTextBox" runat="server" CssClass="Input" MaxLength="10" onblur="capitalize()" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" Required="True" />
            </div>
            <div>
                <asiweb:AsiRequiredFieldValidator ID="CategoryValidator" runat="server" ControlToValidate="CategoryTextBox" ErrorMessage="Category required" />
            </div>

            <div class="PanelField">
                <asiweb:BusinessTextBox ID="DescriptionTextBox" runat="server" CssClass="Input" MaxLength="255" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
            </div>

            <div class="PanelField">
                <div id="CategoryOptionsLabel" runat="server" Class="SectionLabel" />
                <div>
                    <asiweb:BusinessCheckBox ID="CommisionableCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="CommisionableChecked" DisplayCaption="true" PositionCaption="Right" RenderPanelField="true" />

                    <div class="PanelFieldValue SubItems">
                        <asiweb:BusinessTextBox ID="CommisionablePercentTextBox" runat="server" CssClass="InputSmall" Visible="false" onblur="truncate()" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true"/>
                    </div>
                    <div>
                        <asp:RegularExpressionValidator ID="CommisionablePercentRegularExpressionValidator" ControlToValidate="CommisionablePercentTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" Visible="false" />
                    </div>

                    <asiweb:BusinessCheckBox ID="ProductKitCheckBox" runat="server" DisplayCaption="true" PositionCaption="Right" RenderPanelField="true" OnCheckedChanged="KitChecked" AutoPostBack="true"/>

                    <div class="PanelFieldValue">
                        <asp:CheckBox ID="StockItemCheckBox" runat="server" />
                    </div>
                    <div>
                        <Label ID="StockItemLabel" runat="server" />
                    </div>

                    <asiweb:BusinessCheckBox ID="TaxableCheckBox" runat="server" DisplayCaption="true" PositionCaption="Right" RenderPanelField="true" />

                    <asiweb:BusinessCheckBox ID="TaxablePSTCheckBox" runat="server" Visible="false" DisplayCaption="true" PositionCaption="Right" RenderPanelField="true" />

                    <asiweb:BusinessDropDownList ID="TaxCodeDropDownList" runat="server" Visible="false" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />

                    <asiweb:BusinessCheckBox ID="PublicationDemographicsCheckBox" runat="server" DisplayCaption="true" PositionCaption="Right" RenderPanelField="true" />
                </div>
            </div>

            <div class="PanelField">
                <div id="UserDefinedFieldsLabel" runat="server" class="SectionLabel" />
                <div>
                    <asiweb:BusinessTextBox ID="UserDefinedFieldOne" runat="server" CssClass="Input" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                    <asiweb:BusinessTextBox ID="UserDefinedFieldTwo" runat="server" CssClass="Input" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                    <asiweb:BusinessTextBox ID="UserDefinedFieldThree" runat="server" CssClass="Input" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                    <asiweb:BusinessTextBox ID="UserDefinedFieldFour" runat="server" CssClass="Input" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                </div>
            </div>

            <div class="PanelField">
                <div id="DefaultAccountsLabel" runat="server" class="SectionLabel" />
                <div>
                    <asiweb:BusinessDropDownList ID="IncomeDropDownList" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                </div>
                <div>
                    <asiweb:BusinessDropDownList ID="InventoryDropDownList" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                </div>
                <div>
                    <asiweb:BusinessDropDownList ID="CostOfGoodsDropDownList" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                </div>
                <div>
                    <asiweb:BusinessDropDownList ID="AdjustmentsDropDownList" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                </div>
            </div>

        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script type="text/javascript">

        function ShowLoadingPanel() {
            if (Page_IsValid)
                jQuery("#<%#LoadingPanel.ClientID%>").show();
        }

        function capitalize() {
            var oSource = window.event.srcElement;
            if (oSource.value) {
                oSource.value = oSource.value.toUpperCase();
            }
        }
        
        function truncate() {
            var oSource = window.event.srcElement;
            if (!isNaN(oSource.value) && oSource.value) {
                oSource.value = parseFloat(oSource.value).toFixed(2);;
            }            
        }
    </script>

</asp:Content>