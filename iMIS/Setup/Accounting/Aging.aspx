<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.AccountingAging" Codebehind="Aging.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
            
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
                       
            <div class="container-fixed FloatLeft" style="max-width:800px;">
                 
                <div class="row Section">
                    <div class="col-xs-1">
                        <label><%# GetTranslatedPhrase("Group")%></label> 
                    </div>
                    <div class="col-xs-2">
                        <label><%# GetTranslatedPhrase("Days")%></label> 
                    </div>
                    <div class="col-xs-3">
                        <label><%# GetTranslatedPhrase("Group name")%></label>  
                    </div>
                    <div class="col-xs-6">
                        <label><%# GetTranslatedPhrase("Thank you, Reminder, Dunning message")%></label>  
                    </div>
                </div> 
                           
                <div class="row Section">
                    <div class="col-xs-1 CenterText">
                        <label class="Center" style="width:5em;">1</label>
                    </div>
                    <div class="col-xs-2">
                        <asiweb:BusinessLabel AssociatedControlID="AgeDays1TextBox" CssClass="hidden" ID="BusinessLabel1" runat="server" Text="Group 1 days" />
                        <asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="False" ID="AgeDays1TextBox" RenderPanelField="false" runat="server" /><br/> 
                        <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic" 
                            MinimumValue="1" MaximumValue="365" ControlToValidate="AgeDays1TextBox" 
                            ErrorMessage="Value between 1 and 365" />           
                    </div>
                    <div class="col-xs-3">
                        <asiweb:BusinessLabel AssociatedControlID="AgeHeading1TextBox" CssClass="hidden" ID="BusinessLabel4" runat="server" Text="Group 1 name" />
                        <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="False" ID="AgeHeading1TextBox" MaxLength="15" RenderPanelField="false" runat="server" />                                    
                    </div>
                    <div class="col-xs-6">
                        <asiweb:BusinessLabel AssociatedControlID="DunnMessage1TextBox" CssClass="hidden" ID="BusinessLabel8" runat="server" Text="Group 1 message" />
                        <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="False" Height="100px" ID="DunnMessage1TextBox" MaxLength="250" RenderPanelField="false" runat="server" TextMode="MultiLine" />                
                    </div>
                </div> 

                <div class="row Section">
                    <div class="col-xs-1 CenterText">
                        <label class="Center" style="width:5em;">2</label>
                    </div>
                    <div class="col-xs-2">
                        <asiweb:BusinessLabel AssociatedControlID="AgeDays2TextBox" CssClass="hidden" ID="BusinessLabel2" runat="server" Text="Group 2 days" />
                        <asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="False" ID="AgeDays2TextBox" RenderPanelField="false" runat="server" /><br/>         
                        <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic" 
                            MinimumValue="1" MaximumValue="365" ControlToValidate="AgeDays2TextBox" 
                            ErrorMessage="Value between 1 and 365" />                 
                    </div>
                    <div class="col-xs-3">
                        <asiweb:BusinessLabel AssociatedControlID="AgeHeading2TextBox" CssClass="hidden" ID="BusinessLabel5" runat="server" Text="Group 2 name" />
                        <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="False" ID="AgeHeading2TextBox" MaxLength="15" RenderPanelField="false" runat="server" />                                    
                    </div>
                    <div class="col-xs-6">
                        <asiweb:BusinessLabel AssociatedControlID="DunnMessage2TextBox" CssClass="hidden" ID="BusinessLabel9" runat="server" Text="Group 2 message" />
                        <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="False" ID="DunnMessage2TextBox" MaxLength="250" RenderPanelField="false" runat="server" TextMode="MultiLine" Height="100px" />                
                    </div>
                </div>
                 
                <div class="row Section">
                    <div class="col-xs-1 CenterText">
                        <label class="Center" style="width:5em;">3</label>
                    </div>
                    <div class="col-xs-2">
                        <asiweb:BusinessLabel AssociatedControlID="AgeDays3TextBox" CssClass="hidden" ID="BusinessLabel3" runat="server" Text="Group 2 days" />
                        <asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="False" ID="AgeDays3TextBox" RenderPanelField="false" runat="server" /><br/>           
                        <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic" 
                            MinimumValue="1" MaximumValue="365" ControlToValidate="AgeDays3TextBox" 
                            ErrorMessage="Value between 1 and 365" />                 
                    </div>
                    <div class="col-xs-3">
                        <asiweb:BusinessLabel AssociatedControlID="AgeHeading3TextBox" CssClass="hidden" ID="BusinessLabel6" runat="server" Text="Group 3 name" />
                        <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="False" ID="AgeHeading3TextBox" MaxLength="15" RenderPanelField="false" runat="server" />                                    
                    </div>
                    <div class="col-xs-6">
                        <asiweb:BusinessLabel AssociatedControlID="DunnMessage3TextBox" CssClass="hidden" ID="BusinessLabel10" runat="server" Text="Group 3 message" />
                        <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="False" ID="DunnMessage3TextBox" MaxLength="250" RenderPanelField="false" runat="server" TextMode="MultiLine" Height="100px" />                
                    </div>
                </div> 

                <div class="row Section">
                    <div class="col-xs-1 CenterText">
                        <label class="Center" style="width:5em;">4</label>
                    </div>
                    <div class="col-xs-2">
                        &nbsp;       
                    </div>
                    <div class="col-xs-3">
                        <asiweb:BusinessLabel AssociatedControlID="AgeHeading4TextBox" CssClass="hidden" ID="BusinessLabel7" runat="server" Text="Group 4 name" />
                        <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="False" ID="AgeHeading4TextBox" MaxLength="15" RenderPanelField="false" runat="server" />                                    
                    </div>
                    <div class="col-xs-6">
                        <asiweb:BusinessLabel AssociatedControlID="DunnMessage4TextBox" CssClass="hidden" ID="BusinessLabel11" runat="server" Text="Group 4 message" />
                        <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="False" ID="DunnMessage4TextBox" MaxLength="250" RenderPanelField="false" runat="server" TextMode="MultiLine" Height="100px" />                
                    </div>
                </div> 

            </div>
            
            <asiweb:BusinessDropDownList DisplayCaption="True" ID="TermsCodeDropDownList" PositionCaption="Left" RenderPanelField="true" runat="server" IncludeNullItem="True"  />              
                           
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script>
    function ShowLoadingPanel() {
        if (Page_IsValid)
            jQuery("#<%#LoadingPanel.ClientID%>").show();
    }
    </script>    

</asp:Content> 	