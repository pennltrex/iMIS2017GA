<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PromotionEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.PromotionCreator.PromotionEdit1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Import Namespace="Asi" %>
<asiweb:PanelTemplateControl ID="PromotionEditMain" runat="server" FieldSet="true"
    ShowHeader="false" BorderStyle="None">
    
    <asiweb:BusinessLabel ID="errorText" runat="server" CssClass="Error" Visible="false" />
            
    <div class="PanelField Left">
        <div>
            <asiweb:StyledLabel runat="server" ID="LabelPromotionName" AssociatedControlID="PromotionName" CssClass="Required" />
       </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox DisplayCaption="false" runat="server" ID="PromotionName" RenderPanelField="false" OnTextChanged="PromotionCode_OnTextChanged" />
            <asiweb:AsiRequiredFieldValidator ID="PromotionNameValidator" runat="server" ControlToValidate="PromotionName" Display="Dynamic" />
        </div>
    </div>
                
    <div class="PanelField Left">
        <div>
            <asiweb:StyledLabel runat="server" ID="LabelPromotionCode" AssociatedControlID="PromotionCode" CssClass="Required" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox DisplayCaption="false" runat="server" ID="PromotionCode" RenderPanelField="false" OnTextChanged="PromotionCode_OnTextChanged" />
            <asiweb:AsiRequiredFieldValidator ID="PromotionCodeValidator" runat="server" ControlToValidate="PromotionCode" Display="Dynamic" />
        </div>
    </div>
                
    <div class="PanelField Left">
        <div>
            <asiweb:StyledLabel runat="server" ID="LabelDiscountBeginDate" AssociatedControlID="DiscountBeginDate" RenderPanelField="False" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessCalendar2 runat="server" ID="DiscountBeginDate" UseSqlDateTimeMinValue="true" DisplayCaption="false"  RenderPanelField="False" />
            <asiweb:StyledLabel runat="server" ID="LabelDiscountEndDate" RenderPanelField="False" DisplayCaption="False"  />
            <asiweb:BusinessCalendar2 runat="server" DisplayCaption="false" UseSqlDateTimeMinValue="true" ID="DiscountEndDate" RenderPanelField="False" />
            <asp:CustomValidator runat="server" ID="CustomValidatorDate" Display="Dynamic" SetFocusOnError="true"  />
        </div>
    </div>
                    
    <asiweb:BusinessDropDownList DisplayCaption="True" runat="server" ID="PromotionType" RenderPanelField="True" AutoPostBack="true" OnSelectedIndexChanged="PromotionType_OnSelectedIndexChanged"/>
    <div runat="server" id="DivPromoAmount">
        <div class="PanelField Left">
            <div>
                <asiweb:StyledLabel runat="server" ID="LabelPromotionDiscountPercent" AssociatedControlID="PromotionDiscountPercent" CssClass="Required" />
            </div>
            <div class="PanelFieldValue">
                <telerik:RadNumericTextBox runat="server" ID="PromotionDiscountPercent"  NumberFormat="Decimal" EnabledStyle-HorizontalAlign="Right" CausesValidation="true" EnableViewState="true" >
                    <numberformat decimaldigits="2" groupseparator="" />
                </telerik:RadNumericTextBox>
                <asiweb:AsiRequiredFieldValidator runat="server" ID="DiscountPercentRequired" ControlToValidate="PromotionDiscountPercent"
                    Display="Dynamic" />
                <asp:RangeValidator runat="server" CultureInvariantValues="True" ID="PromotionDiscountPercentRangeValidator" Type="Double" MinimumValue="0.0"
                                    MaximumValue="100.0" ControlToValidate="PromotionDiscountPercent" ErrorMessage="Please enter a number between 0 and 100." />
            </div>
        </div>
    </div>
    
    <div style="clear: both;"></div>
    <br/>

    <div runat="server" id="DivPromoDetailList" >
            <asiweb:PanelTemplateControl ID="ItemPromotionDetailsPanel" runat="server" Collapsible="false"
                FieldSet="true" ShowHeader="true" BorderStyle="None">
                <asiweb:StyledLabel runat="server" ID="ItemPromotionDetailsLabel" AssociatedControlID="ItemPromotionDetailsGrid">
                </asiweb:StyledLabel>
                <asiweb:BusinessDataGrid2 ID="ItemPromotionDetailsGrid" runat="server" Visible="true" EnableViewstate="true" AutoPostBack="true" AllowPaging="true"
                    PageSize="30" ShowHeader="true"  OnItemDataBound="ItemPromotionDetailsGrid_OnItemDataBound" 
                    OnPreRender="ItemPromotionDetailsGrid_OnPreRender" OnItemCommand="ItemPromotionDetailsGrid_ItemCommand">
                    <clientsettings allowkeyboardnavigation="True" />
                    <mastertableview autogeneratecolumns="false" commanditemsettings-refreshtext="refreshtext"
                        showheader="true" commanditemsettings-showaddnewrecordbutton="true" commanditemdisplay="Top"
                        allowsorting="True" nomasterrecordstext='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.PromotionCreator.NoItemPromotionDetails", "There are no promotion details.") %>'>
                <SortExpressions>
                </SortExpressions>
                <CommandItemStyle HorizontalAlign="right" />
                <CommandItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server">
                        <asp:ImageButton ID="AddItemLink" runat="server" CommandName="AddItem" CausesValidation="false" SkinID="PanelCommandButtonAdd" />
                    </asp:LinkButton>                            
                </CommandItemTemplate>
                <Columns >
                    <telerik:GridTemplateColumn
                    HeaderText="Name"
                    UniqueName="NameColumn">
                        <ItemTemplate>
                            <asiweb:BusinessLabel ID="NameLabel" runat="server" AutoPostBack="true" />
                        </ItemTemplate> 
                    </telerik:GridTemplateColumn> 
                    <telerik:GridTemplateColumn
                    HeaderText="Discount Type"
                    UniqueName="DiscountTypeColumn">
                        <ItemTemplate>
                            <asiweb:BusinessDropdownList ID="DiscountTypeDropDownList" runat="server" OnSelectedIndexChanged="DiscountType_Changed"  AutoPostBack="true" />
                        </ItemTemplate> 
                    </telerik:GridTemplateColumn>  
                    <telerik:GridTemplateColumn
                    HeaderText="Discount Amount"
                    UniqueName="AmountColumn"   >
                        <ItemStyle Width="300px" ></ItemStyle>
                        <ItemTemplate>
