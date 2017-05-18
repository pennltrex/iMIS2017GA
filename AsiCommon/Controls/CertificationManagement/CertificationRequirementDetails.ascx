<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CertificationRequirementDetails.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.CertificationManagement.CertificationRequirementDetails" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl2 ID="requirementDetails" runat="server" Collapsible="False" BorderStyle="None">
  
    <h2><asiweb:StyledLabel runat="server" ID="labelName" /></h2>   
    <div style="margin-top:15px;margin-bottom:10px;">
        <asiweb:StyledLabel runat="server" ID="labelDescription" />
    </div> 
    
    <div class="FloatRight PanelBlock" runat="server" id="SortModeDiv" Visible="true">
        <asiweb:BusinessDropDownList AutoPostBack="true" Caption="Sort by:" DisplayCaption="true" ID="SortMode" PositionCaption="Left" RenderPanelField="true" runat="server" ShowNullItem="false" />           
    </div>
    <div style="clear:both;"></div> 
     
    <telerik:RadGrid AllowMultiRowEdit="false" AllowMultiRowSelection="false" AllowPaging="true" AllowSorting="false" 
        PageSize="10" AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="false" CssClass="Grid" 
        EnableLinqExpressions="false" FooterStyle-CssClass="GridFooter" GridLines="None" HeaderStyle-CssClass="GridHeader" 
        ID="RadGrid1" ItemStyle-CssClass="GridRow" runat="server" ShowStatusBar="false" ShowGroupPanel="false" >
              
        <MasterTableView AllowMultiColumnSorting="false" ClientDataKeyNames="OfferingKey" CommandItemDisplay="None" 
            DataKeyNames="OfferingKey" ShowHeader="true">
                                             
            <GroupHeaderTemplate>
                <asiweb:BusinessLabel id="GroupDateLabel" runat="server" Visible="false" />  
            </GroupHeaderTemplate>
                
            <Columns>
                                                  
                <telerik:GridTemplateColumn AllowFiltering="true" DataField="Name" HeaderStyle-Wrap="false" HeaderText="Offerings" ItemStyle-Wrap="true" SortExpression="Name" UniqueName="NameColumn">
                    
                    <ItemTemplate>
                        
                        <asiweb:BusinessLabel CssClass="Label" id="NameLabel" runat="server" /><br/>
                     
                        <div class="PanelFieldValue" id="DescriptionLabelDiv" runat="server">
						    <asiweb:BusinessLabel id="DescriptionLabel" runat="server" />                           
					    </div>
                        <div style="clear:both;"></div>
                        
                        <div id="PriceDiv" runat="server" visible="false">
                            <asiweb:BusinessLabel CssClass="Label" id="PricePromptLabel" runat="server" Text="Price:" />
                                <asiweb:BusinessLabel id="PriceLabel" runat="server" /><br/>           
                        </div>
                        
                        <div id="DateDiv" runat="server" visible="false">
                            <asiweb:BusinessLabel CssClass="Label" id="DatePromptLabel" runat="server" Text="Date:" />
                                <asiweb:BusinessLabel id="DateLabel" runat="server" /><br/>           
                        </div>
                        
                        <div id="LocationDiv" runat="server" visible="false">
                            <asiweb:BusinessLabel CssClass="Label" id="LocationPromptLabel" runat="server" Text="Location:" />
                                <asiweb:BusinessLabel id="LocationLabel" runat="server" /><br/>
                        </div> 
                        
                        <div id="ProviderDiv" runat="server" visible="false">                      
                            <asiweb:BusinessLabel CssClass="Label" id="ProviderPromptLabel" runat="server" Text="Provider:" />
                                <asiweb:BusinessLabel id="ProviderLabel" runat="server" /><br/>
                        </div> 

                        <div class="FloatRight" style="padding-bottom:5px;">
                            <asiweb:StyledButton AutoPostBack="false" CausesValidation="false" CssClass="TextButton PrimaryButton" ID="ProductPurchaseButton" runat="server" Text="Purchase &raquo;" /> 
                            <asiweb:StyledButton AutoPostBack="false" CausesValidation="false" CssClass="TextButton PrimaryButton" ID="EventRegisterButton" runat="server" Text="Register Now &raquo;" />  
                            <asiweb:StyledButton AutoPostBack="false" CausesValidation="false" ID="RecordCompletionButton" runat="server" Text="Record Completion" />                    
                        </div>

                    </ItemTemplate>

                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn AllowFiltering="true" DataField="Date" HeaderStyle-Wrap="false" HeaderText="Date" ItemStyle-Wrap="true" SortExpression="Date" UniqueName="DateColumn" Visible="false">                   
                    <ItemTemplate>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                         
            </Columns> 
                     
            <NoRecordsTemplate>
                <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" Text="(None)"></asiweb:BusinessLabel>
            </NoRecordsTemplate> 
                                         
        </MasterTableView>

        <ClientSettings AllowGroupExpandCollapse="true">
            <Selecting AllowRowSelect="false" />                                              
        </ClientSettings>
        
        <GroupingSettings ShowUnGroupButton="false"></GroupingSettings>

    </telerik:RadGrid> 
    
    <div class="FloatRight" id="RecordCompletionDiv" runat="server" style="padding-bottom:5px;" Visible="False">
        <asiweb:StyledButton AutoPostBack="false" CausesValidation="false" CssClass="TextButton PrimaryButton" ID="RecordSingleCompletionButton" runat="server" Text="Record Completion" />                    
    </div>
    <div style="clear:both;"></div>
    <div class="CommandBar" style="padding-top:7px;">
        <asp:Button CausesValidation="False" CssClass="TextButton" id="CancelButton" runat="server" Text="Cancel" ToolTip="Cancel" OnClientClick="CloseRadWindow();return false;" />
    </div>

</asiweb:PanelTemplateControl2>