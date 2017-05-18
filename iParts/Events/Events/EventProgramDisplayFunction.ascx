<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.iParts.Events.EventProgramDisplayFunction"
    CodeBehind="EventProgramDisplayFunction.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="asiEvent" Src="~/iParts/Events/Events/Common/PriceOverrideDisplay.ascx"  TagName="PriceOverrideDisplay" %>

<div class="ProgramItemSummary" runat="server" id="DivSummaryContainer">       
    <div class="DescriptionColumn" runat="server" id="DivDescriptionColumn">
        <div class="ListItemTitle" runat="server">
            <asp:HyperLink ID="DisplayLink" Text="Edit" runat="server" />
            <asiweb:StyledLabel runat="server" ID="InItinerary" translate="yes" Text="In Itinerary" CssClass="InItinerary" />
            <asiweb:StyledLabel runat="server" ID="OnWaitlist" translate="yes" Text="On Waitlist" CssClass="OnWaitlist" Visible="false" />
           <asiweb:StyledLabel runat="server" ID="HasConflict" translate="yes" Text="Conflict in Itinerary" CssClass="HasConflict" /><br/>                      
            <div runat="server" ID="ConflictError" class="AsiErrorInline" Visible="false">		                  
                <asp:Label runat="server" ID="ConflictWarningMessage" />
            </div>                       
        </div>
        <div runat="server" id="DescriptionDiv" class="Description">
            <asi:StyledLabel runat="server" ID="DescriptionData" />
        </div>        
        <div class="PanelField" runat="server" id="CategoryRow">
            <div class="PanelFieldLabel" runat="server">
                <asi:StyledLabel runat="server" ID="CategoryLabel" translate="yes" CssClass="Label" Text="Category" />
            </div>
            <div class="PanelFieldValue">
                <asi:StyledLabel runat="server" ID="CategoryData" />
            </div>
        </div>
        <div class="PanelField" runat="server" id="TrackRow">
            <div class="PanelFieldLabel" runat="server">
                <asi:StyledLabel runat="server" ID="TrackLabel" translate="yes"  CssClass="Label" Text="Track" />
            </div>
            <div class="PanelFieldValue">
                <asi:StyledLabel runat="server" ID="TrackData" />
            </div>
        </div>         
        <div class="PanelField" runat="server" id="PriceRow">
            <div class="PanelFieldLabel" runat="server">
                <asi:StyledLabel runat="server" ID="PriceLabel" translate="yes"  CssClass="Label" />
            </div>
            <div class="PanelFieldValue">
                <asi:StyledLabel runat="server" ID="PriceData" />
                <asi:StyledLabel runat="server" ID="UnitPrice" />
                <asiEvent:PriceOverrideDisplay runat="server" id="PriceOverrideDisplay" visible="false" />
            </div>
        </div>
        <div class="PanelField" runat="server" id="TimeRow">
            <div class="PanelFieldLabel" runat="server">
                <asi:StyledLabel runat="server" ID="TimeLabel" translate="yes" CssClass="Label" />
            </div>
            <div class="PanelFieldValue">
                <asi:StyledLabel runat="server" ID="TimeData" />
            </div>
        </div>        
        <div runat="server" ID="FunctionFormDisplayDiv">
            <br/>
        </div>
        <div style="height:10px;" runat="server">
            <asiweb:StyledLabel runat="server"  translate="yes" ID="SaveMessageLabel" CssClass="FloatRight"/>
        </div>        
    </div>     
    <div class="WhenColumn" runat="server" ID="DivWhenColumn"> 
        <asi:StyledLabel runat="server" ID="WhenData" />
    </div>
    <div class="IteneraryColumn" runat="server" ID="DivItineraryColumn">
        <div class="PanelField" runat="server" id="LinkRow">
            <div runat="server" id="QuantityFields" Visible="False">
                <asi:StyledLabel translate="yes" runat="server" ID="QuantityLabel" />
                <asp:TextBox runat="server" ID="QuantityInput" Text="1" CssClass="InputXXSmall" Style="margin-bottom: 6px"/>
                <asp:RangeValidator runat="server" ID="QuantityInputRangeValidator" Type="Integer" Display="Dynamic" ControlToValidate="QuantityInput" />                
            </div>
            <asiweb:StyledButton runat="server" ID="AddButton" AutoPostBack="False" Text="Add" CausesValidation="True" />
            <div runat="server">
                <asp:HyperLink ID="RemoveLinkButton" runat="server"/> <br/>  
                <asp:HyperLink ID="RegisterFromWaitListBtn" Text="Register From The Waitlist" Visible="False" runat="server"/>             
            </div>
        </div>
        <div class="PanelField" runat="server" id="MessageRow">
            <asiweb:StyledLabel ID="FunctionUnavailableMessageLabel" runat="server" />
        </div>
        <div runat="server" ID="DivInfoRegistrationFull" Visible="False" class="AsiValidation" >
             <asi:StyledLabel ID="RegistrationFullLabel" runat="server"  /> 
             <div ID="DivWaitList" runat="server" style="display: none">
                  <asi:BusinessRadioButtonList runat="server" ID="WaitListRadioButtons" DisplayCaption="False">
                      <asp:ListItem Text="Add to waitlist" Value="Waitlist" />
                      <asp:ListItem Text="Register" Value="Register"/>                      
                  </asi:BusinessRadioButtonList>
                  <asp:Button runat="server" ID="WaitListButton" AutoPostBack="False" Style="display:none" />
             </div>       
        </div>        
    </div> 
    <div class="PanelFieldValue" runat="server" ID="DeleteColumn" Visible="False">
       <asiweb:StyledHyperlink runat="server" ID="DeleteRegOptionButton" Text="Delete" AutoPostBack="False" CausesValidation="False"/>       
    </div> 
    <div style="display: none;">
        <asp:HiddenField runat="server" ID="ProgramItemQuantityHidden" />
    </div>
</div>
