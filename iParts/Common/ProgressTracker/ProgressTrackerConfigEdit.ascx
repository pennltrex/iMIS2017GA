<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProgressTrackerConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.ProgressTracker.ProgressTrackerConfigEdit" %>
 <%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
      
    <asiweb:SmartControl 
        ID="ListSourceQuery" runat="server" 
        BoundPropertyName="ListSourceQuery" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" /> 

    <div style="clear: both;"></div> 

    <div class="SubItems" ID="DivLabelIQAError" runat="server" >
        <div class="PanelFieldValue">
            <asp:Label ID="LabelIQAError" runat="server" CssClass="Important"> </asp:label>
        </div>
    </div> 
    
    <div style="clear: both;"></div> 
    
    <div class="ShowFieldset">
        
        <fieldset>
            
            <legend>Filter Options</legend>  
                            
            <div class="PanelField Left">
                <asiweb:StyledLabel id="LabelSelectDataColumn" runat="server" AssociatedControlID="SelectDataColumn"></asiweb:StyledLabel> 
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectDataColumn" runat="server" />
                </div>
            </div> 
           
            
            <div class="SubItems"> 
                <asiweb:SmartControl ID="QueryStringParameterName" runat="server" BoundPropertyName="QueryStringParameterName" 
                    DisplayCaption="true" DataSaveUponStateChange="false" />
            </div>
            
        </fieldset>       
    
    </div>
    
    <div class="ShowFieldset">
        
        <fieldset>
            
            <legend>Display Messages</legend>  
            <div class="SubItems" ID="DivLabelMessageError" runat="server" >  
                <div class="PanelFieldValue">
                    <asp:Label ID="LabelMessageError" runat="server" CssClass="Important"></asp:Label>
                </div>
            </div> 
            <asiweb:SmartControl ID="ProgressDescription" runat="server" BoundPropertyName="ProgressDescription" 
                DisplayCaption="true" DataSaveUponStateChange="false" /> 
        
            <asiweb:SmartControl ID="SuccessfulMessage" runat="server" BoundPropertyName="SuccessfulMessage" 
                DisplayCaption="true" DataSaveUponStateChange="false" /> 
    
        </fieldset> 
         
    </div>

    <div class="ShowFieldset">
        
        <fieldset>
            
            <legend>Caption Options</legend>  
            
            <asiweb:SmartControl ID="ProgressBarLocation" runat="server" BoundPropertyName="ProgressBarLocation" 
                DisplayCaption="true" DataSaveUponStateChange="false" /><br/><br/>                                
           
            <div class="AutoWidth">      
                <asiweb:SmartControl ID="DisplayGoalPercent" runat="server" BoundPropertyName="DisplayGoalPercent" 
                    DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" OnClientClick="ResetFields()" /> 
            </div>
            <div class="SubItems"> 
                <asiweb:SmartControl ID="GoalPercentDescription" runat="server" BoundPropertyName="GoalPercentDescription" 
                    DisplayCaption="true" DataSaveUponStateChange="false" /> 
            </div>
          
            <div class="AutoWidth">  
                <asiweb:SmartControl ID="DisplayGoalCountTotal" runat="server" BoundPropertyName="DisplayGoalCountTotal" 
                    DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" OnClientClick="ResetFields()" />         
            </div> 
            <div class="SubItems"> 
                <asiweb:SmartControl ID="GoalCountTotalDescription" runat="server" BoundPropertyName="GoalCountTotalDescription" 
                    DisplayCaption="true" DataSaveUponStateChange="false" /> 
            </div> 
             
            <div class="AutoWidth"> 
                <asiweb:SmartControl ID="DisplayGoalDaysRemaining" runat="server" BoundPropertyName="DisplayGoalDaysRemaining" 
                    DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" OnClientClick="ResetFields()" />    
            </div>
            <div class="SubItems">   
                <asiweb:SmartControl ID="GoalDaysRemainingDescription" runat="server" BoundPropertyName="GoalDaysRemainingDescription" 
                    DisplayCaption="true" DataSaveUponStateChange="false" /> 
            </div> 
            
        </fieldset>
          
    </div>
                                                                                               
</asiweb:PanelTemplateControl> 
 
<script id="Script1" type="text/javascript">
    //<![CDATA[
    ResetFields();
    function ResetFields() {     
        var selectDataColumn = $get("<%#SelectDataColumn.ClientID%>");
        var queryStringParameterName = $get("<%#QueryStringParameterName.ClientID%>");
        var queryStringParameterNameField = $get("<%#QueryStringParameterName.ClientID%>_TextField");
        var queryStringParameterNameFieldValidator = $get("<%#QueryStringParameterName.ClientID%>_RequiredFieldValidator");
        var queryStringParameterNameFieldErrorMessage = $get("<%#QueryStringParameterName.ClientID%>_ErrorMessage");
        if (selectDataColumn.selectedIndex == 0) {                                     
            queryStringParameterNameField.isvalid = true;
            queryStringParameterNameFieldValidator.enabled = false;
            queryStringParameterNameFieldValidator.disabled = true;           
            queryStringParameterNameFieldErrorMessage.style.display = 'none';
            queryStringParameterNameFieldValidator.style.display = 'none';            
            queryStringParameterName.disabled =
                queryStringParameterNameField.disabled =
                    queryStringParameterNameFieldValidator.disabled = true;

            queryStringParameterNameField.value = '';          
        } else {
            queryStringParameterNameFieldValidator.enabled = true;
            queryStringParameterNameFieldValidator.disabled = false;            
            queryStringParameterName.disabled =
                queryStringParameterNameField.disabled =
                    queryStringParameterNameFieldValidator.disabled = false;
        }

        var displayGoalPercent = $get("<%#DisplayGoalPercent.ClientID%>_CheckBoxSet");
        var goalPercentDescription = $get("<%#GoalPercentDescription.ClientID%>_Caption");
        var goalPercentDescriptionField = $get("<%#GoalPercentDescription.ClientID%>_TextField");
        goalPercentDescription.disabled = true;
        goalPercentDescriptionField.disabled = true;
        if (displayGoalPercent.checked) {
            goalPercentDescription.disabled = false;
            goalPercentDescriptionField.disabled = false;
        }
        var displayGoalCountTotal = $get("<%#DisplayGoalCountTotal.ClientID%>_CheckBoxSet");
        var goalCountTotalDescription = $get("<%#GoalCountTotalDescription.ClientID%>_Caption");
        var goalCountTotalDescriptionField = $get("<%#GoalCountTotalDescription.ClientID%>_TextField");
        goalCountTotalDescription.disabled = true;
        goalCountTotalDescriptionField.disabled = true;
        if (displayGoalCountTotal.checked) {
            goalCountTotalDescription.disabled = false;
            goalCountTotalDescriptionField.disabled = false;
        }
        var displayGoalDaysRemaining = $get("<%#DisplayGoalDaysRemaining.ClientID%>_CheckBoxSet");
        var goalDaysRemainingDescription = $get("<%#GoalDaysRemainingDescription.ClientID%>_Caption");
        var goalDaysRemainingDescriptionField = $get("<%#GoalDaysRemainingDescription.ClientID%>_TextField");
        goalDaysRemainingDescription.disabled = true;
        goalDaysRemainingDescriptionField.disabled = true;
        if (displayGoalDaysRemaining.checked) {
            goalDaysRemainingDescription.disabled = false;
            goalDaysRemainingDescriptionField.disabled = false;
        }
    }
//]]>
</script>