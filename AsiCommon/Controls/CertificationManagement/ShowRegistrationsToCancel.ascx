<%@ Import namespace="Asi.Web.UI.WebControls"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CertificationManagement_ShowRegistrationsToCancel" Codebehind="ShowRegistrationsToCancel.ascx.cs" %>


<asiweb:PanelTemplateControl runat="server" ID="MainPanel" ExpandedText="Choose registrant" Collapsible="false">

    
<div style="width:97%">
	<asiweb:Lister2 id="Lister1"
	  runat="server" 
	  AjaxEnabled="true" 
	  AddButtonLocation="TopRight"
	  LinkTargetBehavior="SameWindow"
	  DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/RegistrantSearch/"
	
	  ColumnReorderingEnabled="false"
	  AddButtonEnabled="false"
	      SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
     

        DeleteColumnLocation="End"
        TargetUrl="~/iMIS/CertificationManagement/RedirectToSummary.aspx"
     
        EditColumnLocation="None"

        SelectColumnLocation="Beginning"

	  
	 />
</div>



</asiweb:PanelTemplateControl>

