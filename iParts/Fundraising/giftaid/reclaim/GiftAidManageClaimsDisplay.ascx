<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GiftAidManageClaimsDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidReclaim.GiftAidManageClaimsDisplay" EnableViewState="true" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>


<%--
    <%@ Register src="../../../AsiCommon/Controls/Shared/DateRangeSelector/DateRangeSelector.ascx" tagname="DateRangeSelector" tagprefix="uc1" %>
--%>
 
   <div class="PanelField Left"  >     
   <div >
       <asp:RequiredFieldValidator ID="rfvReference" runat="server" ErrorMessage="*" ValidationGroup="GAReclaim" style="float:left;" ControlToValidate="tbReference"  ></asp:RequiredFieldValidator>            
        <asp:Label style="width:20%" runat="server" CssClass="label" AssociatedControlID="tbReference">Tax Reclaim Reference</asp:Label>           
    </div>      
    <div class="PanelFieldValue">
        <asp:TextBox style="width:7em;min-width:7em"  ID="tbReference" runat="server" Columns="6" MaxLength="50"></asp:TextBox>
<%--        <span class="HelpHintLabel">Year/Month, e.g. 2009/09</span>  --%>
<%--        <cc1:MaskedEditExtender ID="meeReference" runat="server" TargetControlID="tbReference" Mask="9999\/99" ClearMaskOnLostFocus="false"   ></cc1:MaskedEditExtender> --%>
   </div>
   </div>
           
   <div class="PanelField Left"  >     
   <div style="display:inline">
        <asp:RequiredFieldValidator ID="rfvPaidFrom" runat="server" ErrorMessage="*" ValidationGroup="GAReclaim" style="float:left;" ControlToValidate="tbReference"  ></asp:RequiredFieldValidator>  
        <asp:Label style="width:20%" runat="server" CssClass="label" AssociatedControlID="bcPaidFrom">From</asp:Label>            
    </div>      
    <div class="PanelFieldValue">
        <asiweb:BusinessCalendar ID="bcPaidFrom" runat="server" />
   </div>
   </div>
               
   <div class="PanelField Left"  >     
   <div style="display:inline">
        <asp:RequiredFieldValidator ID="rfvPaidTo" runat="server" ErrorMessage="*" ValidationGroup="GAReclaim" style="float:left;" ControlToValidate="tbReference" ></asp:RequiredFieldValidator> 
        <asp:Label style="width:20%" runat="server" CssClass="label" AssociatedControlID="bcPaidTo">To</asp:Label>
    </div>      
    <div class="PanelFieldValue">
        <asiweb:BusinessCalendar ID="bcPaidTo" runat="server"  />
   </div>
   </div>    
    
   <div class="PanelField Left"  >     
   <div style="display:inline">
        <asp:RequiredFieldValidator ID="rfvGiftAidTaxRate" runat="server" 
            ErrorMessage="*" ControlToValidate="tbGiftAidTaxRate" 
            ValidationGroup="GAReclaim" style="float:left;" ></asp:RequiredFieldValidator>
        <asp:Label style="width:20%"  runat="server" CssClass="label" AssociatedControlID="bcPaidTo">Tax Rate</asp:Label>
    </div>      
    <div class="PanelFieldValue">
    <asp:TextBox ID="tbGiftAidTaxRate" style="width:7em;min-width:7em;text-align: right;" runat="server" Columns="4" MaxLength="4" Width="7em"></asp:TextBox><span>%</span>
    <asp:RangeValidator ID="rvGiftAidTaxRate" runat="server" ControlToValidate="tbGiftAidTaxRate" 
        Display="Dynamic" ErrorMessage="Tax rate is invalid" MaximumValue="100" 
        MinimumValue="1" Type="Double" ValidationGroup="GAReclaim"></asp:RangeValidator>
   </div>
   </div>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <div class="row">
        <span class="GiftAidLabelPlaceholder" >&nbsp;</span>
        <asp:CheckBox ID="cboxWarning" runat="server"  CssClass="error" Visible="false"  />
    </div> 
    <div class="row">
        <span class="GiftAidLabelPlaceholder" >&nbsp;</span>        
        <asp:Button ID="btnGenerate" runat="server" style="float:left;" Text="Generate Claim" SkinID="Button" onclick="btnGenerate_Click" ValidationGroup="GAReclaim" Width="9em"></asp:Button>  
        <span class="HelpHint" style="float:left; padding-left:0.5em;"></span>
    </div>
    <div class="row">
        <span class="GiftAidLabelPlaceholder" >&nbsp;</span>
        <asp:Label ID="lblError" runat="server" CssClass="error" />
    </div>                   

<div class="row">
    <h3 style="text-align:left;margin-left:4px">Review Claim</h3>
</div>  

        <p>
            <asp:Label ID="lblStatus" runat="server" CssClass="HelpHintLabel"></asp:Label>
        </p>
                    
        <asp:Label ID="lblAttemptsRemaining" runat="server" CssClass="HelpHintLabel"></asp:Label>
        <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="500" Enabled="false"></asp:Timer>

        <rad:RadGrid ID="rgPrevious" runat="server" AllowPaging="True" 
            BorderColor="#8D8F8E" BorderWidth="1px" GridLines="None" 
            OnItemDataBound="rgPrevious_ItemDataBound" 
            OnDeleteCommand="rgPrevious_DeleteCommand" 
            onpageindexchanged="rgPrevious_PageIndexChanged" 
            onitemcommand="rgPrevious_ItemCommand"
            onprerender="rgPrevious_PreRender" >
            <ClientSettings>
                <Selecting AllowRowSelect="False" />
            </ClientSettings>
            <PagerStyle Mode="NextPrevAndNumeric"  />
            <MasterTableView DataKeyNames="GiftAidClaimHeaderKey" AutoGenerateColumns="false">
                <RowIndicatorColumn Visible="False">
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn Resizable="False" Visible="False">
                    <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                    <rad:GridButtonColumn Text="Review" CommandName="Review">
                    </rad:GridButtonColumn>
                    <rad:GridButtonColumn Text="Delete" CommandName="Delete">
                    </rad:GridButtonColumn>
                    <rad:GridBoundColumn DataField="GiftAidStatus" HeaderText="Status">
                    </rad:GridBoundColumn>                    
                    <rad:GridBoundColumn DataField="Reference" HeaderText="Reference">
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn DataField="ClaimFromDate" HeaderText="Paid From" DataFormatString="{0:d}">
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn DataField="ClaimToDate" HeaderText="Paid To" DataFormatString="{0:d}">
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn DataField="GiftAidTaxRate" HeaderText="Tax Rate %"  >
                    </rad:GridBoundColumn>                                                                             
                    <rad:GridBoundColumn DataField="CreatedOn" HeaderText="Created">
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn DataField="UpdatedOn" HeaderText="Updated">
                    </rad:GridBoundColumn>
                    <rad:GridBoundColumn DataField="NumberOfTransactions" HeaderText="No of Transactions">
                    </rad:GridBoundColumn>

                </Columns>
            </MasterTableView>
        </rad:RadGrid>

    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers>
</asp:UpdatePanel>

