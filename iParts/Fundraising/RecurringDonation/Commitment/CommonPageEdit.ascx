<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonPageEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.CommonPageEdit" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asiweb:PanelTemplateControl ID="PropertiesPanel" runat="server" Collapsible="false" FieldSet="true" ShowHeader="false" Width="99%" BorderStyle="None">
       
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" /> 

    
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="20em"  Width="66em">
        <fieldset>
                  <div>
                   <h4><asp:Literal ID="litDonFreqHeader" runat="server"></asp:Literal></h4>                    
                    <asp:Literal ID="donFreqHeaderInsLiteral" Text="Items on the left are the available options. Items on the right are displayed in the iPart."
                     runat="server"></asp:Literal>                    
                </div>
            <div >

                <div><asp:Label ID="errorFrequencyLabel" runat="server" CssClass="Error" ></asp:Label> </div>  
                
                <telerik:RadListBox ID="availableFrequenciesListBox" runat="server" AllowTransfer="true" 
                    TransferToID="selectedFrequenciesListBox" Height="200px" Width="280px"  
                    AllowTransferDuplicates="false" EnableDragAndDrop="True"
                    OnTransferred="AvailableFrequenciesListBox_Transferred"
                    AutoPostBackOnTransfer="true" CausesValidation="false">                                  
                </telerik:RadListBox>
                <telerik:RadListBox ID="selectedFrequenciesListBox" runat="server"  AllowTransferDuplicates="false"
                  Height="200px" Width="280px"  EnableDragAndDrop="True">
                </telerik:RadListBox>                    
            </div>             

             <div  class="PanelField Left">              
                    <asp:Label ID="defaultFrequencyLabel" runat="server"  AssociatedControlID="defaultFrequencyDropDown" CssClass="Required"></asp:Label>
                     
                <div class="PanelFieldValue"> 
                    <asp:DropDownList ID="defaultFrequencyDropDown" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="defaultFrequencyRequiredFieldValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="defaultFrequencyDropDown" ></asp:RequiredFieldValidator>
                </div>
            </div>
             </fieldset>
             <br />
                <fieldset>
 

             <div  class="PanelField Left">
                    <asp:Label ID="defaultPaymentMethodLabel" runat="server"  AssociatedControlID="defaultPaymentMethodDropDown" CssClass="Required" ></asp:Label>
                <div class="PanelFieldValue"> 
                    <asp:DropDownList ID="defaultPaymentMethodDropDown" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="defaultPaymentMethodRequiredFieldValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="defaultPaymentMethodDropDown" ></asp:RequiredFieldValidator>
                </div>
             </div>
              
        </fieldset>
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl>