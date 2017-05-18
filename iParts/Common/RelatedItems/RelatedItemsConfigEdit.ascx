<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RelatedItemsConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.RelatedItems.RelatedItemsConfigEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">        
 
    <asiweb:SmartControl ID="ListSourceQuery" runat="server" BoundPropertyName="ListSourceQuery" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" InputFieldCssClass="InputXLargeWrapper" /> 

    <div class="PanelField Left" ID="DivLabelIQAError" runat="server" >      
	    <div style="display:inline"><label>&nbsp;</label></div>       
        <div class="PanelFieldValue AsiWarning">
            <asp:Label ID="LabelIQAError" runat="server" />
        </div>        
    </div>  
             
    <asiweb:SmartControl ID="MaxRecords" runat="server" BoundPropertyName="MaxRecords" 
        DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXSmallWrapper" />   
        
    <asiweb:SmartControl ID="ListDescription" runat="server" BoundPropertyName="ListDescription" 
        DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />     
        
    <asiweb:SmartControl ID="NoRecordsFound" runat="server" BoundPropertyName="NoRecordsFound" 
        DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />   
    <div style="clear: both;"></div>              
    <div class="ShowFieldset">
        <fieldset>
            <legend>Filter options</legend>  
            <div class="PanelField Left">
                <div>
                    <label id="LabelSelectDataColumn" for="SelectDataColumn" runat="server" ></label> 
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectDataColumn" runat="server"></asp:DropDownList>
                </div>
            </div>
    
            <asiweb:SmartControl ID="QueryStringParameterName" runat="server" BoundPropertyName="QueryStringParameterName" 
                DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" /> 
        
        </fieldset>           
    </div>
    <div class="ShowFieldset">
        <fieldset>
            <legend>Display options</legend>  

            <asiweb:SmartControl ID="ImagePath" runat="server" BoundPropertyName="ImagePath" DisplayCaption="True" DataSaveUponStateChange="False" InputFieldCssClass="InputXLargeWrapper" /> 
    
            <asiweb:SmartControl ID="DefaultImage" runat="server" BoundPropertyName="DefaultImage" DisplayCaption="True" DataSaveUponStateChange="False" InputFieldCssClass="InputXLargeWrapper" />             
    
            <asiweb:SmartControl ID="ImageDimension" runat="server" BoundPropertyName="ImageDimension" 
                DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXSmallWrapper" />     
        
            <asiweb:SmartControl ID="DisplayOrientation" runat="server" BoundPropertyName="DisplayOrientation" 
                DisplayCaption="true" DataSaveUponStateChange="false" OnClientClick="EnableDisableEdit()" /> 
        
            <div class="SubItems AutoWidth" style="padding-left:157px;">       
                <asiweb:SmartControl ID="EnableHorizontalScrolling" runat="server" BoundPropertyName="EnableHorizontalScrolling" 
                    DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" OnClientClick="EnableDisableEdit()" />  
            </div> 
            
            <div class="SubItems AutoWidth" style="padding-left:157px;">                       
                <asiweb:SmartControl ID="HorizontalScrollWidth" runat="server" BoundPropertyName="HorizontalScrollWidth" 
                    DisplayCaption="true" DataSaveUponStateChange="false" MinValue="0" MaxValue="1500" InputFieldCssClass="InputXSmallWrapper" />
            </div>                      
                      
            <asiweb:SmartControl ID="DisplayNameOption" runat="server" BoundPropertyName="DisplayNameOption" 
                DisplayCaption="true" DataSaveUponStateChange="false" OnClientClick="EnableDisableEdit()" />
    
            <div class="SubItems AutoWidth" >                       
                <asiweb:SmartControl ID="LabelMaxLength" runat="server" BoundPropertyName="LabelMaxLength" 
                    DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXSmallWrapper" />
            </div>           
       
            <asiweb:SmartControl ID="ClickUrl" runat="server" BoundPropertyName="ClickUrl" 
                DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />   

        </fieldset>          
    </div>
    <asp:HiddenField ID="HiddenParametersCount" runat="server" Value="0" />   
     
</asiweb:paneltemplatecontrol>  

