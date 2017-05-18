<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BOA.BOAObjectDefinition" AutoEventWireup="true" Codebehind="BOAObjectDefinition.ascx.cs" %>

<asiweb:PanelTemplateControl2 id="ObjectDefinitionTemplate" runat="server" TemplateTitle="Definition" FieldSet="true" Collapsible="false" ShowHeader="false">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server" LabelWidth="15em" Width="100%">
        <div class="PanelField">
            <asp:label id="NameLabel" runat="server" Text="Name" AssociatedControlID="Name" />
            <div class="PanelFieldValue">
                <asp:textbox id="Name" runat="server" CssClass="InputXLarge" ontextchanged="StateChanged"></asp:textbox>&nbsp;<asp:Label ID="InvalidNameMessage" runat="server" Visible="false" CssClass="Error"></asp:Label>
            </div>
        </div>
        <div class="PanelField AutoWidth FloatNone" id="IsActivePanel" runat="server">
            <asp:CheckBox id="IsActive" runat="server" Text="Active" Checked="True" oncheckedchanged="StateChanged" TextAlign="Right" CssClass="PanelFieldValue" />
        </div>
        <div class="PanelField" runat="server" id="InheritsFromDiv">
            <asp:label id="InheritsLabel" runat="server" Text="Inherits from" AssociatedControlID="InheritsBrowseButton" />
            <div class="PanelFieldValue">
                <asiweb:StyledButton AutoPostBack="false" id="InheritsBrowseButton" onclientclick="SelectDocumentObject()" runat="server" Text="Browse" />
                <asp:ImageButton id="DeleteInherits" SkinID="PanelCommandButtonDelete" style="display:none;" runat="server" OnClientClick="ResetDocumentObject();" ImageAlign="Middle"></asp:ImageButton>
                <asp:label id="InheritsDocumentName" runat="server" />                
                <input id="InheritsDocumentKey" type="hidden" runat="server" />
             </div>
        </div>
        <div class="PanelField" id="ObjectImplementationTypeDiv" runat="server" Visible="false">
            <asp:label id="ObjectImplementationTypeLabel" runat="server" Text="Object type" AssociatedControlID="ObjectImplementationType" />
            <asp:label id="ObjectImplementationType" runat="server" Text="" />
        </div>
        <div class="PanelField">
            <asp:label id="DescriptionLabel" runat="server" Text="Description" AssociatedControlID="Description" />
            <asp:TextBox id="Description" runat="server" TextMode="MultiLine" Rows="5" CssClass="InputXLarge" ontextchanged="StateChanged" />
        </div>
        <div class="PanelFieldValue AutoWidth FloatNone" id="IsPaintablePanel" runat="server" visible="<%# IsScreenDesignerAvailable %>">
            <asp:CheckBox id="IsPaintable" runat="server" Text="Available to screen designer?" oncheckedchanged="StateChanged" TextAlign="Right" CssClass="PanelFieldValue" />
        </div>
        <div ID="DefaultProperties" runat="server" class="PanelField">
            <div class="PanelField">
                <asp:label id="DefaultDisplayPropertyLabel" runat="server" Text="Default display property" AssociatedControlID="DefaultDisplayProperty" />
                <asp:dropdownlist id="DefaultDisplayProperty" runat="server" OnSelectedIndexChanged="StateChanged"></asp:dropdownlist>
            </div>
            <div class="PanelField">
                <asp:label id="DefaultTitlePropertyLabel" runat="server" Text="Default title property" AssociatedControlID="DefaultTitleProperty" />
                <asp:dropdownlist id="DefaultTitleProperty" runat="server" OnSelectedIndexChanged="StateChanged"></asp:dropdownlist>
            </div>
            <div class="PanelField">
                <asp:label id="DefaultDescriptionPropertyLabel" runat="server" Text="Default description property" AssociatedControlID="DefaultDescriptionProperty" />
                <asp:dropdownlist id="DefaultDescriptionProperty" runat="server" OnSelectedIndexChanged="StateChanged"></asp:dropdownlist>
            </div>
        </div>
        <div class="PanelField" runat="server" id="CreateObjectButtonDiv">
            <asp:label id="lbl" runat="server" Text="&nbsp;" AssociatedControlID="CreateObjectButton"></asp:label>
            <div class="PanelFieldValue">
                <asiweb:StyledButton CssClass="PrimaryButton" id="CreateObjectButton" OnClick="CreateObjectButton_Click" runat="server" Text="Create Object" Visible="false" />  
            </div>         
        </div>
        <asiweb:StyledButton id="SecurityEditButton" runat="server" Text="Generate C# Wrapper" Visible="false" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 id="BranchListTemplate" runat="server" TemplateTitle="Branches" Visible="false" Collapsible="false">
    <asp:Repeater id="BranchList" Runat="server">
        <ItemTemplate>
            <asp:Literal ID="Indent" Runat="server"></asp:Literal>
            <asp:HyperLink ID="BranchLink" Runat="server"></asp:HyperLink><br>
        </ItemTemplate>
    </asp:Repeater>
</asiweb:PanelTemplateControl2>

<asp:UpdatePanel ID="PostBackPanel" runat="server" UpdateMode="Conditional">
    <Triggers>
        <asp:PostBackTrigger ControlID="CreateObjectButton" />
    </Triggers>
</asp:UpdatePanel>

<input type="hidden" id="FolderHierarchyKey" runat="server" onserverchange="BusinessObjectSaveAs" name="FolderHierarchyKey" />
<input type="hidden" id="SaveAsFilename" runat="server" name="SaveAsFileName" />

<script id="SelectDocument" type="text/javascript">
    function SelectDocumentObject() {
        OpenObjectBrowser('TypeFilter=BOD&DocumentPath=$/Design Business Object Definition', SetDocumentObject, true);
    }
    function SetDocumentObject(window) {
        if (!window.result)
            return;
        var documentKey = window.result;
        if (documentKey != null && documentKey != "") {
            jQuery('#' + "<%= InheritsDocumentKey.ClientID %>").val(documentKey);
            jQuery('#' + "<%= DeleteInherits.ClientID %>").show();
        }

        var documentName = window.SelectedDocumentName;
        if (documentName != null && documentName != "")
            jQuery('#' + "<%= InheritsDocumentName.ClientID %>").text(documentName);
    }
    function ResetDocumentObject() {
        jQuery('#' + "<%= InheritsDocumentKey.ClientID %>").val('');
        jQuery('#' + "<%= DeleteInherits.ClientID %>").hide();
        jQuery('#' + "<%= InheritsDocumentName.ClientID %>").text('');
    }
    function SaveButton_Click() {
        return true;
    }

    <asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
    function BSABrowserCallback(radWindow) {
        if (!radWindow.result)
            return;
        document.getElementById(FolderHierarchyKeyID).value = radWindow.result;
        document.getElementById(SaveAsFilenameID).value = radWindow.Filename;
        document.getElementById(nameID).value = radWindow.Filename;      
        submitForm(document.getElementById(FolderHierarchyKeyID));
        var oWindow = GetRadWindow();

        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null) {
            oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
        }
        else if (oWindow != null && oWindow.BrowserWindow != null) {
            var browserWin = oWindow.BrowserWindow;
            var fn = new browserWin.Function("sender", "args", "function f(){RefreshRadWindowParent();}");
            oWindow.add_close(fn);
        }
    }
    </script>