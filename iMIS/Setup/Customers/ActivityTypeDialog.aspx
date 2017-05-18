<%@ Page Codebehind="ActivityTypeDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.ActivityTypeDialog" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="False" FieldSet="False" ShowHeader="True" BorderStyle="None">
        
            <div class="AddPaddingHorizontal Section">           
                <div class="PanelField Left">
                    <asiweb:StyledLabel AssociatedControlID="CodeTextBox" CssClass="Required" ID="CodeLabel" runat="server" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="CodeTextBox" MaxLength="10" RenderPanelField="false" Required="True" runat="server" />
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="CodeTextBox" CssClass="Important" ID="CodeValidator" runat="server" SetFocusOnError="True" Text="Required" />
                        <asiweb:AsiRegularExpressionValidator ControlToValidate="CodeTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid" id="CodeRegExValidator" runat="server" Text="Invalid" ValidationExpression="^[a-zA-Z0-9_-]*" />            
                    </div>
                </div>  
                       
                <div class="PanelField Left">
                    <asiweb:StyledLabel AssociatedControlID="NameTextBox" CssClass="Required" ID="NameLabel" runat="server" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="false" ID="NameTextBox" MaxLength="40" RenderPanelField="false" Required="True" runat="server" />
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="NameTextBox" CssClass="Important" ID="NameTextBoxValidator" runat="server" SetFocusOnError="True" Text="Required" />            
                    </div>
                </div> 
                
                <asiweb:BusinessCheckBox DisplayCaption="True" id="AllowUserEditCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" /> 
                                                                   
            </div>         
        
            <div class="ShowFieldset" style="width:800px;">
	            <fieldset>
		            <legend>
		                <span class="SectionLabel"><asp:label id="LabelsLabel" runat="server"/></span> 
		            </legend>		                
                    <div class="Section"> 
                        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" LabelWidth="12em" runat="server" Width="27em">
            		                               
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="SubtypePromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="NotePromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" />  
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="EffectiveDatePromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="SourcePromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" />         
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="TicklerPromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="CeuTypePromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" />        
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="Uf1PromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="Uf2PromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" />                                                
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="Uf3PromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="CoIdPromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
     	                     
                        </asiweb:PanelTemplateColumn>

                        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" LabelWidth="10em" runat="server" Width="25em">
                
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="DescriptionPromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" />
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="FollowUpPromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="ThruDatePromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" />             
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="AmountPromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="ActionPromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" />   
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="UnitsPromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="Uf4PromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="Uf5PromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="Uf6PromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:BusinessTextBox DisplayCaption="True" ID="Uf7PromptTextBox" MaxLength="15" RenderPanelField="True" runat="server" /> 
                            <asiweb:MultiSelectControl2 DisplayCaption="True" ID="AccessKeywordsMultiSelect" RenderPanelField="True" runat="server" SkipNoResults="True" Width="12.25em" />                        
                
                        </asiweb:PanelTemplateColumn>   
                                   
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
    </script>
        
</asp:Content> 	