<script type="text/javascript">
    //<![CDATA[
    EnableDisableEdit();
    function EnableDisableEdit() {
        var displayOrientationHorizontal = $get("<%#DisplayOrientation.ClientID%>_RadioButtonSet_0");
        var displayOrientationVertical = $get("<%#DisplayOrientation.ClientID%>_RadioButtonSet_1");
        var enableHorizontalScrolling = $get("<%#EnableHorizontalScrolling.ClientID%>");
        var enableHorizontalScrollingCheckBox = $get("<%#EnableHorizontalScrolling.ClientID%>_CheckBoxSet");
        var enableHorizontalScrollingCaption = $get("<%#EnableHorizontalScrolling.ClientID%>_Caption");
        var displayNameOptionTooltip = $get("<%#DisplayNameOption.ClientID%>_RadioButtonSet_0");
        var displayNameOptionLabel = $get("<%#DisplayNameOption.ClientID%>_RadioButtonSet_1");
        var toolTipLabel = displayNameOptionTooltip.nextSibling;
        var labelMaxLength = $get("<%#LabelMaxLength.ClientID%>");
        var labelMaxLengthTextField = $get("<%#LabelMaxLength.ClientID%>_TextField");
        var labelMaxLengthCaption = $get("<%#LabelMaxLength.ClientID%>_Caption");
        var horizontalScrollWidth = $get("<%#HorizontalScrollWidth.ClientID%>");
        var horizontalScrollWidthTextField = $get("<%#HorizontalScrollWidth.ClientID%>_TextField");

        //If horizontal display then enable the horizontal scrolling checkbox and disable the tooltip option
        if (displayOrientationHorizontal != null && displayOrientationHorizontal.checked) {
            enableHorizontalScrollingCheckBox.removeAttribute("disabled", 0);
            enableHorizontalScrollingCaption.removeAttribute("disabled", 0);
            enableHorizontalScrolling.removeAttribute("disabled", 0);         
            displayNameOptionTooltip.removeAttribute("disabled", 0);
            toolTipLabel.setAttribute("disabled", false);
            toolTipLabel.removeAttribute("disabled", 0);
            toolTipLabel.disabled = false;
            horizontalScrollWidth.setAttribute("disabled", true);
            horizontalScrollWidth.setAttribute("disabled", "disabled");
            horizontalScrollWidthTextField.setAttribute("disabled", true);
            horizontalScrollWidthTextField.setAttribute("disabled", "disabled");
            
            if (enableHorizontalScrollingCheckBox.checked) {
                displayNameOptionTooltip.setAttribute("disabled", true);
                displayNameOptionLabel.checked = true;
                toolTipLabel.setAttribute("disabled", true);
                toolTipLabel.setAttribute("disabled", "disabled");
                toolTipLabel.disabled = true;                             
                horizontalScrollWidth.setAttribute("disabled", false);
                horizontalScrollWidth.removeAttribute("disabled", 0);
                horizontalScrollWidthTextField.setAttribute("disabled", false);
                horizontalScrollWidthTextField.removeAttribute("disabled", 0);
            }
        }

        // If vertical display then disable the horizontal scroll checkbox and enable the tooltip option
        if (displayOrientationVertical != null && displayOrientationVertical.checked) {
            displayNameOptionTooltip.removeAttribute("disabled", 0);
            toolTipLabel.setAttribute("disabled", false);
            toolTipLabel.removeAttribute("disabled", 0);            
            enableHorizontalScrollingCheckBox.setAttribute("disabled", true);
            enableHorizontalScrollingCheckBox.checked = false;
            enableHorizontalScrollingCaption.disabled = true;
            enableHorizontalScrolling.setAttribute("disabled", true);
            horizontalScrollWidth.setAttribute("disabled", true);
            horizontalScrollWidth.setAttribute("disabled", "disabled");
            horizontalScrollWidthTextField.setAttribute("disabled", true);
            horizontalScrollWidthTextField.setAttribute("disabled", "disabled");
        }

        labelMaxLength.removeAttribute("disabled", 0);
        labelMaxLengthTextField.removeAttribute("disabled", 0);
        labelMaxLengthCaption.removeAttribute("disabled", 0); 
        // Disable the LabelMaxLength control if the tooltip option is selected
        if (displayNameOptionTooltip != null && displayNameOptionTooltip.checked) {
            labelMaxLength.setAttribute("disabled", true);
            labelMaxLengthTextField.setAttribute("disabled", true);
            labelMaxLengthCaption.setAttribute("disabled", true);
        }
    }
//]]>
</script> 
