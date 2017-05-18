<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Communications.FormDisplayDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<script type="text/javascript">
    Sys.Application.add_load(function () {
        if (jQuery('.PanelFieldValue :input').length) {
            var fields = jQuery('.PanelFieldValue :input');
            jQuery(fields).each(function (i) {
                if (jQuery(this).is('textarea')) {
                    jQuery(this).keydown(function (event) {
                        if (event.which == 13) {
                            event.stopPropagation();
                        }
                    });
                } else {
                    jQuery(this).keydown(function (event) {
                        if (event.which == 13) {
                            event.preventDefault();
                        }
                    });
                }
            });
        }
    });
</script>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <asp:PlaceHolder ID="FormDisplayPlaceholder" runat="server"></asp:PlaceHolder>
        <asiweb:StyledButton ID="SaveResponses" CssClass="PrimaryButton FloatRight" runat="server" OnClick="SaveResponseButtonClick" ValidationGroup="Asi.Web.iParts.Communications.FormFieldDisplay" />
        <asiweb:StyledLabel runat="server" ID="SaveMessageLabel" CssClass="FloatRight" />
        <asp:HiddenField runat="server" ID="SavedMessage" Value="" />
    </ContentTemplate>
</asp:UpdatePanel>



