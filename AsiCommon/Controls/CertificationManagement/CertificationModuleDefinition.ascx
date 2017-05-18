<%@ Import Namespace="Asi"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.CertificationModuleDefinition" Codebehind="CertificationModuleDefinition.ascx.cs" %>
<style type='text/css'>
    #CertificationDescriptionDiv .reToolCell, #CertificationDescriptionDiv .reToolZone {
        display: none !important
    }        
    #CertificationDescriptionDiv .reContentCell, #CertificationDescriptionDiv .RadEditorTextArea {
        height: 100px !important;
        border: none !important;
        padding:0 !important;
        margin:0 !important;
    }
    #CertificationDescriptionDiv TABLE, #CertificationDescriptionDiv textarea {
        height: 100px !important;
        width: 30em !important;
    }
    #CertificationDescriptionDiv .PanelFieldValue {
       padding:0 !important;
       margin:0 !important;
    }
</style>
<asiweb:PanelTemplateControl ID="TablePanel1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
   <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="14em">
        <asp:Panel ID="programRow" runat="server" Visible="false">
            <div class="PanelField Left">
	            <asp:Label ID="Label2" runat="server" AssociatedControlID="lblCertificationProgram" Text="Certification Program" />
	            <div class="PanelFieldValue">
                    <asiweb:StyledLabel id="lblCertificationProgram" runat="server" />
                </div>
            </div>
        </asp:Panel>
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Code" DisplayCaption="true" />
        <div class="PanelField PanelField Left">
            <div class="PanelFieldLabel">
                 <label for="CertificationDescriptionDiv">Description</label>
            </div>
            <div id="CertificationDescriptionDiv" class="PanelFieldValue" >       
                <asiweb:SmartControl runat="server" ID="DescriptionControl" BoundPropertyName="Description" DisplayCaption="false" EnableTextareaEditorMode="true" HIControlType="HTMLEditor" />      
            </div>
        </div>         
        <asiweb:SmartControl runat="server" id="NumberOfUnits" BoundPropertyName="NumberOfUnits" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="EnrolleeCanRecord" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresGrade" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApproval" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationStaffOnly" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="StatusCode" DisplayCaption="true" OnDataChange="Status_DataChange" />
    </asiweb:PanelTemplateColumn>
      
    <div class="PanelField Left" >
        <div class="PanelFieldLabel"></div>
        <asiweb:StyledLabel ID="PassGradeLabel" runat="server" Width="14em" Text="Pass Grades" CssClass="Label" />
        <div class="PanelFieldValue">
            <asiweb:MultiSelectControl2 ID="passGradeSelector" runat="server" Height="150px" Width="200px" SelectedValuesListBox-ToolTip="Pass Grades" 
        RenderPanelField="False" />
        </div>
    </div>  
    <div class="PanelField Left" >
        <asiweb:StyledLabel ID="FailGradeLabel" runat="server" Width="14em" Text="Fail Grades"  CssClass="Label" />
        <div class="PanelFieldValue">
            <asiweb:MultiSelectControl2 ID="failGradeSelector" runat="server" Height="150px" Width="200px" SelectedValuesListBox-ToolTip="Fail Grades" RenderPanelField="False" />
        </div>
    </div>    
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" runat="server" LabelWidth="14em">
        <asiweb:SmartControl runat="server" ID="FileAttachment" BoundPropertyName="FileAttachment" DisplayCaption="true" OnDataChange="FileAttach_DataChange" AutoPostBack="True" ShowNullItem="False"/>
        <asiweb:SmartControl ID="AttachmentInstructions" runat="server" BoundPropertyName="AttachmentInstructions" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>


<div class="CommandBar"> 
    <asiweb:StyledButton ID="btnCancel" runat="server" Text="Cancel" aria-hidden="true" />
</div>
<asp:Button ID="btnHiddenCancelModalPopupExtender" runat="server" Style="display: none; visibility: hidden" aria-hidden="true" text="Cancel Popup"></asp:Button>

<asp:Panel ID="pnlCancelPopup" CssClass="popupPanel" Width="300" BorderStyle="Solid" BorderColor="Gray" BorderWidth="1px" BackColor="White" runat="server">
    <asp:Panel ID="pnlDragHandleCancelPopup" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:black" CssClass="popupPanel">
        <div>
            <p style="padding: 5px;">
                <%# String.Concat(ResourceManager.GetPhrase("Certification.InactivateComponent", "Inactivate Component"), "?") %>
            </p>
        </div>
    </asp:Panel>
    <br />
    <p style="padding-left: 5px;">
        <%# ResourceManager.GetPhrase("Certification.AssociatedCertificationPrograms", "Associated Certification Programs") %>
    </p>
    <asp:Repeater ID="repRelatedPrograms" runat="server">
        <HeaderTemplate>
            <div style="margin: 10px;">
        </HeaderTemplate>
        <ItemTemplate>
            <asiweb:StyledLabel ID="relatedProgram" Text="<%# Container.DataItem %>" runat="server" /><br />
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <table width="100%">
        <tr align="right" class="CommandButtonBar">
            <td style="padding-right: 5px;">
                <asiweb:StyledButton ID="btnNoPopup" runat="server" />
                <asiweb:StyledButton ID="btnYesPopup" runat="server" />
            </td>
        </tr>
    </table>
</asp:Panel>

<ajaxToolkit:ModalPopupExtender ID="mpeCancelPopup" runat="server" 
    TargetControlID="btnHiddenCancelModalPopupExtender"
    PopupControlID="pnlCancelPopup" 
    PopupDragHandleControlID="pnlDragHandleCancelPopup"
    CancelControlID="btnNoPopup"
    OkControlID="btnYesPopup"
    BackgroundCssClass="modalBackground"
    DropShadow="True" />

<asiweb:SmartPanel ID="customData" runat="server" DisplayFormat="Update" UseParentAtomObject="true"  
    PropertiesToHide="Name, Code, Description, NumberOfUnits, EnrolleeCanRecord, RequiresGrade, RequiresApproval, 
        CertificationStaffOnly, StatusCode, Date, Location, CertificationModuleKey, MarkedForDeleteOn, CreatedByUserKey, 
        CreatedOn, UpdatedByUserKey, UpdatedOn, AttachmentInstructions, FileAttachment" ColumnLabelWidth="14em" HideIfNoProperties="true" />
<style>
    .chosen-container {
        width: 200px !important;
    }
</style>