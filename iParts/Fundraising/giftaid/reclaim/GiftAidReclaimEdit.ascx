<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GiftAidReclaimEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidReclaim.GiftAidReclaimEdit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>
<!--We get scroll bars if i dont place inside a table-->

<div>

<asiweb:PanelTemplateControl ID="PanelTemplateControl1" Text="" runat="server" FieldSet="true"
ShowHeader="false" BorderStyle="None" Collapsible="false" >
            <asiweb:SmartControl ID="scHMRCRef" runat="server" DisplayCaption="true" BoundPropertyName="HmrcReference" ></asiweb:SmartControl>
            <asiweb:SmartControl ID="Ex1Input" runat="server" DisplayCaption="true" BoundPropertyName="BatchSize" MinValue="10"  MaxValue="25000"></asiweb:SmartControl>
            <asiweb:SmartControl ID="Ex2Input" runat="server" DisplayCaption="true" BoundPropertyName="GiftAidTaxRate" MinValue="1" MaxValue="50"></asiweb:SmartControl>
            <asiweb:SmartControl ID="SmartControl1"   runat="server" DisplayCaption="true" BoundPropertyName="TimeOut" MinValue="1" MaxValue="3600"></asiweb:SmartControl>
</asiweb:PanelTemplateControl>
    <div style="clear:both">

        <h3>Inclusions</h3>
        <div class="section" style="width: 90%;">
            <p>
                The selections below determine which transactions are included or excluded from Gift Aid tax reclaims. Items on the left are excluded. Items on the right are included
            </p>
        </div>
        <div class="section">
            <h4>Appeal Types:</h4>
            <div><asp:Label ID="lblErrorAppeal" runat="server" CssClass="error" ></asp:Label> </div>  
            
            <telerik:RadListBox ID="rlbAppealAva" runat="server" AllowTransfer="true" 
                TransferToID="rlbAppealSel" Height="200px" Width="280px"  
                AllowTransferDuplicates="false" EnableDragAndDrop="True">
            </telerik:RadListBox>
            <telerik:RadListBox ID="rlbAppealSel" runat="server"  AllowTransferDuplicates="false"
              Height="200px" Width="280px"  EnableDragAndDrop="True">
            </telerik:RadListBox>                    
        </div>
        <div class="section">
            <h4>Cash Accounts:</h4>
            <div><asp:Label ID="lblErrorAccount" runat="server" CssClass="error" ></asp:Label></div>
            
            <telerik:RadListBox ID="rlbCashAccountsAva" runat="server" AllowTransfer="true" 
                TransferToID="rlbCashAccountsSel" Height="200px" Width="280px"  AllowTransferDuplicates="false" EnableDragAndDrop="True">
            </telerik:RadListBox>
            <telerik:RadListBox ID="rlbCashAccountsSel" runat="server"  AllowTransferDuplicates="false"
              Height="200px" Width="280px"  EnableDragAndDrop="True">
            </telerik:RadListBox>     
        </div>
        <div class="section">
            <h4>Categories:</h4>
             <div><asp:Label ID="lblErrorCat" runat="server" CssClass="error" ></asp:Label></div>

            <telerik:RadListBox ID="rlbCategoriesAva" runat="server" AllowTransfer="true" 
                TransferToID="rlbCategoriesSel" Height="200px" Width="280px"  AllowTransferDuplicates="false" EnableDragAndDrop="True">
            </telerik:RadListBox>
            <telerik:RadListBox ID="rlbCategoriesSel" runat="server"  AllowTransferDuplicates="false"
              Height="200px" Width="280px"  EnableDragAndDrop="True">
            </telerik:RadListBox>    
            
        </div>                
        <div class="section">
            <h4>Customer Types:</h4>
            <div><asp:Label ID="lblErrorCust" runat="server" CssClass="error" ></asp:Label></div>
            
            <telerik:RadListBox ID="rlbCustomerTypesAva" runat="server" AllowTransfer="true" 
                TransferToID="rlbCustomerTypesSel" Height="200px" Width="280px"  AllowTransferDuplicates="false" EnableDragAndDrop="True">
            </telerik:RadListBox>
            <telerik:RadListBox ID="rlbCustomerTypesSel" runat="server"  AllowTransferDuplicates="false"
              Height="200px" Width="280px"  EnableDragAndDrop="True">
            </telerik:RadListBox>     
        </div>
        
        <div class="section">
            <asp:Label style="text-align:left;font-size:x-small;width:100%" ID="lblGiftAidVersion" runat="server" CssClass="label" Text="Gift Aid Version "></asp:Label>
        </div>
    </div>
</div>

<style type="text/css">
    div.row
    {
        clear: both;
        padding-top: 0.25em;
        width: 100%;
    }
    div.rowRight
    {
        clear: both;
        padding-top: 0.25em;
        width: 100%;
        text-align: right;
    }
    div.row span.label
    {
        float: left;
        width: 13em;
        text-align: right;
        padding-right: 3px;
    }
    span.instructions
    {
        font-style: italic;
        font-size: 90%;
        color: #585858;
    }
    span.warning
    {
        font-weight: bold;
        color: #B20000;
    }
    span.error
    {
        font-weight: bold;
        color: Red;
    }
</style>
