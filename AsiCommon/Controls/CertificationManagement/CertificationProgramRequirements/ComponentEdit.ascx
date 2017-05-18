<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.ComponentEdit" Codebehind="ComponentEdit.ascx.cs" %>

<script type="text/javascript">

   function ComponentEditOkClick(actionItemId, numberOfUnits)
   {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        oWindow.EditComponentParams = {
            ActionItemId:actionItemId, 
            NumberOfUnits:numberOfUnits};
   }
   
   function ComponentEditOkClick_NewObject(certificationModuleKey, stageId, componentActionItemId, index, numberOfUnits)
   {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        oWindow.AddComponentParams = {
            CertificationModuleKey:certificationModuleKey,
            StageId:stageId,
            ComponentActionItemId:componentActionItemId,
            Index:index,
            NumberOfUnits:numberOfUnits
        };
        oWindow.Close();
   }

</script>

<asiweb:StyledLabel runat="server" ID="lblCertificationProgram" RenderPanelField="True" DisplayCaption="True" Caption="Certification Program" />
<asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayType="ReadOnlyField" RenderPanelField="True" DisplayCaption="True" />
<asiweb:SmartControl runat="server" BoundPropertyName="Code" DisplayType="ReadOnlyField" RenderPanelField="True" DisplayCaption="True" />
<asiweb:SmartControl runat="server" BoundPropertyName="Description" DisplayType="ReadOnlyField" RenderPanelField="True" DisplayCaption="True" />
<div class="InputSmallWrapper">
    <asiweb:BusinessTextBox runat="server" ID="NumberOfUnitsValue" Enabled="true" RenderPanelField="True" DisplayCaption="True" />
</div>
<asiweb:SmartControl runat="server" BoundPropertyName="RequiresGrade" DisplayType="ReadOnlyField" RenderPanelField="True" DisplayCaption="True" />
<asiweb:SmartControl runat="server" BoundPropertyName="RequiresApproval" DisplayType="ReadOnlyField" RenderPanelField="True" DisplayCaption="True" />
<asiweb:SmartControl runat="server" BoundPropertyName="CertificationStaffOnly" DisplayType="ReadOnlyField" RenderPanelField="True" DisplayCaption="True" />
<asiweb:SmartControl runat="server" BoundPropertyName="StatusCode" DisplayType="ReadOnlyField" RenderPanelField="True" DisplayCaption="True" />

