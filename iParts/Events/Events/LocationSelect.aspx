<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocationSelect.aspx.cs" Inherits="Asi.Web.iParts.Events.LocationSelect" %>
<%@ Import Namespace="Asi" %>
<%@Register tagPrefix="asiweb" namespace="Asi.Web.UI.WebControls" assembly="Asi.Web"  %>

<asp:Content ContentPlaceHolderID="TemplateBody" ID="ContentPanel" runat="server">     
           
    <asiweb:Lister2 
        HideResultsOnInitialLoad="Visible"
        AddButtonLocation="TopRight" 
        AddLinkTargetBehavior="SameWindow" 
        AddTargetUrl="~/iParts/Events/Events/LocationAdd.aspx"
        AddButtonText="Add location" 
        AjaxEnabled="false" 
        CollapsiblePanelTemplate="false" 
        ColumnReorderingEnabled="false" 
        DeleteColumnLocation="None" 
        DisableQueryEdit="true" 
        EditColumnLocation="None" 
        EnableClientSideDelete="false" 
        ExportButtonLocation="None" 
        ID="LocationsGrid" 
        PagingEnabled="true" 
        runat="server" 
        SelectColumnLocation="None" 
        SortingEnabled="true"
        PagerMode="Simple"
        DataSourceDocumentPath="$/Events/DefaultSystem/Queries/Locations" 
        OnItemDataBound="ItemDataBound"/>          
   
    <script type="text/javascript">
         //<![CDATA[
         // close the dialog
         function CloseDialog(action, addressId) {
             var w = GetRadWindow();
             if (w == null) return;
             var r = ConstructResultsObject();
             r.Action = action;
             r.AddressId = addressId;
             w.AsiResults = r;
             w.Close();
         }

         // called when an location is selected and ChooseAddressMode==Party
         function UseAddress_Party(addressId) {
             CloseDialog("AddressSelected", addressId);
         }

         // construct the return object
         function ConstructResultsObject() {
             return { AddressId: "", Action: "" };
         }

         function LocationCallback(window) {
             var iframe = window.get_contentFrame();
             if (iframe == null)
                 return;
         }
         //]]>
    </script>    
</asp:Content>
