<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BOA.BOAMain" Codebehind="BOAMain.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/BOA/boaobjectdefinition.ascx" TagPrefix="asi" TagName="definition" %>
<%@ Register Src="~/AsiCommon/Controls/BOA/boaproperties.ascx" TagPrefix="asi" TagName="properties" %>
<%@ Register Src="~/AsiCommon/Controls/BOA/boaobjectphysical.ascx" TagPrefix="asi" TagName="database" %>

<asp:hiddenfield runat="server" id="DocumentKeyField" ClientIDMode="static"/>

<asiweb:PanelTemplateControl2 runat="server" BorderStyle="None" Collapsible="false" id="BOAMainPanel" ShowHeader="false">
    <div id="BOATitlePanel">
        <div class="FloatLeft VAlignMiddle">
            <span class="PanelTitle"><asp:Label id="ObjectTitle" runat="server" /></span>
        </div>
        <span class="FloatRight VAlignMiddle">
            <asiweb:StyledButton ID="PublishButton" runat="server" Text="Publish" OnClientClick="BOATask('PublishBranch');" AutoPostBack="false" />
        </span>
    </div>     
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false">
        <Tabs>
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
            <telerik:RadTab Text="Properties" PageViewID="PropertiesPage" />
            <telerik:RadTab Text="Database" PageViewID="DatabasePage" />
        </Tabs>
    </telerik:RadTabStrip>    
    
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px;" >
        <telerik:RadPageView runat="server" ID="DefinitionPage">                               
            <asi:definition ID="DefinitionControl" runat="server" OnObjectCreated="Definition_ObjectCreated" />                                               
        </telerik:RadPageView>  
        <telerik:RadPageView runat="server" ID="PropertiesPage">                     
            <asi:properties id="PropertiesControl" runat="server" />                            
        </telerik:RadPageView>  
        <telerik:RadPageView runat="server" ID="DatabasePage">                       
            <asi:database ID="DatabaseControl" runat="server" OnPhysicalDefinitionChanged="Database_PhysicalDefinitionChanged" />                               
        </telerik:RadPageView>                             
    </telerik:RadMultiPage> 
                     
</asiweb:PanelTemplateControl2>

<script id="asicustom" type="text/javascript">
    function BOATask(operation) {
        var documentKey = document.getElementById('DocumentKeyField').value;
        var documentName = '<%= Branch != null ? Branch.Name : string.Empty %>';
        var emptyGuid = '<%= Guid.Empty.ToString() %>';
        if (documentKey != emptyGuid) {
            var url = "<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Controls/BSA/ObjectBrowserTasks.aspx?<%= Asi.Web.UI.DisplayPageBase.PageOperationToken %>=<%= Asi.Web.UI.PageOperation.Publish.ToString() %>&SubOperation=" + operation + "&iCount=1&TemplateType=E&Branch=" + documentName + "&hkey=" + gHKey;
            ShowDialog(url, documentKey, 750, 550, operation, null, "E", null);
        }
        else
            alert('Please save your work before compiling or publishing');
    }
    pageLoad();
    function pageLoad() {
        var $ = $telerik.$;
        var height = $(window).height();
        var multiPage = $find("<%=RadMultiPage1.ClientID %>");
        var totalHeight = height - 200;
        if (document.referrer.indexOf(document.location.href) == 0)
            totalHeight = height - 150;        
        if (multiPage != null)
            multiPage.get_element().style.height = totalHeight + "px";
    }
</script>