<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventFunctionPricing.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventFunctionPricing" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="asi" TagName="ItemCreatorTaxInfo" Src="~/iParts/Commerce/ItemCreator/ItemCreatorTaxInfo.ascx" %>
<%-- IMPORTANT: The field id's set here are also used in the EventFunctionPricing.js. --%>
<%-- So be careful about changing them or the js file will stop working. --%>

<asp:UpdatePanel ID="EventFunctionPricingUpdatePanel" runat="server" EnableViewState="True" UpdateMode="Always">
<ContentTemplate> 
<asp:Button runat="server" id="RefreshTrigger" style="display:none" OnClick="RefreshTriggerClick" Text="text"></asp:Button>

<div class="PanelField Left Section" id="DivEventFinancialEntity" runat="server" Visible="False">
    <asiweb:StyledLabel ID="EventFinancialEntityLabel" runat="server" Text="Financial entity" />
    <div class="PanelFieldValue">
        <asiweb:BusinessDropDownList id="EventFinancialEntitySelect" runat="server" />
        <asiweb:BusinessLabel ID="CurrentEventFinancialEntityLabel" runat="server"></asiweb:BusinessLabel>        
    </div>
</div>

<div runat="server" id="DivPriceGrid">
    <asp:Panel ID="GuestRegOptionsPanel" runat="server" CssClass="Section ClearFix" Visible="False">
        <asiweb:BusinessCheckBox runat="server" ID="AvailableToGuests" RenderPanelField="True" DisplayCaption="True" Caption="Available to guests" PositionCaption="Right" />
        <div style="clear:both;"></div>
        <asp:Panel runat="server" ID="AvailableToPrimaryDiv" CssClass="collapse">
            <div class="ClearFix SubItems"><%-- This has to be its own div to avoid the collapse animation jumping --%>
                <asiweb:BusinessCheckBox runat="server" ID="AvailableToPrimary" RenderPanelField="True" DisplayCaption="True" Caption="Also available to primary registrants" PositionCaption="Right" />
            </div>
        </asp:Panel>
    </asp:Panel>
    <div style="clear: both;"></div>
    <table id="table1" class="Grid RowGridlinesOnly FunctionPricingTable" style="border-style:none;">
        <tr runat="server" ID="TableHeaderEventPricing">
            <th><asiweb:StyledLabel runat="server" ID="LabelCutoffDateHeader" cssClass="screen-reader-text" /></th>
            <th><asiweb:StyledLabel runat="server" ID="LabelEarlyDate" /></th>
            <th><asiweb:StyledLabel runat="server" ID="labelRegularDate" /></th>
        </tr>
        <tr runat="server" id="TopRow" class="AlignRight">
            <td colspan="6">
                <asp:LinkButton runat="server" id="AddPricingGroupImageLink" OnClick="AddPricingGroupClick">
                    <asp:Image runat="server" ID="AddPricingGroupImage" SkinID="PanelCommandButtonAdd" AlternateText="Add" />
                </asp:LinkButton> 
                <asp:LinkButton runat="server" id="AddPricingGroupHyperlink" OnClick="AddPricingGroupClick"></asp:LinkButton> 
            </td>
        </tr>
        <tr runat="server" id="TableHeaderProgramPricing">
            <th>
                <asiweb:StyledLabel runat="server" ID="LabelPricingName" />
            </th>
            <th class="AlignCenter">
                <div runat="server" id="DivLabelComp" class="AlignCenter">
                    <asiweb:StyledLabel runat="server" ID="LabelComp" Text="Comp" />
                </div>
            </th>
            <th class="AlignCenter">
                <asiweb:StyledLabel runat="server" ID="LabelEarly" />
            </th>
            <th class="AlignCenter">
                <asiweb:StyledLabel runat="server" ID="LabelRegular" />
            </th>
            <th class="AlignCenter">
                <asiweb:StyledLabel runat="server" ID="LabelLate" />
            </th>
            <th><asiweb:StyledLabel runat="server" id="deleteLabel" CssClass="screen-reader-text" Text="Delete"></asiweb:StyledLabel></th>
        </tr>
        <tr runat="server" id="DivCutoffDates">
            <td>
                <asiweb:StyledLabel runat="server" ID="LabelCutoffDate" CssClass="Label" />
            </td>
            <td>
                <asiweb:StyledLabel runat="server" ID="CalendarEarlyCutoffLabel" AssociatedControlID="CalendarEarlyCutoff" text="Early Cutoff Date" CssClass="screen-reader-text"></asiweb:StyledLabel>
                <asiweb:BusinessCalendar2 runat="server" ID="CalendarEarlyCutoff" UseSqlDateTimeMinValue="true" Width="9em" 
                    OnDataChanged="CalendarCutoffDateChanged" AutoPostBack ="true" />
            </td>
            <td>
                <asiweb:StyledLabel runat="server" ID="CalendarRegularCutoffLabel" AssociatedControlID="CalendarRegularCutoff" text="Regular Cutoff Date" CssClass="screen-reader-text"></asiweb:StyledLabel>
                <asiweb:BusinessCalendar2 runat="server" ID="CalendarRegularCutoff" UseSqlDateTimeMinValue="true" Width="9em"
                    OnDataChanged="CalendarCutoffDateChanged" AutoPostBack ="true" />
            </td>
           
        </tr>
        
        
        <tr runat="server" id="DivStandardPrice">
            <td>
                <asiweb:StyledLabel runat="server" ID="LabelStandardPrice" CssClass="Label" />
            </td>
            <td>
                <div runat="server" id="DivCompStandardPrice">
                    <asiweb:StyledLabel runat="server" id="CompStandardPriceLabel" Text="The Default pricing group is complimentary"  CssClass="screen-reader-text" AssociatedControlID="CompStandardPrice"></asiweb:StyledLabel>
                    <asiweb:BusinessCheckBox runat="server" ID="CompStandardPrice" />    
                </div>
            </td>
            <td>
                <asiweb:StyledLabel runat="server" ID="TextPriceStandardEarlyLabel" Text="Default Early Price" CssClass="screen-reader-text" AssociatedControlID="TextPriceStandardEarly"></asiweb:StyledLabel>
                <asiweb:BusinessTextBox runat="server" ID="TextPriceStandardEarly" MaxLength="13" class="AlignRight" />
                <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceStandardEarlyValidator" Type="Currency" ControlToValidate="TextPriceStandardEarly"
                                            Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                            CssClass="Important" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be between 0 and 1000000.")%>' /></div>
            </td>
            <td>
                <asiweb:StyledLabel runat="server" ID="TextPriceStandardRegularLabel" Text="Default Regular Price" CssClass="screen-reader-text" AssociatedControlID="TextPriceStandardRegular"></asiweb:StyledLabel>
                <asiweb:BusinessTextBox runat="server" ID="TextPriceStandardRegular" MaxLength="13" class="AlignRight" />
                <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceStandardRegularValidator" Type="Currency" ControlToValidate="TextPriceStandardRegular"
                                            Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                            CssClass="Important" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be between 0 and 1000000.")%>' /></div>
            </td>
            <td>
                <asiweb:StyledLabel runat="server" ID="TextPriceStandardLateLabel" Text="Default Late Price" CssClass="screen-reader-text" AssociatedControlID="TextPriceStandardLate"></asiweb:StyledLabel>
                <asiweb:BusinessTextBox runat="server" ID="TextPriceStandardLate" MaxLength="13" class="AlignRight" />
                <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceStandardLateValidator" Type="Currency" ControlToValidate="TextPriceStandardLate"
                                            Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                            CssClass="Important" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be between 0 and 1000000.")%>' /></div>
            </td>
            <td></td>
        </tr>
        <tr runat="server" id="DivDiscountPrice" class="GridAlternateRow" >
            <td>
                <asiweb:StyledLabel runat="server" ID="LabelDiscountPrice" CssClass="Label" />
            </td>
            <td>
                <div runat="server" id="DivCompDiscountPrice">
                    <asiweb:StyledLabel runat="server" id="CompDiscountPriceLabel" Text="The Member pricing group is complimentary"  CssClass="screen-reader-text" AssociatedControlID="CompDiscountPrice"></asiweb:StyledLabel>
                    <asiweb:BusinessCheckBox runat="server" ID="CompDiscountPrice" />    
                </div>        
            </td>      
            <td>
                <asiweb:StyledLabel runat="server" ID="TextPriceDiscountEarlyLabel" Text="Members Early Price" CssClass="screen-reader-text" AssociatedControlID="TextPriceDiscountEarly"></asiweb:StyledLabel>
                <asiweb:BusinessTextBox runat="server" ID="TextPriceDiscountEarly" MaxLength="13" class="AlignRight" />
                <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceDiscountEarlyValidator" Type="Currency" ControlToValidate="TextPriceDiscountEarly"
                                            Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                            CssClass="Important" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRangeEarly", "Must be between 0 and 1000000.")%>' /></div>
            </td>
            <td>
                <asiweb:StyledLabel runat="server" ID="TextPriceDiscountRegularLabel" Text="Members Regular Price" CssClass="screen-reader-text" AssociatedControlID="TextPriceDiscountRegular"></asiweb:StyledLabel>
                <asiweb:BusinessTextBox runat="server" ID="TextPriceDiscountRegular" MaxLength="13" class="AlignRight" />
                <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceDiscountRegularValidator" Type="Currency" ControlToValidate="TextPriceDiscountRegular"
                                            Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                            CssClass="Important" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRangeReg", "Must be between 0 and 1000000.")%>' /></div>
            </td>
            <td>
                <asiweb:StyledLabel runat="server" ID="TextPriceDiscountLateLabel" Text="Members Late Price" CssClass="screen-reader-text" AssociatedControlID="TextPriceDiscountLate"></asiweb:StyledLabel>
                <asiweb:BusinessTextBox runat="server" ID="TextPriceDiscountLate" MaxLength="13" class="AlignRight" />
                <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceDiscountLateValidator" Type="Currency" ControlToValidate="TextPriceDiscountLate"
                                            Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                            CssClass="Important" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRangeLate", "Must be between 0 and 1000000.")%>' /></div>
            </td>
            <td></td>
        </tr>
        <asp:Repeater runat="server" ID="PricingGroupRepeater" OnItemDataBound="PricingGroupRepeater_ItemDataBound" OnItemCommand="PricingGroupRepeater_ItemCommand" Visible="False">
            <ItemTemplate >
                <tr runat="server" id="DivOtherPrice" class='<%# Container.ItemIndex % 2 == 0 ? "" : "GridAlternateRow" %>'>
                    <td>
                        <asiweb:StyledLabel runat="server" ID="LabelOtherPrice" CssClass="Label" />
                    </td>
                    <td>
                        <div style="display: table-cell;" runat="server" id="DivCompOtherPrice">
                            <asiweb:BusinessCheckBox runat="server" ID="CompOtherPrice"/>    
                        </div>        
                    </td>        
                    <td>
                        <div><asiweb:BusinessTextBox runat="server" ID="TextPriceOtherEarly" MaxLength="13" class="AlignRight" /></div>
                        <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceOtherEarlyValidator" Type="Currency" ControlToValidate="TextPriceOtherEarly"
                                                Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                                CssClass="Important" 
                                                ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be between 0 and 1000000.")%>' /></div>
                    </td>
                    <td>
                        <div><asiweb:BusinessTextBox runat="server" ID="TextPriceOtherRegular" MaxLength="13" class="AlignRight" /></div>
                        <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceOtherRegularValidator" Type="Currency" ControlToValidate="TextPriceOtherRegular"
                                                                Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                                                CssClass="Important" 
                                                                ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be between 0 and 1000000.")%>' /></div>
                    </td>
                    <td>
                        <div><asiweb:BusinessTextBox runat="server" ID="TextPriceOtherLate" MaxLength="13" class="AlignRight" /></div>
                        <div style="display:inline;"><asp:RangeValidator runat="server" ID="TextPriceOtherLateValidator" Type="Currency" ControlToValidate="TextPriceOtherLate"
                                                Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                                CssClass="Important" 
                                                ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be between 0 and 1000000.")%>' /></div>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="PriceSheetId"/>
                        <asp:Imagebutton AlternateText=<%# ResourceManager.GetPhrase("Delete","Delete") %> CommandName="Delete" ID="DeleteButton" runat="server" SkinID="PanelCommandButtonDelete" ToolTip=<%# ResourceManager.GetPhrase("Delete","Delete") %>></asp:Imagebutton>
                    </td>   
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table> 
</div>
<div style="padding-left: 11em;">
    <asp:HiddenField runat="server" ID="HiddenEarlyCutoffDate" />
    <asp:HiddenField runat="server" ID="HiddenRegularCutoffDate" />
    <asp:HiddenField runat="server" ID="HiddenCutoffDateValidationErrMsg" />
    <asp:CustomValidator runat="server" ID="CustomValidatorCutoff" Display="Dynamic"
        SetFocusOnError="true" />
</div>

<asi:ItemCreatorTaxInfo ID="TaxInfo" runat="Server" />
</ContentTemplate>
</asp:UpdatePanel> 