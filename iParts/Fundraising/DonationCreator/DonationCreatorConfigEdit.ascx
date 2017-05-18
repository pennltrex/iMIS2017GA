<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DonationCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.DonationCreator.DonationCreatorConfigEdit" %>
<%@ Register tagPrefix="asiweb" assembly="Asi.Web" namespace="Asi.Web.UI.WebControls" %>  <!-- don't believe intelisense - this didn't compile locally without directive -->

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asp:UpdatePanel runat="server">  
         <ContentTemplate> 
          <asiweb:SmartControl 
             ID="DisplayDescriptionControl" runat="server" BoundPropertyName="DisplayItemDescription" EnableAjaxPostback="True"
             DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false"  AutoPostBack="true"/>
          <asiweb:SmartControl runat="server" ID="AssignSoftCredits" PositionCaption="Right" DisplayCaption="True" 
              BoundPropertyName="AllowSoftCreditAssignment"></asiweb:SmartControl>
          <asiweb:SmartControl 
             ID="ProcessingModeControl" runat="server" BoundPropertyName="ProcessingMode" EnableAjaxPostback="True"
             DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" AutoPostBack="true"/>
         </ContentTemplate>
       </asp:UpdatePanel>

       <asp:UpdatePanel runat="server" ID="PaymentOptionsAreaPanel" Visible='<%# IsV10 %>'>  
        <ContentTemplate>

          <asiweb:SmartControl    
            ID = "PaymentTermOptionsControl" runat="server" BoundPropertyName="PaymentTermOption" EnableAjaxPostback="True"
            DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" AutoPostback="true" /> 
          <div style="padding-left:60px;">   
            <asiweb:SmartControl ID="PaymentTermOptionsListControl" runat="Server" BoundPropertyName="PaymentTermOptionsValue" DisplayCaption="true" />
         </div>

        </ContentTemplate>
       </asp:UpdatePanel>  
          
    </div>    

    <div class="AutoWidth">
     <asp:UpdatePanel runat="server">  
        <ContentTemplate>              
        <asiweb:SmartControl 
            ID="DistributionModeControl" runat="server" BoundPropertyName="DistributionMode"  EnableAjaxPostback="True"
            DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" AutoPostback="true" />       
        <div style="padding-left:60px;">   
            <asiweb:SmartControl ID="DistributionListControl" runat="Server" BoundPropertyName="DistributionValue" DisplayCaption="true" />
        </div>
         </ContentTemplate>
       </asp:UpdatePanel>  
    </div>

    <asiweb:SmartControl
        ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

    <asiweb:SmartControl 
        ID="ItemAddedLabelControl" runat="server" BoundPropertyName="ItemAddedLabel" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" /> 
        
    <div id ="DisplayPremiumsSection" runat="server">
        <asiweb:SmartControl ID="DisplayPremiumsCheckBox" runat="server" BoundPropertyName="DisplayPremiums" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <div class="AutoWidth" id="DisplayPremiumConfigSection" style="padding-left:60px;" runat="server" > 
              <asiweb:SmartControl ID="PremiumSectionTitle" runat="server" BoundPropertyName="PremiumSectionTitle"
                  DisplayCaption="True" PositionCaption="Left" DataSaveUponStateChange="False"/>
              <asiweb:SmartControl ID="PremiumDisplayMode" runat="server" BoundPropertyName="PremiumDisplayMode" 
                DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false"/> 
            <div id ="DisplayAmountFirstDiv" runat="server">
                <asiweb:SmartControl ID="ChooseNoPremium" runat="server" BoundPropertyName="ChooseNoPremium" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false"/>    
                <div id="DisplayNoPremiumOptionsDiv" runat="server" style="padding-left:60px;">
                    <asiweb:SmartControl ID="NoPremiumTitle" runat="server" BoundPropertyName="NoPremiumTitle" 
                    DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" InputFieldStyle="padding-left:50px"/>     
                    <asiweb:SmartControl runat="server" ID="NoPremiumDescription" BoundPropertyName="NoPremiumDescription"
                    DisplayCaption="True" PositionCaption="Left" DataSaveUponStateChange="False"  />           
                </div>
            </div>
            <div id ="SelectGiftFirstDiv" runat="server">
                <asp:Label ID="GiftArrayWarning" runat="server" Text="NOTE: Personalized gift array is not available with this display mode." CssClass="Info SubItems"/>               
                <asiweb:SmartControl runat="server" ID="PremiumGiftAmountLabel" BoundPropertyName="PremiumGiftAmountLabel"
                    DisplayCaption="True" PositionCaption="Left" DataSaveUponStateChange="False"  />                      
            </div>
        </div>
    </div>
    
    <asiweb:SmartControl ID="GiftArrayIQAQueryPath" runat="server" BoundPropertyName="GiftArrayIQAQueryPath" DisplayCaption="true" PositionCaption="Left" 
        DataSaveUponStateChange="false" AutoPostBack="false"/>  
 </asiweb:PanelTemplateControl>