<%--                            AutoPostBack was removed for AmountTextBox since it was causing the save and close to refresh if not tabbed out--%>
                            <asiweb:BusinessTextBox ID="AmountTextBox" RenderPanelField="true" Caption="" runat="server" OnTextChanged="Amount_Changed" />                                         
                            <asiweb:AsiRequiredFieldValidator runat="server" ID="AmountTextBoxRequired" ControlToValidate="AmountTextBox"
                                            CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                            <asp:RangeValidator   runat="server" ID="AmountTextBoxRangeValidator" ControlToValidate="AmountTextBox"  Type="Currency" Display="Dynamic"   MinimumValue="0" 
                                                CssClass="Important" ></asp:RangeValidator>
                        </ItemTemplate> 
                    </telerik:GridTemplateColumn>                                                                              
                    <telerik:GridTemplateColumn UniqueName="RemoveColumn">
                        <ItemTemplate>
                            <asp:ImageButton ID="RemoveImageButton" SkinID="PanelCommandButtonDelete" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval( Container.DataItem, ( Container.DataItem.GetType() == typeof(Asi.Soa.Commerce.DataContracts.ItemPromotionDetailData)) ? "Item.ItemId" : ( Container.DataItem.GetType() == typeof(Asi.Soa.Commerce.DataContracts.ItemClassPromotionDetailData)) ? "ItemClass.ItemClassId" : "" , "{0}"  )%>'/>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>                              
                </Columns>
            </mastertableview>
                </asiweb:BusinessDataGrid2>
                <div style="clear: both;">
                </div>
                <asiweb:StyledLabel runat="server" ID="GridErrorMessage" Visible="false" CssClass="Error">
                </asiweb:StyledLabel>
                <asiweb:BusinessTextBox ID="HiddenProductGuidTextBox" runat="server" Style="display: none" />
                <asp:Button ID="HiddenButton" runat="server" OnClick="HiddenButton_OnClick" CausesValidation="false"
                    Style="display: none" />
            </asiweb:PanelTemplateControl>
    </div>

</asiweb:PanelTemplateControl>
