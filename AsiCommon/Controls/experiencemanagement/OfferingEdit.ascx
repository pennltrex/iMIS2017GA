<%@ Import namespace="Asi.Web.UI.WebControls"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.OfferingEdit" Codebehind="OfferingEdit.ascx.cs" %>
<style type='text/css'>
    #DescriptionDiv .reToolCell, #DescriptionDiv .reToolZone {
        display: none !important
    }        
    #DescriptionDiv .reContentCell, #DescriptionDiv .RadEditorTextArea {
        height: 100px !important;
        border: none !important;
        padding:0 !important;
        margin:0 !important;
    }
    #DescriptionDiv TABLE, #DescriptionDiv textarea {
        height: 100px !important;
        width: 30em !important;
    }
    #DescriptionDiv .PanelFieldValue {
       padding:0 !important;
       margin:0 !important;
    }
</style>
<asiweb:PanelTemplateControl2 ID="TablePanel1" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="14em">
        <asp:Panel ID="pnlExperienceDefinition" runat="server" Visible="false">
            <div class="PanelField Left">
                <asp:Label ID="ExperienceCaption" runat="server" AssociatedControlID="lblExperience" />
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel id="lblExperience" runat="server" />
		        </div>
        	</div>
            <div class="PanelField Left">
                <asp:Label ID="ProgramCaption" runat="server" AssociatedControlID="lblProgram" />
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel id="lblProgram" runat="server" />
	    	    </div>
    	    </div>
        </asp:Panel>
        <asp:Panel id="pnlCertificationModule" runat="server" Visible="false">
            <div class="PanelField Left">
                <asp:Label ID="ComponentCaption" runat="server" AssociatedControlID="lblCertificationModule" />
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel id="lblCertificationModule" runat="server" />
	    	    </div>
        	</div>
        </asp:Panel>
        <asiweb:SmartControl runat="server" ID="offeringTypeControl" BoundPropertyName="OfferingType" DisplayCaption="True" OnDataChange="OfferingType_Changed" AutoPostBack="True" ShowNullItem="False"/>
        <asiweb:BusinessFinderControl runat="server" ID="EventFinderControl" DisplayCaption="True" DeleteButtonText="" PositionCaption="Left"
            DataSourceComponentName="CsEvent" DataTextField="Title" DataValueField="key_EventCode" RenderPanelField="True" Caption="Event"
            DataSourceDocumentPath="$/EventManagement/DefaultSystem/Queries/EventSearch/ViewAll" OnDataChanged="Event_Changed" AutoPostBack="True" />
        <asiweb:BusinessFinderControl runat="server" ID="ProductFinderControl" DisplayCaption="True" DeleteButtonText="" PositionCaption="Left"
            DataSourceComponentName="CsProduct" DataTextField="Title" DataValueField="key_ProductCode" RenderPanelField="True" Caption="Product"
            DataSourceDocumentPath="$/Store/DefaultSystem/Queries/All Products for Sale on Web" AutoPostBack="False" />
        <div id="eventDetailDiv" runat="server">
            <div class="PanelFieldLabel">
                <asp:Label runat="server" Width="13.5em">&nbsp;</asp:Label>  
            </div>         
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel ID="eventLabel" runat="server" DisplayCaption="False" />
            </div>
        </div>    
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Code" DisplayCaption="true" />              
        <div class="PanelField PanelField Left">
            <div class="PanelFieldLabel">
                 <label for="DescriptionDiv">Description</label>
            </div>
            <div id="DescriptionDiv" class="PanelFieldValue" >       
                <asiweb:SmartControl runat="server" ID="DescriptionControl" BoundPropertyName="Description" DisplayCaption="false" EnableTextareaEditorMode="true" HIControlType="HTMLEditor" />      
            </div>
        </div>         

        <asiweb:SmartControl ID="EditStatusCodeControl" runat="server" BoundPropertyName="StatusCode" DisplayCaption="true" />
        <asiweb:SmartControl ID="AllowChangesControl" runat="server" BoundPropertyName="AllowChanges" DisplayCaption="true" CaptionCssClass="Required" OnClientClick="ValueChanged()" />
        <div runat="server" ID="InfoLabelDiv" class="PanelField">
            <asiweb:StyledLabel runat="server" ID="InfoLabel" Text="You must specify a valid date or select 'Allow date changes'" CssClass="PanelFieldValue AsiWarning"></asiweb:StyledLabel>
        </div>
        <asiweb:SmartControl ID="DateControl" runat="server" BoundPropertyName="Date" DisplayCaption="true" CaptionCssClass="Required" OnClientChange="ValueChanged()" />       
        <asiweb:SmartControl ID="PurchaseCompletionControl" runat="server" BoundPropertyName="PurchaseMarksCompletion" DisplayCaption="true" />
        <asiweb:SmartControl ID="providerControl" runat="server" BoundPropertyName="Provider" 
            RefAtomComponentName="NetContact" OnDataChange="ProviderChanged_Event" AutoPostBack="true" DisplayCaption="true"/>
        <div class="PanelField Left">
            <asp:Label ID="LocationCaption" runat="server" AssociatedControlID="ddlLocation" />
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList ID="ddlLocation" runat="server" Enabled="true" />
            </div>
        </div>        
       
        
  </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>

<asiweb:SmartPanel ID="customData" runat="server" DisplayFormat="Update" UseParentAtomObject="true" 
    PropertiesToHide="OfferingType, Name, Code, Description, StatusCode, Date, Provider, Location, CreatedByUserKey, 
        CreatedOn, UpdatedByUserKey, UpdatedOn, ExperienceDefinitionKey, OfferingKey, PurchaseMarksCompletion"
        ColumnLabelWidth="14em" HideIfNoProperties="true" />

<script type="text/javascript">
    //<![CDATA[
    ValueChanged();
    function ValueChanged() {
        var checkboxControl = $get("<%#AllowChangesControl.ClientID%>_CheckBoxSet");
        var checkboxControlCaption = $get("<%#AllowChangesControl.ClientID%>_Caption");
        var dateControl = $get("<%#DateControl.ClientID%>_Calendarrad_Dp_dateInput");
        var dateControlCaption = $get("<%#DateControl.ClientID%>_Caption");
        var infoLabelControl = jQuery('div[id$=InfoLabelDiv]');
        var hideLabel;
        if (checkboxControl != null && dateControl != null) {
            if (checkboxControl.checked) {
                dateControlCaption.className = "";
            } else {
                dateControlCaption.className = "Required";
            }
            if (dateControl.value.length > 0) {
                hideLabel = true;
                checkboxControlCaption.className = "";
            } else {
                hideLabel = checkboxControl.checked == true;
                checkboxControlCaption.className = "Required";
            }
            if(hideLabel == true)
                infoLabelControl.hide();
            else
                infoLabelControl.show();
        }
    }

    function setNewInitialVal() {
        var checkboxControl = $get("<%#AllowChangesControl.ClientID%>_CheckBoxSet");
        var infoLabelControl = jQuery('div[id$=InfoLabelDiv]');
        if (checkboxControl != null) {
            checkboxControl.checked = true;
            infoLabelControl.hide();
        }        
    }
    //]]>
</script>