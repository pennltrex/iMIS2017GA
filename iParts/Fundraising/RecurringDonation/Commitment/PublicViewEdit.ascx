<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublicViewEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.PublicViewEdit" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">

.StandardPanel FIELDSET DIV.PanelField LABEL
{
	min-width: 20em;
}

</style>
<asiweb:PanelTemplateControl ID="PropertiesPanel" runat="server" Collapsible="false" FieldSet="true" BorderStyle="None" ShowHeader="false"  LabelWidth="20em"  Width="66em">
<asp:placeholder ID="phControls" Runat="server"></asp:placeholder>
    <br />
          <fieldset>
             <div class="PanelField Left" >
                <asp:Label ID="distributionLabel" runat="server" Text="distributionLabel" AssociatedControlID="distributionDropDown" CssClass="Required" Width="20em"  ></asp:Label>        
                <asiweb:BusinessDropDownList Width="180px" id="distributionDropDown" CausesValidation="true" Required="true" runat="server" AutoPostBack="true" />
                <asp:RequiredFieldValidator class="Important" ID="distributionRequiredFieldValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="distributionDropDown" ErrorMessage="Required" ></asp:RequiredFieldValidator>
                <asp:CustomValidator class="Important" ID="distributionCustomFieldValidator" OnServerValidate="DistributionFundValidate" Display="Dynamic" runat="server" ControlToValidate="distributionDropDown" ErrorMessage="Select a Distribution linked to a Fund" />
            </div>
          </fieldset>
          <fieldset style="height:10em">
          <br />
            <asiweb:SmartControl TextBoxWidth="20em" ID="ThankYouPage" runat="server" BoundPropertyName="ThankYouPage" DisplayCaption="true" EnableClientScript="false"  />
            <asiweb:SmartControl  ID="SaveButtonText" runat="server" BoundPropertyName="SaveButtonText" DisplayCaption="true"  />
       </fieldset>
</asiweb:PanelTemplateControl>