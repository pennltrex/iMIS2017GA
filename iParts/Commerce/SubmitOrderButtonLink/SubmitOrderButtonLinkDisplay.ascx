<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmitOrderButtonLinkDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.SubmitOrderButtonLink.SubmitOrderButtonLinkDisplay" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi.Web.iParts.Commerce.SubmitOrderButtonLink" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>


<asp:Panel ID="CommitButtonScriptPanel" runat="server" Visible="true">
    <script type="text/javascript">
        //<![CDATA[
        // ************************************************************************************************************************
        // This script needs to be in it's own Panel because a Non-Cart (aka Donation) Order Purpose hides the entire ContentPanel.
        // ************************************************************************************************************************
    
        // Disables the Submit/Save/Donate button.
        function <%=ClientID%>_DisableCommitButton(commitButtonId)
        {
            var visibleCommitButton = jQuery("#" + commitButtonId);
            if (visibleCommitButton)
                visibleCommitButton.prop('disabled', true);
        }
    
        // Performs a quiet, client-side validation, and returns whether it was successful or not.
        function <%=ClientID%>_IsPageValid()
        {
            // Check the Page_ClientValidate function is available.
            // If it isn't it means there are no validators on the page.
            if (typeof Page_ClientValidate != "function" )
                return true;
        
            var pageValidationSucceeded = Page_ClientValidate();
            // Reset the variable that stops the next postback being processed.
            Page_BlockSubmit = false;
            return pageValidationSucceeded;
        }

        // Contains the logic to not allow multiple submits 
        // (e.g. duplicate donations due to clicking the submit button more than once).
        function <%=ClientID%>_DisableMultipleCommits(shouldValidate) 
        {
            // If validation is requested, and it fails, then just return.
            if (shouldValidate)
                if (!<%=ClientID%>_IsPageValid())
                return;

        var nonCartCommitButtonId = "<%=((Asi.Web.UI.MasterPageBase)Page.Master).ButtonBar.GetButton(Asi.Web.UI.CommandButtonType.Save).ClientID%>";
        var orderPurposeIsCart = <%=(OrderPurpose == SubmitOrderButtonLinkCommon.PurposeCart).ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        var commitButtonId = orderPurposeIsCart ? "<%=SubmitButton.ClientID%>" : nonCartCommitButtonId;
        var commitButton = jQuery("#" + commitButtonId);
        if (commitButton) 
            <%=ClientID%>_DisableCommitButton(orderPurposeIsCart ? "<%=ClientID%>_SubmitCartOrderButton" : nonCartCommitButtonId);
    }
    
    jQuery(document).ready(function() {
        var disableSubmitButtonFlagObj = jQuery('#<%=DisableSubmitOnLoad.ClientID %>');
        if (disableSubmitButtonFlagObj != null && disableSubmitButtonFlagObj.length>0) {
            var disableSubmitButtonValue = disableSubmitButtonFlagObj.val();
            if (disableSubmitButtonValue.toLowerCase() === "true") {
                <%=ClientID%>_DisableMultipleCommits(false);
            }
        }
    });

    //]]>
    </script>
    <input type="hidden" runat="server" ID="DisableSubmitOnLoad" value=""/>

</asp:Panel>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <script type="text/javascript">
    //<![CDATA[
    // Call to submit the order
    // Client side validators for other iParts that affect cart submission are fired first
    function <%= this.ClientID %>_SubmitOrder() {
        
        // Run all the relevant client side validators which affect whether we can submit the order.
        // It doesn't matter if the named validation groups aren't on the page, in that instance true is returned.
        var f = true;
        // Check the Page_ClientValidate function is available.
        // If it isn't it means there are no validators on the page.
        if (typeof Page_ClientValidate == "function" )
        {
            f = f && Page_ClientValidate("Asi.Web.iParts.PaymentCreator.PaymentCreatorDisplay");

            // Reset the variable that stops the next postback being processed.
            // If the validators fail, Page_BlockSubmit is set to true to cancel the action that caused the validators to fire.
            // We are firing the validators programatically, and handling the result
            // with code so we DON'T want the next event to be ignored.
            // If we left Page_BlockSubmit==true, the next button, dropdown etc we clicked on wouldn't do anything.
            Page_BlockSubmit = false;
        }
        
        // if all the validations passed, click the hidden submit button
        if (f)
        {
            <%=ClientID%>_DisableMultipleCommits(false);
            var b = $get("<%=SubmitButton.ClientID%>");
            if (b) b.click();
        }        
    }
    //]]>
    </script>
    
    <asp:Label CssClass="FloatRight Error" ID="CartWarningLabel" runat="server" Visible="false" Text="Your cart contains possible errors. Do you want to proceed anyway?" translate="yes"></asp:Label>     
    <div class="PanelField FloatRight">
        <div class="FloatRight" runat="server">
            <%-- ToggleButton allows client click events --%>           
            <asiweb:ToggleButton runat="server" ID="SubmitCartOrderButton" CssClass="TextButton PrimaryButton" />
        </div>
        <div style="clear: both;"></div>
        <div runat="server" id="LogOnMessageDiv" visible="false" class="Right" translate="yes">
            <asp:Label runat="server" ID="LogOnMessageLabel" Text="You must " />
            <asp:HyperLink runat="server" ID="LogOnLink" Text="sign in" />
            <asp:Label runat="server" ID="LogOnMessageLabel2" Text=" or " />
            <asp:HyperLink runat="server" ID="CreateAccountLink" Text="create an account"  />
            <asp:Label runat="server" ID="LogOnMessageLabel3" Text=" to submit your order." />
        </div>
    </div>   
    <div class="DisplayNone">
        <%-- Hidden button that gets called from javascript --%>     
        <asiweb:StyledButton runat="server" ID="SubmitButton" OnClick="SubmitButton_Click" CssClass="PrimaryButton" CausesValidation="False"/>
    </div>
    <div style="clear: both;"></div>
</asp:Panel>
