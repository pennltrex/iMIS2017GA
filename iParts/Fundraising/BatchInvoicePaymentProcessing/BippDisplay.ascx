<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BippDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.BatchInvoicePaymentProcessing.BippDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
     
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="ListerPanel">
        <ProgressTemplate >
            <div class="NotPrinted " runat="server" >
                <asp:Label runat="server" translate="yes" Text='<%# ResourceManager.GetWord("Loading")%> '/> 
                <asp:Image ID="ProgressImage" runat="server" OnLoad="ProgressImageLoad" AlternateText='<%# ResourceManager.GetWord("Loading")%>' />
            </div>  
        </ProgressTemplate>
    </asp:UpdateProgress>            
       
    <asp:UpdatePanel ID="ListerPanel" runat="server" translate="yes">
        <ContentTemplate>

            <asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>           
            <asiweb:Lister2 ID="ResultsGrid" runat="server" AjaxEnabled="false" SortingEnabled="true"
                PagingEnabled="true" ColumnReorderingEnabled="false" EnableClientSideDelete="false"
                EditColumnLocation="None" SelectColumnLocation="None" DeleteColumnLocation="None"
                AddButtonEnabled="false" DisableQueryEdit="true" OnNeedDataSource="ResultsGrid_NeedDataSource"
                CollapsiblePanelTemplate="false" ExportButtonLocation="TopRight" />                
            
            <asiweb:StyledButton runat="server" ID="ButtonProcessPayments" CssClass="PrimaryButton" OnClick="ButtonProcessPaymentsClick" Text="<%# FormattedButtonText %>" Visible="false" AutoPostBack="True" /> <br />
            <asp:LinkButton runat="server" ID="NextScreenHyperlink" Visible="False" OnClick="LinkButtonClicked"><%# ClickMeText %></asp:LinkButton>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Panel>