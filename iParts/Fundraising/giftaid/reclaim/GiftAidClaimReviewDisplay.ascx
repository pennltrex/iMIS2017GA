<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GiftAidClaimReviewDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidReclaim.GiftAidClaimReviewDisplay" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>
<div class="rowRight">
    <asp:LinkButton ID="btnBack" runat="server" onclick="btnBack_Click">Return to Claim List</asp:LinkButton>
</div>

 <h3>Claim Details</h3>
  <br />
    <asp:Label ID="errorLabel" CssClass="Error" runat="server" />
    
       <div class="PanelField Left"  >     
       <div>
                <asp:Label ID="referenceLabelControl" class="label" runat="server" Text="Reference" AssociatedControlID="lblReference"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:Label ID="lblReference" runat="server" CssClass="PanelFieldValue"></asp:Label>
       </div>
       </div>
       
       <div class="PanelField Left"  >     
       <div>
                <asp:Label ID="fromLabelControl" class="label" runat="server" Text="From" AssociatedControlID="lblFrom"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:Label ID="lblFrom" runat="server" CssClass="PanelFieldValue"></asp:Label>
       </div>
       </div>

       <div class="PanelField Left"  >     
       <div>
                <asp:Label ID="toLabelControl" class="label" runat="server" Text="To" AssociatedControlID="lblTo"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:Label ID="lblTo" runat="server" CssClass="PanelFieldValue"></asp:Label>
       </div>
       </div>

       <div class="PanelField Left"  >     
       <div>
                <asp:Label ID="taxRateLabelControl" class="label" runat="server" Text="Tax Rate" AssociatedControlID="lblTaxRate"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:Label ID="lblTaxRate" runat="server" CssClass="PanelFieldValue"></asp:Label>
       </div>
       </div>

       <div class="PanelField Left"  >     
       <div style="display:inline">
                <asp:Label ID="statusLabelControl" class="label" runat="server" Text="Status" AssociatedControlID="lblStatus"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:Label ID="lblStatus" runat="server" CssClass="PanelFieldValue"></asp:Label>
       </div>
       </div>
                            
       <div class="PanelField Left"  >     
       <div style="display:inline">
                <asp:Label ID="createdLabelControl" class="label" runat="server" Text="Created" AssociatedControlID="lblCreated"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:Label ID="lblCreated" runat="server" CssClass="PanelFieldValue"></asp:Label>
       </div>
       </div>


        <div class="PanelField Left"  >     
       <div style="display:inline">
                <asp:Label ID="updatedLabelControl" class="label" runat="server" Text="Updated" AssociatedControlID="lblUpdated"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:Label ID="lblUpdated" runat="server" CssClass="PanelFieldValue"></asp:Label>
       </div>
       </div>

<%-- for some reason the "top" is under the previous heading so you need a large top set here --%>
<div style="padding-top:19em;">&nbsp;</div>
<h3>Transactions</h3>


<br />


       <div class="PanelField Left"  >     
       <div style="display:inline">
                <asp:Label class="label" runat="server" Text="Transaction ID" AssociatedControlID="tbTransID"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:TextBox ID="tbTransID" Width="10em" runat="server" MaxLength="10"></asp:TextBox>
       </div>
       </div>

       <div class="PanelField Left"  >     
       <div style="display:inline">
                <asp:Label class="label" runat="server" Text="Contact ID" AssociatedControlID="tbContactID"></asp:Label>
        </div>      
        <div class="PanelFieldValue">
                <asp:TextBox ID="tbContactID" Width="10em" runat="server" MaxLength="10"></asp:TextBox>
       </div>
       </div>
              

        <div class="PanelField Left" >  
        <div style="display:inline">
            <span class="GiftAidLabelPlaceholder" style="width:129px">&nbsp;</span>
        </div>
        <div class="PanelFieldValue">
            <asp:Button ID="btnFilter" Width="66px" runat="server" Text="Find" OnClick="btnFind_Click" />
            <asp:Button ID="btnClear" Width="66px" runat="server" Text="Clear" onclick="btnClear_Click" />
        </div>
        </div>
                
        <div class="PanelField Left" >
            <asp:CheckBox ID="cbHideExcluded" runat="server" Text="Hide Excluded Transactions" AutoPostBack="true" oncheckedchanged="cbHideExcluded_CheckedChanged"   />
        </div>

           
        <div class="PanelField Left" style="text-align: right;width:95%;" > 
        <div style="display:inline">
            <span class="GiftAidLabelPlaceholder" style="width:129px;">&nbsp;</span>
        </div>

        <div class="PanelField Left" style="text-align: left;width:95%;" >
            <%--<asp:Button ID="btnExport" SkinID="Button" runat="server" Text="Export CSV file" onclick="btnExport_Click" />--%>
            To export, run the following Query:<br/>
            RiSE > Intelligent Query Architect > $/Fundraising/DefaultSystem/Queries/GiftAid/GiftAidClaim - Export
 
        </div>        
       <div class="PanelField Left">
            <asp:Button ID="btnClaim" runat="server" Text="Mark as Claimed" SkinID="Button" onclick="btnClaim_Click" />
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server"
                TargetControlID="btnClaim" ConfirmText="You will no longer be able to modify this claim&#10; after the transactions are marked as claimed."
            /> 
        </div>
        </div>

