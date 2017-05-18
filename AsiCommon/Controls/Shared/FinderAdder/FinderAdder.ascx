<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.FinderAdder.FinderAdder" Codebehind="FinderAdder.ascx.cs" %>
<%@ Import Namespace="System.Globalization" %>

<script type="text/javascript">
//<![CDATA[
function SelectAndReturnValue(rowKey){               
    if (<%= DialogMode.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>){
        var oWindow = GetRadWindow();      	       
        var lister = $('<%= Lister1.ClientID %>');	    	        
        var result = lister.GetSelectedKeys();
        
        // Override GRID selection with passed in value:
        if (rowKey != null && rowKey != "") {
            var myres = new Array();
            myres[0] = rowKey;
            result = myres;
        }
            
        var grid = Lister2_GetGrid(lister);
        // Select clicked row - Because we are override select
        if (grid != null && grid.MasterTableView.get_dataItems() != null && grid.MasterTableView.get_dataItems().length != null && grid.MasterTableView.get_clientDataKeyNames() != null) {
            var keycol = grid.MasterTableView.get_clientDataKeyNames()[0];
            grid.MasterTableView.clearSelectedItems();
            for (var i = 0; i < grid.MasterTableView.get_dataItems().length; i++) {
                if (grid.MasterTableView.get_dataItems()[i] != null && grid.MasterTableView.get_dataItems()[i].getDataKeyValue(keycol) == rowKey) {
                    grid.MasterTableView.get_dataItems()[i].set_selected(true);
                    break;
                }
            }
        }
        
        if (result){
            var displayColumn = '<%= DisplayValueColumn %>';
            if (displayColumn.length > 0 && displayColumn != 'null'){
                var displayResult = lister.GetSelectedDisplayValues(displayColumn);
                oWindow.SelectedDisplayValues = displayResult;
            }              
            oWindow.result = result;
            oWindow.Close();
        }
    }
} 
//]]>
</script>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server" />
<asiweb:Lister2 id="Lister1" runat="server" AjaxEnabled="true" AddButtonLocation="None" translate ="yes"
    LinkTargetBehavior="SameWindow" OnNeedDataSource="Lister1_NeedDataSource" 
    OnItemSelected="Lister1_ItemSelected" OnPreEvaluateQuery="Lister1_PreEvaluateQuery" Width="100%" />