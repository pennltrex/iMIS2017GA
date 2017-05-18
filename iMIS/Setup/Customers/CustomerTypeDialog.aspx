<%@ Page Codebehind="CustomerTypeDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.CustomerTypeDialog" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="False" FieldSet="False" ShowHeader="True" BorderStyle="None">
                  
            <div class="AddPaddingHorizontal Section">           
                <div class="PanelField Left">
                    <asiweb:StyledLabel AssociatedControlID="CodeTextBox" CssClass="Required" ID="CodeLabel" runat="server" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="CodeTextBox" MaxLength="5" RenderPanelField="false" Required="True" runat="server" />
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="CodeTextBox" CssClass="Important" ID="CodeValidator" runat="server" SetFocusOnError="True" Text="Required" />
                        <asiweb:AsiRegularExpressionValidator ControlToValidate="CodeTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" id="CodeRegExValidator" runat="server" Text="Invalid" ValidationExpression="^[a-zA-Z0-9_-]*" />            
                    </div>
                </div>  
                       
                <div class="PanelField Left">
                    <asiweb:StyledLabel AssociatedControlID="NameTextBox" CssClass="Required" ID="NameLabel" runat="server" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="false" ID="NameTextBox" MaxLength="20" RenderPanelField="false" Required="True" runat="server" />
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="NameTextBox" CssClass="Important" ID="NameTextBoxValidator" runat="server" SetFocusOnError="True" Text="Required" />            
                    </div>
                </div> 
                
                <asiweb:BusinessCheckBox DisplayCaption="True" id="IsCompanyCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" /> 
                <asiweb:BusinessCheckBox DisplayCaption="True" id="IsMemberCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />                    
                              
            </div> 
                                  
            <div class="ShowFieldset" style="width:900px;">
	            <fieldset>
		            <legend>
		                <span class="SectionLabel"><asp:label id="DuesBillingLabel" runat="server"/></span> 
		            </legend>		                
                    <div class="Section"> 
                       
                        <asiweb:BusinessCheckBox CssClass="AddPaddingVertical Section" DisplayCaption="True" id="BillCompanyCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />   
                                           
                        <div class="FloatLeft" style="width:100%;">
                 
                            <div class="row Section">
                                <div class="col-xs-6 CenterText">       
                                    <asp:label CssClass="Label" id="BillingCodeLabel" runat="server" />
                                </div>
                                <div class="col-xs-2 CenterText">
                                    <asp:label CssClass="Label" id="AmountLabel" runat="server" />
                                </div>
                                <div class="col-xs-2 CenterText">
                                    <asp:label CssClass="Label" id="ComplimentaryLabel" runat="server" />  
                                </div>
                            </div> 
                           
                            <div class="row">
                                <div class="col-xs-6">                           
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="DuesCode1DropDownList" ID="DuesCode1Label" runat="server" />
                                        <div class="PanelFieldValue">
						                    <asiweb:BusinessComboBox AllowCustomText="True" DisplayCaption="False" DropDownAutoWidth="Enabled" id="DuesCode1DropDownList" RenderPanelField="False" runat="server" TranslateOnlyCaptionAndToolTip="True" />                          
						                    <asp:RegularExpressionValidator ControlToValidate="DuesCode1DropDownList" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" id="DuesCode1DropDownListRegularExpressionValidator" runat="server" Text="Invalid" ValidationExpression="^[a-zA-Z0-9- /_.%(None)]*" />           
                                        </div>
                                    </div> 
                                </div>
                                <div class="col-xs-2 Center">
                                    <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate1TextBox" RenderPanelField="false" runat="server" /> 
                                    <asp:RangeValidator ControlToValidate="Rate1TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="DefaultPriceTextBoxRange" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />       
                                </div>
                                <div class="col-xs-2 Center">
                                    <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp1CheckBox" RenderPanelField="false" runat="server" />                                   
                                </div>
                            </div>
                    
                            <div class="row">
                                <div class="col-xs-6">
                                    <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode2DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
                                </div>
                                <div class="col-xs-2 Center">
                                    <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate2TextBox" RenderPanelField="false" runat="server" />        
                                    <asp:RangeValidator ControlToValidate="Rate2TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator1" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
                                <div class="col-xs-2 Center">
                                    <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp2CheckBox" RenderPanelField="false" runat="server" />                                   
                                </div>
                            </div>  
                    
                            <div class="row">
                                <div class="col-xs-6">
                                    <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode3DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
                                </div>
                                <div class="col-xs-2 Center">
                                    <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate3TextBox" RenderPanelField="false" runat="server" />        
                                    <asp:RangeValidator ControlToValidate="Rate3TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator2" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />     
                                </div>
                                <div class="col-xs-2 Center">
                                    <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp3CheckBox" RenderPanelField="false" runat="server" />                                   
                                </div>
                            </div>  
                                                            
                            <div class="row">
	                            <div class="col-xs-6">
		                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode4DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
	                            </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate4TextBox" RenderPanelField="false" runat="server" />        
	                                <asp:RangeValidator ControlToValidate="Rate4TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator3" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp4CheckBox" RenderPanelField="false" runat="server" />                                   
	                            </div>
                            </div> 

                            <div class="row">
	                            <div class="col-xs-6">
		                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode5DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
	                            </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate5TextBox" RenderPanelField="false" runat="server" />        
	                                <asp:RangeValidator ControlToValidate="Rate5TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator4" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp5CheckBox" RenderPanelField="false" runat="server" />                                   
	                            </div>
                            </div>

                            <div class="row">
	                            <div class="col-xs-6">
		                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode6DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
	                            </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate6TextBox" RenderPanelField="false" runat="server" />        
	                                <asp:RangeValidator ControlToValidate="Rate6TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator5" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp6CheckBox" RenderPanelField="false" runat="server" />                                   
	                            </div>
                            </div>                      
                    
                            <div class="row">
	                            <div class="col-xs-6">
		                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode7DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
	                            </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate7TextBox" RenderPanelField="false" runat="server" />        
	                                <asp:RangeValidator ControlToValidate="Rate7TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator6" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp7CheckBox" RenderPanelField="false" runat="server" />                                   
	                            </div>
                            </div> 

                            <div class="row">
	                            <div class="col-xs-6">
		                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode8DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
	                            </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate8TextBox" RenderPanelField="false" runat="server" />        
	                                <asp:RangeValidator ControlToValidate="Rate8TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator7" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp8CheckBox" RenderPanelField="false" runat="server" />                                   
	                            </div>
                            </div>

                            <div class="row">
	                            <div class="col-xs-6">
		                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode9DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
	                            </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate9TextBox" RenderPanelField="false" runat="server" />        
	                                <asp:RangeValidator ControlToValidate="Rate9TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator8" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp9CheckBox" RenderPanelField="false" runat="server" />                                   
	                            </div>
                            </div>  

                            <div class="row Section">
	                            <div class="col-xs-6">
		                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DuesCode10DropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="True" runat="server" />  
	                            </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="Rate10TextBox" RenderPanelField="false" runat="server" />        
	                                <asp:RangeValidator ControlToValidate="Rate10TextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" ID="RangeValidator9" MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" />
                                </div>
	                            <div class="col-xs-2 Center">
		                            <asiweb:BusinessCheckBox DisplayCaption="True" id="Comp10CheckBox" RenderPanelField="false" runat="server" />                                   
	                            </div>
                            </div> 
                     
			            </div>                 
                                                
                    </div>    
	            </fieldset>
            </div>              
          		
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script>
    function ShowLoadingPanel() {
        if (!Page_ClientValidate()) return false;
        jQuery("[id$='_LoadingPanel']").show();
        return false;
    }

    function ConfirmAction(isMemberChanged, isCompanyChanged, memberCompanyMessage) {

        var isMemberCheckBoxChecked = jQuery('#<%= IsMemberCheckBox.ClientID %>').is(':checked');
        var isCompanyCheckBoxChecked = jQuery('#<%= IsCompanyCheckBox.ClientID %>').is(':checked');

        if (isMemberChanged === "True")
            isMemberChanged = true;
        else 
            isMemberChanged = false;

        if (isCompanyChanged === "True")
            isCompanyChanged = true;
        else
            isCompanyChanged = false;
        
        if (isMemberCheckBoxChecked !== isMemberChanged || isCompanyCheckBoxChecked !== isCompanyChanged) {

            var answer = false;
            if ((isMemberCheckBoxChecked && isCompanyCheckBoxChecked)
                || (!isMemberCheckBoxChecked && !isCompanyCheckBoxChecked)
                || (isMemberCheckBoxChecked && !isCompanyCheckBoxChecked)
                || (!isMemberCheckBoxChecked && isCompanyCheckBoxChecked)) {
                answer = confirm(memberCompanyMessage);
            }
            if (answer)
                jQuery("[id$='_LoadingPanel']").show();
            return answer;
        }

        if (!Page_ClientValidate()) return false;
        jQuery("[id$='_LoadingPanel']").show();       
        return true;
    }
    </script>
        
</asp:Content> 	