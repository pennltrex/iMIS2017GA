<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Asi.Soa.Core.DataContracts" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Telerik.Web.UI" %>
<%@ Import Namespace="Asi.QueryBuilder" %>
<%@ Import Namespace="Asi" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        GetRunItem();
    }

    private string RunNumber
    {
        get { return Request.Params["RunNumber"]; }
    }
    
    private void LogDetailsLister_OnPreEvaluateQuery(object sender, ListerEventArgs2 e)
    {
        Query query = e.Query;
        QueryFilterSet filterSet = query.FilterSets.Add();

        string sourceQualifiedName = query.Sources[0].QualifiedName;
        QueryFilter filter = filterSet.Filters.Add(sourceQualifiedName, "RunNumber");
        filter.Comparison = ComparisonType.Equal;
        filter.Value = RunNumber;
    }

    private void GetRunItem()
    {
        QueryData query = new QueryData("ExpiredMemberUpdateLog");
        query.AddCriteria(CriteriaData.Equal("RunNumber", RunNumber));
        FindResultsData results = EntityManager.Find(query);
        var runItem = results.Result.Cast<GenericEntityData>().FirstOrDefault();
        if (runItem != null)
        {
            UserLabel.Text = runItem["UserId"].ToString();
            StatusLabel.Text = runItem["Status"].ToString();
            StartLabel.Text = runItem["Start"].ToString();
            EndLabel.Text = runItem["End"] != null ? runItem["End"].ToString() : "";
            MembersUpdatedLabel.Text = runItem["MembersUpdated"].ToString();
            ErrorsLabel.Text = runItem["Errors"].ToString();
        }
    }


</script>

<asp:content runat="server" contentplaceholderid="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl" runat="server" Collapsible="false" Text="Manage expired members" >
    <div runat="server" id="OptionsPanel" class="panel-body" translate="yes">
        <div class="PanelField">
			<asiweb:StyledLabel runat="server" ID="UserLabel" Caption="User" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
		</div>
        
        <div class="PanelField">
			<asiweb:StyledLabel runat="server" ID="StatusLabel" Caption="Status" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
		</div>
        
        <div class="PanelField">
			<asiweb:StyledLabel runat="server" ID="StartLabel" Caption="Start" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
		</div>

        <div class="PanelField">
			<asiweb:StyledLabel runat="server" ID="EndLabel" Caption="End" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
		</div>
        
        <div class="PanelField">
			<asiweb:StyledLabel runat="server" ID="MembersUpdatedLabel" Caption="Members updated" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
		</div>
        
        <div class="PanelField">
			<asiweb:StyledLabel runat="server" ID="ErrorsLabel" Caption="Errors" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
		</div>
        <asiweb:Lister2 
            runat="server" 
            ID="LogDetailsLister" 
            Title="" 
            ExportButtonLocation="None" 
            EditColumnLocation="None"
            DeleteColumnLocation="None" 
            EnableClientSideDelete="false"
            PageSize="10"
            PagingEnabled="True" 
            DataKeyNames="RunNumber,RunItemNumber"  
            DisplayPropertiesList="ID,Name,PreviousStatus,CurrentStatus,PreviousMemberType,CurrentMemberType" 
            DataSourceDocumentPath="$/Membership/DefaultSystem/Queries/ExpiredMemberUpdateDetailLog"
            
            OnPreEvaluateQuery="LogDetailsLister_OnPreEvaluateQuery"

            DisableQueryEdit="True"
             
            AllowRowSelecting="False"
            SelectMode="False"
            SelectMultipleEnabled="False"
            AllowGridRowSelectStyle="False"
            />
        </div>
    </asiweb:PanelTemplateControl2>
</asp:content>
