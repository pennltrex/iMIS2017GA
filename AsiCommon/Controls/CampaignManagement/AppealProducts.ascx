<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_AppealProducts" Codebehind="AppealProducts.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="SelectedProductsPanel" runat="server" TemplateTitle="Selected Products" Collapsible="false"  translate="yes">

    <asp:Label runat="server" ID="NoProductsSelected" CssClass="GeneralMessage" Visible="false" Height="10px" />

    <asp:Repeater runat="server" ID="SelectedProductsRepeater" DataSource="<%#Appeal.GetAppealProducts(true)%>">
        <HeaderTemplate>
            <table class="Grid">
                <tr class="GridHeader">
                    <th><asiweb:StyledLabel runat="server" ID="TitleLabel" Text="Title" /></th>
                    <th><asiweb:StyledLabel runat="server" ID="CodeLabel" Text=" Code" /></th>
                    <th><asiweb:StyledLabel runat="server" ID="TypeLable" Text="Type" /></th>
                    <th>&nbsp;</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="GridRow" id='<%#Eval("AppealProductKey")%>Row' onmouseover="this.oldClassName=this.className;this.className='GridRowHover';" onmouseout="this.className=this.oldClassName;">
               <td><%#((Asi.Business.CampaignManagement.AppealProduct)Container.DataItem).CsProduct["Title"]%></td>
               <td><%#((Asi.Business.CampaignManagement.AppealProduct)Container.DataItem).CsProduct["ProductCode"]%></td>
               <td><%#((Asi.Business.CampaignManagement.AppealProduct)Container.DataItem).CsProduct["ProductType"]%></td>
               <td><asp:LinkButton ID="ProductRemoveButton" runat="server" CommandName="Remove" Text="remove" ToolTip="Remove this item" CommandArgument='<%#Eval("AppealProductKey")%>' /></td> 
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="GridAlternateRow" id='<%#Eval("AppealProductKey")%>Row' onmouseover="this.oldClassName=this.className;this.className='GridAlternateRowHover';" onmouseout="this.className=this.oldClassName;">
               <td><%#((Asi.Business.CampaignManagement.AppealProduct)Container.DataItem).CsProduct["Title"]%></td>
               <td><%#((Asi.Business.CampaignManagement.AppealProduct)Container.DataItem).CsProduct["ProductCode"]%></td>
               <td><%#((Asi.Business.CampaignManagement.AppealProduct)Container.DataItem).CsProduct["ProductType"]%></td>
               <td><asp:LinkButton ID="ProductRemoveButton" runat="server" CommandName="Remove" Text="remove" ToolTip="Remove this item" CommandArgument='<%#Eval("AppealProductKey")%>' /></td> 
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    
</asiweb:PanelTemplateControl2>

<asiweb:PanelTemplateControl2 ID="AvailableProductsPanel" runat="server" TemplateTitle="Available Products" Collapsible="false">
    
    <asiweb:Lister2 
        ID="AvailibleProductsGrid" 
        runat="server"
        AjaxEnabled="true"
        DisableQueryEdit="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/ProductList"
        OnPreEvaluateQuery="AvailibleProductsGrid_PreEvaluateQuery"
        DeleteEnabled="False" 
        SelectColumnLocation="Beginning"
        EditColumnLocation="None" 
        SelectColumnButtonType="Link" 
        SelectColumnText="select"
        LinkTargetBehavior="RaiseEvent"                   
        translate="yes"
         />
              
</asiweb:PanelTemplateControl2>
