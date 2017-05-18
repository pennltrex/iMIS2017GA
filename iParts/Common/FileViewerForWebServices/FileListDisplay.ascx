<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileListDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.FileViewerForWebServices.FileListDisplay" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>


<asp:Label ID="ErrorLabel" runat="server"  CssClass="Error"></asp:Label>
<asp:Label ID="InfoLabel" runat="server"  CssClass="Info"></asp:Label>

<!--<h3>Available Import Batches</h3>-->
<asiweb:Lister2 ID="Lister1" runat="server" 
    PagerMode="Advanced" PageSize="20" 
    SelectColumnLocation="End" 
    SelectMode="true"
    SelectColumnText="Process"
    EnableClientSideDelete="false"
    EnableViewState="true"
    
    LinkPropertyTargetBehavior="RaiseEvent"
    
    LinkTargetBehavior="RaiseEvent" 
    DataKeyNames="BatchId"
    DisplayPropertiesList="Name,DateCreated"
    DisplayPropertiesTitleOverride="Batch Name,Date Created" >
 
</asiweb:Lister2>
