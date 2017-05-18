<%@ Import namespace="Asi"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.ComponentActionItemSetSummary" Codebehind="ComponentActionItemSetSummary.ascx.cs" %>

<%-- 
    I set AjaxEnabled="false" because if this property is set to true, the Lister2 adds an UpdatePanel.
    And an error like "Cannot unregister UpdatePanel..." happens when add a control dynamically with UpdatePanels.
--%>

<table>
    <tr>
        <td class="PanelTablePrompt"><asiweb:StyledLabel id="lblSet" Text='<%# GetSetNumber() %>' runat="server" /></td>
        <td><asiweb:StyledImageButton id="btnDelete" runat="server" IconStyle="Remove" OnClick="btnDeleteClick" Visible='<%# AllowDelete %>' AlternateText="Delete" /></td>
    </tr>
</table>
<asiweb:Lister2 id="lstComponent"
        runat="server" Title=""

        AjaxEnabled="false"
        SortingEnabled="true" 
        PagingEnabled="false"
        ColumnReorderingEnabled="false" 
        GroupingEnabled="false" 
        EnableViewState="True"        
        Width="99%"

        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/CertificationModule/CertificationModuleListToCPRequirement"

        DisableLoadingQueryFromCache="true"
        AddButtonLocation="TopRight" 
        AddButtonText='<%# ResourceManager.GetPhrase("CertificationManagement.AddRequirement", "Add a Requirement") %>'
        DeleteColumnText="remove"
        
        DeleteColumnLocation="End" 
        EnableClientSideDelete="True"
        EditColumnLocation="None"
        ExportButtonLocation="None"
        DisplayPropertiesList="Name,Description"
    
        TargetUrl="~/iMIS/CertificationManagement/ComponentEdit.aspx"
        UseUniformKey="true"
        LinkTargetWindowType="Modal"
        LinkTargetBehavior="NewWindowEachLink"
        MinimumQueryRepeatTime="15"

        OnPreEvaluateQuery="lstComponentPreEvaluateQuery" 
        OnItemCreated="lstComponentItemCreated"
        
        SelectColumnLocation="None"
        LinkProperty="Name"
        DisableQueryEdit="true"
    />