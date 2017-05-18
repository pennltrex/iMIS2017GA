<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.CertificationRequirementEdit" Codebehind="CertificationRequirementEdit.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/ProcessManager/StageCollectionEdit.ascx" TagName="StageCollection" TagPrefix="ProcessBlueprint" %>

<script type="text/javascript">

    function FinderCallBackFunction(radwindow) 
    {
        var certificationModuleKey = radwindow.result;
        if (certificationModuleKey)
        {
            var params = window.ComponentActionItemSetParams;
            var url = '<%# ResolveUrl("~/iMIS/CertificationManagement/ComponentEdit.aspx") %>' + 
                '?iNewObject=true' +
                '&iUniformKey=' + certificationModuleKey + 
                '&StageId=' + params.StageId + 
                '&ComponentContainerActionItemId=' + params.ContainerActionItemId + 
                '&OperandIndex=' + params.Index +
                '&iProgramKey=' + params.ProgramKey;
            ShowDialog(url, null, 500, 400, '<%= Asi.ResourceManager.GetPhrase("AddRequirement","Add a Requirement") %>', null, null, ComponentEditCallBackFunction);
        }
   }
   
   function CertificationOpenFinderAdder(stageId, containerActionItemId, index, programKey)
   {
        window.ComponentActionItemSetParams = {
            StageId:stageId, 
            ContainerActionItemId:containerActionItemId, 
            Index:index,
            ProgramKey:programKey
        };
        OpenFinderAdder(FinderCallBackFunction, true, null, '$/CertificationManagement/DefaultSystem/Queries/CertificationModule/CertificationModuleList');
   }
   
    function ComponentEditCallBackFunction(radwindow)
    {
       var params = radwindow.AddComponentParams;
       if (params)
       {
           var hiddenResult = document.getElementById('<%# HiddenResult_AddComponentActionItem.ClientID %>');
           hiddenResult.value = 
               params.CertificationModuleKey + ";" +
               params.StageId + ";" + 
               params.ComponentActionItemId + ";" + 
               params.Index + ";" +
               params.NumberOfUnits;
           document.forms[0].submit();
       }
    }
    
    function Lister2_DialogWindowClose(radwindow)
    {
       var params = radwindow.EditComponentParams;
       if (params)
       {         
           var hiddenResult = document.getElementById('<%# HiddenResult_EditComponentActionItem.ClientID %>');
           hiddenResult.value = params.ActionItemId + ";" + params.NumberOfUnits;
           document.forms[0].submit();
       }
    }

</script>

<input type="hidden" id="HiddenResult_AddComponentActionItem" runat="server" />
<input type="hidden" id="HiddenResult_EditComponentActionItem" runat="server" />
<input type="hidden"  id="HiddenResult_MarkIsDirty" runat="server" />

<asiweb:PanelTemplateControl2 ID="PnlRequirements" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="20em" BorderStyle="None">
        <div class="PanelField AutoWidth">
            <asiweb:SmartControl ID="cbStageOrder" BoundPropertyName="StagesInOrder" DisplayCaption="true" DisplayType="EditableField" runat="server" PositionCaption="Right" Height="18px" AutoPostBack="True" />
        </div>
        <div class="PanelField">
            <asiweb:StyledButton ID="btnDefineCompletionStage" runat="server" />
        </div>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>
<ProcessBlueprint:StageCollection ID="stageCollection" NoteActionItemIncluded="false" IsCertificationProcess="True" runat="server" />
<asiweb:StyledLabel ID="LblNewCertificationProgramWarning" runat="server" CssClass="Error"></asiweb:StyledLabel>