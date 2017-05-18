<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DonationCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.DonationCreator.DonationCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.iParts.Fundraising.DonationCreator" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.50508.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asp:HiddenField runat="server" ID="HiddenSoftCreditContactKey" />

        <asp:UpdatePanel ID="UpdatePanelValidation" runat="server">
            <ContentTemplate>
            <div>
                <asp:Label CssClass="Error" ID="ErrorLabel" runat="server" Text=""></asp:Label>                        
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    <asp:UpdatePanel runat="server" ID="UpdateGiftPanel">
        <ContentTemplate>
            <asp:Panel ID="DonationCreatorControl" runat="server">
                <asp:TextBox runat="server" ID="PremiumPagerKeyPressed" Style="display: none" title="Premium Pager Key Pressed" aria-hidden="true" />
                <asp:TextBox runat="server" ID="LastSelectedElementIdAfterGiftAmountBlur" Style="display: none" aria-hidden="true" />
                <div id="TitleDescriptionDiv" runat="server">
                    <div class="GiftItemName SectionTitle">
                        <asp:Literal ID="GiftItemName" runat="server"></asp:Literal>
                    </div>
                    <asiweb:StyledLabel runat="server" ID="ItemDescriptionLabel" CssClass="GiftItemDescription" />
                </div>
                
                <div runat="server" translate="Yes">
                    <%-- Note: The "Section" class is added dynamically to this and the other containing divs in the code behind --%>
                    <div id="SingleEntry" runat="server" class="PanelField Left">
                        <asiweb:StyledLabel AssociatedControlID="GiftAmount" CssClass="GiftAmountLabel" ID="GiftAmountLabel" runat="server"></asiweb:StyledLabel>
                        <div class="PanelFieldValue AutoWidth FloatNone">
                            <asiweb:BusinessTextBox DisplayCaption="false" ID="GiftAmount" runat="server" />
                            <ajaxToolkit:FilteredTextBoxExtender ID="GiftAmountFilter" runat="server"
                                TargetControlID="GiftAmount"         
                                FilterType="Custom, Numbers" />

                            <asiweb:AsiRequiredFieldValidator ControlToValidate="GiftAmount" CssClass="Important" ID="GiftAmountRequiredFieldValidator" runat="server" />
                            <asp:RangeValidator ControlToValidate="GiftAmount" CssClass="Important" Display="Dynamic" ID="GiftAmountRangeValidator1" MaximumValue="100000000" runat="server" Type="Double" />
                            <asiweb:StyledLabel ID="ProductStatusDisplayLabel" translate="yes" runat="server" CssClass="Error"/>
                        </div>
                    </div>
            
                    <div id="RadioButtonEntry" runat="server" visible="false">
                        <fieldset class="ShowLegend">
                            <legend>
                                <asiweb:StyledLabel CssClass="GiftAmountLabel SectionLabel" ID="GiftAmountLabel2" runat="server"></asiweb:StyledLabel>
                            </legend>
                       
                            <div class="PanelField Right FloatNone" runat="Server">
                                <asp:RadioButtonList ID="GiftAmountSelection" RepeatDirection="Horizontal" CssClass="radio-inline-sm" RepeatLayout="Flow" runat="server" OnSelectedIndexChanged="GiftAmountSelection_OnSelectedIndexChanged" />
                            <asiweb:StyledLabel runat="server" AssociatedControlID="GiftAmount2" Text='<%#ResourceManager.GetPhrase("OtherAmount", "Other amount")%>' CssClass="screen-reader-text"></asiweb:StyledLabel>
                            <asiweb:BusinessTextBox DisplayCaption="false" CssClass="InputSmall" ID="GiftAmount2" runat="server" AutoPostBack="False"/>
                            <ajaxToolkit:FilteredTextBoxExtender ID="GiftAmount2Filter" runat="server" 
                                TargetControlID="GiftAmount2"         
                                FilterType="Custom, Numbers"/>
                            <asp:CustomValidator CssClass="Important" Display="Dynamic" ErrorMessage="CustomValidator" ID="RadioEntryCustomValidator" runat="server" SetFocusOnError="True"></asp:CustomValidator>
                            <asiweb:AsiRequiredFieldValidator ControlToValidate="GiftAmount2" CssClass="Important" ID="GiftAmountRequiredFieldValidator2" runat="server" SetFocusOnError="True" />
                                <asp:RangeValidator ControlToValidate="GiftAmount2" CssClass="Important" Display="Dynamic" ID="GiftAmountRangeValidator2" MaximumValue="100000000" runat="server" Type="Double" SetFocusOnError="True"/>
                        </div>
                        </fieldset>
                    </div>
                    <div id="SoftCreditsAssignment" runat="server" Visible="False">
                        <div class="PanelField Left">
                            <asiweb:StyledLabel runat="server" ID="SoftCreditLabel" CssClass="Label"></asiweb:StyledLabel>
                            <div class="PanelFieldValue">
                                <asiweb:StyledLabel runat="server" ID="SoftCreditAssignedContactName" CssClass="MarginRight" />
                                <asp:LinkButton runat="server" ID="RemoveLinkButton" CssClass="MarginLeft MarginRight" 
                                    OnClick="RemoveSoftCreditLinkButtonClicked" Visible="False" />
                                <asp:LinkButton runat="server" id="SelectLink" CssClass="MarginRight" />
                                <asp:Button ID="SetSelectedSoftCreditContactKeyButton" runat="server" OnClick="SetSelectedSoftCreditContactKeyButtonClick" 
                                    CausesValidation="false" aria-hidden="true" Text="Set Contact" style="display:none" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="PanelField Left" id="DetailsDiv" runat="server">
                        <div>
                            <asiweb:StyledLabel runat="server" ID="DetailsLabel" Text="Details"
                                AssociatedControlID="DetailsEditor"></asiweb:StyledLabel>
                        </div>
                        
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" ID="DetailsEditor" CssClass="InputXLarge" TextMode="MultiLine" Rows="3" RenderPanelField="false"/>
                        </div>
                    </div>
                    
                    <div id="PaymentOptionsSection" runat="server" visible="False">
                        <fieldset class="ShowLegend">
                            <legend>
                                <asiweb:StyledLabel CssClass="GiftAmountLabel SectionLabel" ID="StyledLabel1" Text="Payment options" runat="server"></asiweb:StyledLabel>
                            </legend>
                            <div class="PanelField Right FloatNone" runat="Server">
                            <asp:RadioButtonList ID="PaymentOptions" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" AutoPostBack="True">
                                <asp:ListItem Selected="True">A single payment</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:RadioButtonList>                            
                            </div>
                            <asiweb:StyledLabel CssClass="Info" ID="AmountDueMessage" runat="server"></asiweb:StyledLabel>
                        </fieldset>
                        </div>
                        <div class="PanelField Left" runat="server" ID="collectionDayPanel" translate="yes">
                            <div style="display: inline;"> 
                                <asiweb:StyledLabel runat="server" ID="LabelCollectionDay" Text="Collection day" CssClass="Label" />
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessRadioButtonList runat="server" ID="RadioButtonCollectionDay" />
                                <asiweb:BusinessDropDownList runat="server" ID="DropDownListCollectionDay" />
                            </div>
                        </div>
                    
                    <fieldset id="PremiumSection" runat="server" class="ShowLegend">
                        <legend>
                            <asiweb:StyledLabel ID="PremiumSectionLabel" CssClass="GiftAmoutLabel SectionLabel" runat="server" />
                        </legend>
                        <div class="Info" id="PaPremiumTitleLabel" runat="server">
                            <asiweb:StyledLabel ID="PremiumTitleLabel" runat="server" />
                    </div>
                 <asp:Panel runat="server" ID="PremiumGiftsPanel">
                      <telerik:RadListView ID="PremiumListView" runat="server" AllowNodeEditing="False"
                            CausesValidation="False" EnableAjaxSkinRendering="False" ItemPlaceholderID="GiftItemContainer"
                                    DataKeyNames="ProductId" AllowPaging="true" PageSize="5" OnItemDataBound="PremiumListView_OnItemDataBound" OnPageIndexChanged="PremiumListView_OnPageIndexChanged">
                                <ItemTemplate>
                                    <asp:Panel ID="DataPanel" runat="server" CssClass="media AddPadding ">  
                                        <div runat="server" id="SelectButtonSection" class="pull-left" translate="yes">
                                                <asiweb:StyledButton ID="SelectButton" runat="server" Text="Select" CommandName="Select" CommandArgument='<%#Eval("ProductId") + ";" + Eval("Quantity") + ";" + Eval("MinimumValue")%>' OnCommand="PremiumListViewCommand" CssClass="AddToCartButton" />
                                        </div> 
                                        <div class="media-body">
                                                <asiweb:StyledLabel ID="PremiumName" Text='<%#Eval("Name")%>' runat="server" CssClass="SectionLabelSmaller" translate="no" />
                                            <div class="media">
                                                    <div class="pull-left">
                                                        <asp:Image runat="server" ID="ProductImage" ImageUrl='<%#Eval("ImageUrl")%>' AlternateText='<%#Eval("ImageAlternateText")%>' CssClass="LargeThumbnail" />
                                                </div>
                                                <div class="media-body">
                                                        <asiweb:StyledLabel ID="PremiumDescription" Text='<%#Eval("Description")%>' translate="no" runat="server" />
                                                        <asp:Panel ID="GiftAmountPanel" runat="server">
                                                            <br />
                                                        <strong>
                                                                <asiweb:StyledLabel ID="GiftAmountCaption" runat="server" />
                                                                <asiweb:StyledLabel ID="GiftAmountValue" Text='<%#Eval("MinimumValue")%>' runat="server" />
                                                        </strong>
                                                        </asp:Panel>
                                                </div>       
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ItemTemplate>
                                    <SelectedItemTemplate>
                                        <asp:Panel ID="DataPanel" runat="server" CssClass="media AddPadding SelectedItem">
                                            <div runat="server" id="AddToCartSection" class="pull-left" translate="yes">
                                                <asiweb:StyledLabel Text="Selected" runat="server" CssClass="Info"></asiweb:StyledLabel>
                                                <div runat="server">
                                                    <asp:LinkButton ID="RemoveLinkButton" Text="Remove" CommandName="Deselect" OnCommand="PremiumListViewCommand" runat="server"></asp:LinkButton>
                                                </div>
                                            </div> 
                                            <div class="media-body">
                                                <asiweb:StyledLabel ID="PremiumName" Text='<%#Eval("Name")%>' runat="server" CssClass="SectionLabelSmaller" translate="no" />
                                                <div class="media">
                                                    <div class="pull-left">
                                                        <asp:Image runat="server" ID="SelectedProductImage" ImageUrl='<%#Eval("ImageUrl") %>' AlternateText='<%#Eval("ImageAlternateText") %>' CssClass="LargeThumbnail"
                                                                   Visible='<%#Eval("ImageUrl").ToString() != string.Empty%>'/>
                                                    </div>
                                                    <div class="media-body">
                                                        <asiweb:StyledLabel ID="SelectedPremiumDescription" Text='<%#Eval("Description")%>' translate="no" runat="server" />
                                                        <asp:Panel ID="GiftAmountPanel" runat="server">
                                                            <br />
                                                            <strong>
                                                                <asiweb:StyledLabel ID="SelectedGiftAmountCaption" CssClass="SectionLabelSmaller" runat="server" />
                                                                <asiweb:StyledLabel ID="SelecteGiftAmountValue" Text='<%#Eval("MinimumValue")%>' CssClass="SectionLabelSmaller" runat="server" />
                                                            </strong>
                                                        </asp:Panel>
                                                    </div>       
                                                </div>
                                            </div>
                                    </asp:Panel>
                                </SelectedItemTemplate>
                        </telerik:RadListView>
                         <asp:DataPager runat="server" ID="DataPager1" PageSize="5" PagedControlID="PremiumListView">
                                    <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link"
                            ShowFirstPageButton="false"
                            ShowPreviousPageButton="true"
                            ShowLastPageButton="false" 
                                            ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Link" />
                           <asp:NextPreviousPagerField ButtonType="Link"
                            ShowFirstPageButton="false"
                            ShowPreviousPageButton="false"
                            ShowLastPageButton="false" 
                                            ShowNextPageButton="true" />
                            </Fields>
                          </asp:DataPager>
                    </asp:Panel>            
                    </fieldset>
                    <asp:PlaceHolder ID="AddToCartPlaceholder" runat="server">
                        <div class="PanelField" runat="server">
                            <asiweb:StyledLabel ID="ItemAddedMessageLabel" runat="server" Visible="false"></asiweb:StyledLabel>&nbsp;
                            <asiweb:BusinessHyperLink ID="CartLink" runat="server" Visible="False"></asiweb:BusinessHyperLink>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel> 
</asp:Panel>       
