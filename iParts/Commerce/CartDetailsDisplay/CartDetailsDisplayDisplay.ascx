<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartDetailsDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.CartDetailsDisplay.CartDetailsDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <script type="text/javascript">
        //<![CDATA[
        // Fire all validators in the Asi.Web.iParts.Commerce.CartDetailsDisplay.CartDetailsDisplayDisplay ValidationGroup
        // We use this to fire validators in Asi.Web.iParts.Commerce.CartDetailsDisplay.CartDetailsDisplayDisplay when the commit button is clicked.
        // There is a custom validator on the page, that has no validation group. It calls this function.
        function <%=ClientID%>_RunAllValidators(source, args)
        {
            if (typeof Page_ClientValidate == "function" )
            {
                Page_ClientValidate("Asi.Web.iParts.Commerce.CartDetailsDisplay.CartDetailsDisplayDisplay");
            }
        }

        // Fail a custom validator
        function <%=ClientID%>_FailCustomValidator(source, args)
        {
            args.IsValid = source.isvalid;
        }

        //]]>
    </script>
    <asp:UpdatePanel runat="server" ID="CartDetailsUpdatePanel" UpdateMode="Always">
        <ContentTemplate>
            <div runat="server" ID="TransactionDateDiv" Visible="False">
                <asiweb:BusinessCheckBox runat="server" ID="OverrideTransactionDate" CssClass="PanelFieldValue" RenderPanelField="False" Enabled="True" OnCheckedChanged="OverrideTransactionDate_OnCheckedChanged" AutoPostBack="True" />
                <asiweb:StyledLabel runat="server" ID="OverrideTransactionDateLabel" CssClass="PanelFieldLabel" AssociatedControlID="OverrideTransactionDate" translate="yes"></asiweb:StyledLabel>
                <asiweb:BusinessCalendar2 runat="server" ID="TransactionDate" CssClass="PanelFieldValue" RenderPanelField="False" DisplayCaption="False" OnDataChanged="TransactionDate_OnDataChanged" AutoPostBack="True" UseSqlDateTimeMinValue="true" />
                <div style="clear: both;"></div>
            </div>
            <asiweb:PanelTemplateControl2 id="DataPanel" runat="server" Text='<%# ResourceManager.GetPhrase("Items", "Items") %>' Collapsed="false" Collapsible="false" BorderWidth="0" translate="yes">
                <asp:HiddenField ID="HiddenFocusableFieldId" runat="server" />
                <asiweb:Lister2 ID="ItemGrid" runat="server" AjaxEnabled="false" SelectColumnLocation="None"
                    EditColumnLocation="None" DeleteColumnLocation="End" DeleteColumnText='<%# ResourceManager.GetPhrase("Remove", "Remove") %>'
                    DeleteConfirmText="" DeleteColumnToolTip='<%# ResourceManager.GetPhrase("RemoveFromCart", "Remove this item from the cart") %>' 
                    OnItemDeleted="ItemGrid_OnItemDeleted" EnableClientSideDelete="false"
                    OnNeedDataSource="ItemGrid_OnNeedDataSource" OnItemDataBound="ItemGrid_OnItemDataBound"
                    TargetPreserveStatefulBusinessContainer="true" SortingEnabled="false" OnItemCreated="ItemGrid_OnItemCreated" ShowHeadersWhenNoRecords="false" AllowGridRowSelectStyle="False" />
                <%-- Following DIV is essential to make borders draw properly --%>
                <div style="clear:both;"></div>
                <br />
                <div style="text-align: right;">
                    <!-- JB 2011-08-05 - Removed the ValidationSummary control  -->
                    <!-- The ValidationSummary does not work properly when we fire the validation group from code i.e. from the _RunAllValidators() function. -->
                    <!-- When you fire validators from code, the validation summary just disappears. So clicking the Update button it appears, but clicking the SubmitOrder button it disappears. -->
                    <!-- This results in a obviously wrong looking UI. Better to remove the control. You can still see the errors against the lines in the Cart. -->
                    <asiweb:StyledButton ID="Update" visible="true" runat="server" Text="Update" OnClick="UpdateClick" ValidationGroup='<%# ValidationGroup %>' CausesValidation="true" />
                </div>
                <%-- Following DIV is essential to make borders draw properly --%>
                <div style="clear:both;"></div>
                <asp:HiddenField ID="QuantityClientIds" runat="server" />
                <div style="display:none;visibility:hidden">
                    <!-- Hidden validator, used to run all the other validators in the Asi.Web.iParts.Commerce.CartDetailsDisplay.CartDetailsDisplayDisplay ValidationGroup when someone clicks next or commit in the command buttons -->
                    <!-- Normally in this instance the validators wouldn't run because they have a ValidationGroup assigned -->
                    <!-- We use this CustomValidator, which does not have a validation group, to force the other validators to run -->
                    <asp:CustomValidator runat="server" ID="cvRunAllValidators" Enabled="true" ></asp:CustomValidator>
                </div>        

            </asiweb:PanelTemplateControl2>


            <asiweb:PanelTemplateControl2 id="panInvoices" runat="server" Text='<%# ResourceManager.GetPhrase("Invoices", "Invoices") %>' Collapsed="false" Collapsible="false" BorderWidth="0">

                <asiweb:Lister2 ID="invoiceGrid" runat="server" AjaxEnabled="false" SelectColumnLocation="None"
                    EditColumnLocation="None" DeleteColumnLocation="End" DeleteColumnText='<%# ResourceManager.GetPhrase("PayLater", "Pay Later") %>'
                    DeleteConfirmText="" DeleteColumnToolTip='<%# ResourceManager.GetPhrase("RemoveInvoiceFromCart", "Remove this invoice from the cart") %>' 
                    EnableClientSideDelete="false" OnNeedDataSource="InvoiceGrid_OnNeedDataSource"
                    OnItemCreated="InvoiceGrid_OnItemCreated" OnItemDataBound="InvoiceGrid_OnItemBound" OnItemDeleted="ItemGrid_OnItemDeleted"
                    TargetPreserveStatefulBusinessContainer="true" SortingEnabled="false" />
                <%-- Following DIV is essential to make borders draw properly --%>
            </asiweb:PanelTemplateControl2>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ItemGrid"/>
            <asp:PostBackTrigger ControlID="invoiceGrid"/>
            <asp:PostBackTrigger ControlID="Update"/>
        </Triggers>
    </asp:UpdatePanel>
    <div runat="server" id="DivErrors" visible="false">
        <asp:Label ID="noSoaErrorText" runat="server" CssClass="Error" Text='<%# ResourceManager.GetPhrase("SoaServiceUnavailable", "Temporarily Unavailable") %>' />
    </div>
</asp:Panel>