<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryMenuDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Common.QueryMenu.QueryMenuDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <div class="ClearFix PositionRelative">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="ListerPanel">
            <ProgressTemplate>
                <div class="NotPrinted ProgressDiv Interior" runat="server">
                    <asp:Label runat="server" Text='<%# ResourceManager.GetWord("Loading")%>' translate="yes"/>
                    <asp:Image ID="ProgressImage" runat="server" OnLoad="ProgressImageLoad" AlternateText='<%# ResourceManager.GetWord("Loading")%>' />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:Panel runat="server" ID="SelectContainer" CssClass="PanelField Left AddPadding" translate="yes"/>
    </div>
     <asp:UpdatePanel ID="ListerPanel" runat="server" translate="yes">
        <ContentTemplate>
            <asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>
            <asiweb:Lister2 ID="ResultsGrid" runat="server" AjaxEnabled="false" SortingEnabled="true"
                PagingEnabled="true" ColumnReorderingEnabled="false" EnableClientSideDelete="false"
                EditColumnLocation="None" SelectColumnLocation="None" DeleteColumnLocation="None"
                AddButtonEnabled="false" DisableQueryEdit="true" OnNeedDataSource="ResultsGrid_NeedDataSource"
                OnItemDataBound="ResultsGrid_ItemDataBound" CollapsiblePanelTemplate="false" />
            <div id="errorLabel" runat="server" class="iMISUserMessageInformation"></div>
            <asp:Panel ID="MapPanel" Visible="true" runat="server">
                <%--Place for Google to show the map--%>
                <div id="map_canvas" class="MapCanvas"></div>
            </asp:Panel>
            <div runat="server" id="DivEmail" class="AlignRight GridFooterPanel">
                <asiweb:StyledButton runat="server" ID="ButtonEmail" Text="Email"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>

<script type="text/javascript">
    //<![CDATA[
    // Create the event handlers for PageRequestManager
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    //fix for hitting back button in FF and button was disabled
    jQuery(document).ready(function () {
        var findButton = jQuery('input[id$=SubmitButton]');
        if (findButton !== 'undefined') {
            findButton.removeAttr("disabled");
        }
            var grid = jQuery("#<%#ResultsGrid.ClientID%>");
        var gridHeight = grid.outerHeight();
        var dropdownHeight = jQuery("#<%#ResultsGrid.ClientID%> .dropdown-menu.dropdown-menu-right").outerHeight();
        if (gridHeight <= dropdownHeight) {
            grid.css('overflow', 'inherit');
        }

    });
    prm.add_initializeRequest(PageRequestManager_initializeRequest);
    prm.add_beginRequest(PageRequestManager_beginRequest);
    prm.add_endRequest(PageRequestManager_endRequest);

    var uiId = '';
    function PageRequestManager_initializeRequest(sender, args) {
        if (sender.get_isInAsyncPostBack()) {
            args.set_cancel(true);
        }
    }
    function PageRequestManager_beginRequest(sender, args) {
        var postbackElem = args.get_postBackElement();
        uiId = postbackElem.id;
        postbackElem.disabled = true;
    }
    function PageRequestManager_endRequest(sender, args) {
        EndRequest();
        var postBackFieldId = $get(uiId);
        if (postBackFieldId != null && postBackFieldId != 'undefined')
            postBackFieldId.disabled = false;
        if (args.get_error() != undefined) {
            var error = args.get_error().name;
            if (error != 'undefined' && error == 'Sys.WebForms.PageRequestManagerServerErrorException')
                args.set_errorHandled(true);

            document.getElementById(uiId).focus();
        }
    }
    //Runs mapping javascript after panel has been asynchronously updated
    function EndRequest() {
        if (typeof(initializeMap) == 'function') {
            initializeMap();
        }
    }

        // Executes when a query is clicked in the select menu.    
        // Add or replace the selected query key in the url query string, and reload the page.
    function querySelect(paramName, queryId) {
            var newlocation = "";
            var hash = window.location.hash; //need to check for anchors/hashtags and handle them carefully
            //var paramName = "QueryMenuSelectedKey" + listerId;
            if (window.location.search.length == 0)
            {
                newlocation = window.location + "?" + paramName + "=" + queryId;
            }
            else
            {
                // Add the key to the query string, or replace it if it already exists in the query string
                var queryString = window.location.search.substring(1);
                var paramPairs = queryString.split("&");
                var newQueryString = "";
                var isFound = new Boolean(false);
                for (var i=0;i<paramPairs.length;i++)
                {
                    if (newQueryString.length > 0)
                        newQueryString += "&";
                    var pair = paramPairs[i].split("=");
                    if (pair[0] == paramName)
                    {
                        newQueryString += paramName
                        + "=" + queryId;
                        isFound = true;
                    }
                    else
                    {
                            newQueryString += paramPairs[i];
                    }
                }
                if (isFound == false) {
                    // Param wasn't in query string, add it.
                    if(hash.length == 0)
                    {
                        newlocation = window.location + "&" +
                        paramName + "=" + queryId;
                    }
                    else
                    {
                        var url = window.location.href.substring(0, window.location.href.indexOf("?"));
                        newlocation = url + "?" + newQueryString + "&" +
                        paramName + "=" + queryId + hash;
                    }
                }
                else
                {
                    var url = window.location.href.substring(0, window.location.href.indexOf("?"));
                    newlocation = url + "?" + newQueryString + hash;
                }                                                      
            }
        window.location = newlocation;
    }

    //]]>
</script>