<div style="clear:both"></div>

<rad:RadAjaxManager ID="RadAjaxManager1" runat="server" >
    <AjaxSettings>
        <rad:AjaxSetting AjaxControlID="btnFilter">
            <UpdatedControls>
               <rad:AjaxUpdatedControl ControlID="rgReview" />
            </UpdatedControls>
        </rad:AjaxSetting>
        <rad:AjaxSetting AjaxControlID="btnClear">
            <UpdatedControls>
               <rad:AjaxUpdatedControl ControlID="rgReview" />
            </UpdatedControls>        
        </rad:AjaxSetting>
        <rad:AjaxSetting AjaxControlID="cbHideExcluded">
            <UpdatedControls>
               <rad:AjaxUpdatedControl ControlID="rgReview" />
            </UpdatedControls>        
        </rad:AjaxSetting>
        <rad:AjaxSetting AjaxControlID="rgReview">
            <UpdatedControls>
               <rad:AjaxUpdatedControl ControlID="lblUpdated" />
            </UpdatedControls>            
        </rad:AjaxSetting>
        <rad:AjaxSetting AjaxControlID="rgReview">
            <UpdatedControls>
               <rad:AjaxUpdatedControl ControlID="btnClaim" />
            </UpdatedControls>            
        </rad:AjaxSetting>            
        <rad:AjaxSetting AjaxControlID="btnClaim">
            <UpdatedControls>
               <rad:AjaxUpdatedControl ControlID="lblStatus" />
            </UpdatedControls>                            
        </rad:AjaxSetting>
    </AjaxSettings>
</rad:RadAjaxManager>

<asiweb:PanelTemplateControl ID="ReclaimPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">

        <rad:RadGrid ID="rgReview" runat="server"  
            AllowPaging="true" BorderColor="#8D8F8E" BorderWidth="1px" 
            GridLines="None" 
            onneeddatasource="rgReview_NeedDataSource"            
            onitemdatabound="rgReview_ItemDataBound"
            EnableViewState="false"
            PageSize="15" 
            AutoGenerateColumns="False"
            ShowFooter="True" onprerender="rgReview_PreRender">
            <ClientSettings>
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <FooterStyle BackColor="#DDDDDD" />
                            
            <MasterTableView  >
                <RowIndicatorColumn Visible="False">
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn Resizable="False" Visible="False">
                    <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                    <rad:GridTemplateColumn UniqueName="CheckBoxTemplateColumn" DataField="IsIncludedInClaim" AllowFiltering="false">
                        <HeaderTemplate>
                        <span>In Claim</span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox id="cbInclude" OnCheckedChanged="ToggleRowSelection"  AutoPostBack="True" runat="server" Checked='<%# Eval("IsIncludedInClaim") %>' />
                        </ItemTemplate>
                    </rad:GridTemplateColumn>
                                            
                    <rad:GridBoundColumn UniqueName="TransactionId" DataField="TransactionId" HeaderText="Transaction Id" AllowFiltering="true">
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn DataField="ContactId" HeaderText="Contact Id" AllowFiltering="true"  >
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn DataField="GiftAidDeclarationKey" HeaderText="GAD Id" AllowFiltering="false" Visible="false">
                    </rad:GridBoundColumn>            
                    
                    <rad:GridBoundColumn UniqueName="TransactionPaidDate" DataField="TransactionPaidDate" HeaderText="Paid Date" DataFormatString="{0:d}" AllowFiltering="false">
                    </rad:GridBoundColumn> 
                    <rad:GridBoundColumn UniqueName="LabelName" DataField="LabelName" 
                        HeaderText="Tax Payer" AllowFiltering="False" >
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn UniqueName="DonationAmount" DataField="DonationAmount" HeaderText="Donation Amount" DataFormatString="{0:F}" AllowFiltering="false">
                        <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" />
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn UniqueName="TaxReclaimAmount" DataField="TaxReclaimAmount" HeaderText="Reclaim Amount" DataFormatString="{0:F}" AllowFiltering="false">
                        <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" />
                    </rad:GridBoundColumn>                
                    <rad:GridBoundColumn UniqueName="HmrcReference" DataField="HmrcReference" HeaderText="HMRC Reference"  AllowFiltering="false">
                    </rad:GridBoundColumn>                       
                    
               </Columns>

            </MasterTableView>
        </rad:RadGrid>    
 
</asiweb:PanelTemplateControl>








