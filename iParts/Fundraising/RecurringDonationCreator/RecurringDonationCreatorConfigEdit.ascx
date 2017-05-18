<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringDonationCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonationCreator.RecurringDonationCreatorConfigEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register tagPrefix="asiweb" assembly="Asi.Web" namespace="Asi.Web.UI.WebControls" %>  <!-- don't believe intelisense - this didn't compile locally without directive -->

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
        
   <asiweb:SmartControl ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
      DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />   
   <br/><br/><br/>

   <asiweb:StyledLabel ID="RecurringGiftFrequency" Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.RecurrentGiftFrequency", "Recurring gift frequency")%>'  Visible='<%# IsV10 %>'
       runat="server" CssClass="Label display-block"/> 

    <asp:UpdatePanel runat="server" >  
        <ContentTemplate>
  
         <asiweb:StyledRadioButton runat="server" AutoPostBack="True" Visible='<%# IsV10 %>' GroupName="RecurrentGiftFrequencyGroup"
            Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Fundraising.RecurringDonationCreator.AllowUserToSpecifyFrequencyControl", "Allow user to specify frequency")%>' 
            ID="AllowUserToSpecifyFrequencyControl" DisplayCaption="true" PositionCaption="Top"  Checked="True"  OnCheckedChanged="ToggleBetweenRadioButtons"/>
         <br/>
         <asiweb:StyledLabel runat="server" ID="Note" Visible='<%# IsV10 %>'
                Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Fundraising.RecurringDonationCreator.note", "NOTE: This option should not be used if payment terms are offered for the donation.")%>' 
                Font-Italic="True"/>   
         
         <div class="SubItems" id="OptionsPanel" runat="server">
         
            <asiweb:SmartControl
                ID="MakeRecurringTextNoControl" runat="server" BoundPropertyName="MakeRecurringTextNo" 
                DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

            <asiweb:SmartControl
                ID="MakeRecurringTextYesControl" runat="server" BoundPropertyName="MakeRecurringTextYes" 
                DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />     

            <asiweb:SmartControl
                ID="GiftFrequencyMessageControl" runat="server" BoundPropertyName="GiftFrequencyMessage" 
                DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" /> 
               
        </div>

         <asiweb:StyledRadioButton runat="server" GroupName="RecurrentGiftFrequencyGroup" AutoPostBack="True" Visible='<%# IsV10 %>'
               Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Fundraising.RecurringDonationCreator.FixedAnnualFrequency", "Fixed annual frequency")%>'
                ID="FixedAnnualFrequencyControl" DisplayCaption="true" PositionCaption="Top" OnCheckedChanged="ToggleBetweenRadioButtons"/> 
            
          <asiweb:InfoControl ID="FixedAnnualFrequencyInfo" runat="server"  Visible='<%# IsV10 %>'/>

    	 </ContentTemplate>
    </asp:UpdatePanel>

 </asiweb:PanelTemplateControl>