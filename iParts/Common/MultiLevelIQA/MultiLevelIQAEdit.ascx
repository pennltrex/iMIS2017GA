<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiLevelIQAEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.MultiLevelIQA.MultiLevelIQAEdit" %>
<%@ Import Namespace="Asi"%>

<script language="javascript" type="text/javascript">

    // grabs the selection from the Document selector popup and
    // sets our local vareiables
    function BSABrowserCallback(window)
    {
        if (!window.result)
            return;

        // we cant for some reason inject some c# code here. So in the code behind (method RegisterScripts()) i've created javascript params (alias)
        // with the same name as our controls in design time, but which store the asp.net generated ClientID, i.e. the ide you see in the markup.
        document.getElementById(SelectedIQAQueryKey).value = window.result;
        document.getElementById(IQAQuery).innerText = window.SelectedDocumentPath;

    }
 
</script>

<input type="hidden" id="SelectedIQAQueryKey" runat="server" name="SelectedIQAQueryKey"  />

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" />
            

    <asiweb:SmartControl ID="IQAQuery" runat="server" BoundPropertyName="IQAQueryPath" DisplayCaption="true" ReadOnly="true" >      
        <div id="pathButtonBreak">
        <asiweb:StyledButton ID="SelectFolder" Text='<%#ResourceManager.GetWord("Select") %>' runat="server" AutoPostBack="false" 
                OnClientClick="OpenObjectBrowser('DocumentPath=$&iShowFolderTree=1&iAllowUpwardNavigation=1&iTypeFilter=IQD',BSABrowserCallback);" />
       <asiweb:StyledButton ID="ClearSelectedIQAQuery" Text='<%#ResourceManager.GetWord("Clear") %>' CausesValidation="false" runat="server" AutoPostBack="true" 
             OnClick="ClearSelectedIQAQuery_Click"  /> 
        </div>    
    </asiweb:SmartControl>
    <asiweb:SmartControl 
        ID="ShowQueryPathControl" runat="server" BoundPropertyName="ShowQueryPath" 
        DisplayCaption="true" PositionCaption="Right" />
                  
    </div>    
 </asiweb:paneltemplatecontrol>
