<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_Main_WebPartCatalog" Title="Content gallery" Codebehind="WebPartCatalog.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <script type="text/javascript">
        function OnFailed(error) 
        {
            ShowMessage(error.get_message(), true, 5000);
            document.body.style.cursor = 'default';
        }
        var timerId = null;
        function ShowMessage(message, isError, timeout) 
        {
            if (timerId != null)
                window.clearTimeout(timerId);

            var messageBlock = document.getElementById('Message');
            messageBlock.innerText = message;
            messageBlock.style.display = 'block';
            if (isError)
                messageBlock.className = 'ErrorMessage';
            else
                messageBlock.className = 'Message';

            if (timeout)
                timerId = window.setTimeout("HideMessage()", timeout);
        }
        function HideMessage() 
        {
            var message = document.getElementById('Message');
            message.style.display = 'none';
        }
    </script>
    <div id="Message" class="Message" style="display:none;">&nbsp;</div>
    <asi:ObjectBrowser ID="NavigationItemBrowser" 
        runat="server" 
        ShowAddress="false"
        Text="" 
        Mode="SelectContent" 
        TypeFilter="FOL,RCT" 
        RootFolder="$/ContentManagement/DefaultSystem/ContentTypes"
        AllowUpwardNavigation="false" 
        PublishedOnly="false"
        ShowSummary="false" 
        ShowDescription="true"
        ShowNonContainersInHierarchyTree="false" 
        AllowMultiSelect="false"
        AutoSelectFirstDocument="true"
        ColorAlternatingLines="true"
        />
    
    <div style="clear:both;"></div>

    <div data-height-offset="true">
        <div runat="server" id="WebPartPathPrompt"></div> 
        <asp:TextBox ID="PathToControl" runat="server" CssClass="FullWidth"/>
        <ajaxToolkit:AutoCompleteExtender ID="PathToControlAutoComplete" runat="server" TargetControlID="PathToControl" 
            CompletionInterval="100" ServiceMethod="GetWebUserControls" ServicePath="~/iMIS/ContentManagement/ContentItemEdit.aspx" 
            FirstRowSelected="true" CompletionListCssClass="CompletionList"/>
    </div>  
    
    <div style="clear:both;"></div>

    <script type="text/javascript">
        function resetPosition(sender, args) 
        {
            var el = sender._completionListElement;
            if (el)
            {
                var tb = $get('<%= PathToControl.ClientID %>');
                var location = window.$common.getLocation(tb);
                var size = window.$common.getBounds(el);
                var newLocation = new Sys.UI.Point(location.x, location.y - size.height);
                window.$common.setLocation(el, newLocation);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Buttonbar" ContentPlaceHolderID="TemplateButtonBar" runat="server">
<script type="text/javascript">
    function SelectAndReturnValue()
    {
        var path = document.getElementById('<%= PathToControl.ClientID %>');
        if (path.value.length > 0)
        {
            PassAlongResults(path.value, null);
            return;
        }
        var rows = window.objectBrowserClass.GetSelectedRows();
        if (rows.length > 0) {
            var key = window.objectBrowserClass.DocumentObjectFromRow(rows[0]).DocumentVersionKey;
            window.PageMethods._staticInstance.GetWebPartPathsFromContentType(key, PassAlongResults, OnFailed);
        } else
            <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>.Close();
    }
    function PassAlongResults(results, eventArgs)
    {
        var paths = new Array();
        paths[0] = results;
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        oWindow.result = paths;
        oWindow.Close();
    }
    </script>
</asp:Content>