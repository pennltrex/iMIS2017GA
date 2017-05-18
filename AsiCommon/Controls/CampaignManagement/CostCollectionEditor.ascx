<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_CostCollectionEditor" Codebehind="CostCollectionEditor.ascx.cs" %>
<script type="text/javascript">
var expanded = false;
var expandImage = '<%#Asi.Web.Utilities.GetIconPath(Asi.Web.Utilities.IconStyle.Expand)%>';
var collapseImage = '<%#Asi.Web.Utilities.GetIconPath(Asi.Web.Utilities.IconStyle.Collapse)%>';
function toggleCostCollectionEditor()
{
    var costCollectionEditor = document.getElementById("CostCollectionEditor");
    var toggleImg = document.getElementById("ToggleImg");
    if(expanded){
        costCollectionEditor.style.display = "none";
        toggleImg.src = expandImage;
        expanded = false;    
    }else{
        costCollectionEditor.style.display = "block";       
        toggleImg.src = collapseImage;
        expanded = true;
    }  
}

function RemoveCostCollectionRow(index)
{
    var costCollectionTable = document.getElementById("CostCollectionTable");
    costCollectionTable.deleteRow(index);
    // Indexes may change when deleting, reset them here
    // NOTE: we don't use THEAD, so rows[0] is the header
    for(var i=1;i<costCollectionTable.rows.length;i++)
    {
        var tr = costCollectionTable.rows[i];
        // NOTE: this requires that the Remove link be the FIRST CHILD of the 3rd column
        var a = tr.cells[2].firstChild;
        a.href = "javascript:RemoveCostCollectionRow(" + i + ");";
    }
    CalculateCostCollection();
}

function CalculateCostCollection()
{
    var costCollectionTable = document.getElementById("CostCollectionTable");
    var sb = new Array();
    // from the cs file
    //builder.AppendFormat("{0}={1}|", key, Campaign.CostCollection[key]);
    // NOTE: we don't use THEAD, so rows[0] is the header
    for(var i=1;i<costCollectionTable.rows.length;i++)
    {
        var key = costCollectionTable.rows[i].cells[0].firstChild.value;
        var value = costCollectionTable.rows[i].cells[1].firstChild.value;
        sb.push(key + "=" + value);        
    }
    var costCollectionValue = document.getElementById("<%#CostCollectionValue.ClientID%>");
    costCollectionValue.value = sb.join("|");
    //alert(CostCollectionValue.value);
}

function AddCostCollectionRow()
{
    var costCollectionTable = document.getElementById("CostCollectionTable");
    var tr = costCollectionTable.insertRow(costCollectionTable.rows.length);
    var keyCell = document.createElement("td");
    // give the key and value cell ID's because JS doesn't like events for elements with no ID
    keyCell.innerHTML = "<input id='CCKey" + (costCollectionTable.rows.length - 1) + "' style='width:5em;min-width:3em' onchange='CalculateCostCollection();'>";
    tr.appendChild(keyCell);

    var valueCell = document.createElement("td");
    valueCell.innerHTML = "<input id='CCValue" + (costCollectionTable.rows.length - 1) + "' style='width:5em;min-width:3em' onchange='CalculateCostCollection();'>";
    tr.appendChild(valueCell);
    var removeCell = document.createElement("td");
    // NOTE: we don't use THEAD, so rows[0] is the header
    removeCell.innerHTML = '<a title="<%#Asi.ResourceManager.GetPhrase("Delete","Delete")%>" style="width:5em;min-width:3em;float:right;margin-right:2px;" href="javascript:RemoveCostCollectionRow(' + (costCollectionTable.rows.length - 1) + ');"><%#Asi.ResourceManager.GetPhrase("delete","delete")%></a></td>';
    //alert(tr.innerHTML);
    tr.appendChild(removeCell);
    
}
</script>
<span id="CostCollectionWrapper">
    <asp:HiddenField runat="server" ID="CostCollectionValue" />
    <a href="javascript:toggleCostCollectionEditor()" title="<%#Asi.ResourceManager.GetPhrase("ToggleCostCollection","Show/Hide Cost Collection")%>"><img id="ToggleImg" src='<%#Asi.Web.Utilities.GetIconPath(Asi.Web.Utilities.IconStyle.Expand)%>' alt="Show/Hide Cost Collection" style="border:0;float:none!important;" /></a>
    <asp:Repeater runat="server" ID="CostCollectionsRepeater" DataSource="<%#Campaign.CostCollection.AllKeys%>">
        <HeaderTemplate>
            <div style="display:none" id="CostCollectionEditor">              
		    <table id="Table1" style="width:100%">
		    <tr>
		        <td><a href="javascript:AddCostCollectionRow()" style="float:right;font-size: 11px;">Add</a></td>
		    </tr>
		    </table>
            <table id="CostCollectionTable" class="Grid" style="width:100%">         
            <tr class="GridHeader">
                <td><%#Asi.ResourceManager.GetPhrase("Name","Name")%></td>
                <td><%#Asi.ResourceManager.GetPhrase("Cost","Cost")%></td>
                <td></td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:TextBox runat="server" ID="CostCollectionKey" style="width:5em;min-width:3em" /></td>
                <td><asp:TextBox runat="server" ID="CostCollectionItemEdit" style="width:5em;min-width:3em" /></td>
                <td><asp:HyperLink runat="server" ID="RemoveLink" style="width:5em;min-width:3em;float:right;margin-right:2px;"><%#Asi.ResourceManager.GetPhrase("delete","delete")%></asp:HyperLink></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></table></div></FooterTemplate>
    </asp:Repeater>
</span>