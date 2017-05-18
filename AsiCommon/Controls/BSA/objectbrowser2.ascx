<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.BSA.ObjectBrowser" CodeBehind="objectbrowser2.ascx.cs" AutoEventWireup="True" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.Common.BSA" TagPrefix="asimenu" %>

<div runat="server" id="ObjectBrowserWrapper" class="ObjectBrowserWrapper">
    
    <input type="hidden" name="SelectedKeys" id="SelectedKeys" />
    <input type="hidden" name="HierarchyAddType" id="HierarchyAddType" />
    <input type="hidden" name="Clipboard" id="Clipboard" value='' /><%--<%= Request.Form["Clipboard"] != null ? Request.Form["Clipboard"] : "" %>--%>
    <input type="hidden" name="DocumentTypeClipboard" id="DocumentTypeClipboard" value='' />
    <input type="hidden" name="ClipboardCutCopy" id="ClipboardCutCopy" value='' /><%--<%= Request.Form["ClipboardCutCopy"] != null ? Request.Form["ClipboardCutCopy"] : "" %>--%>
    <input type="hidden" name="ConflictResolution" id="ConflictResolution" value='' />
    <%-- Copy (rename) document hidden field --%>
    <input type="hidden" name="NewDocName" id="NewDocName" runat="server" value='' />

    <asp:Button CssClass="hidden" ID="RefreshFolderButton" runat="server" OnClick="RefreshFolderButton_Click" Text="Refresh Folder" />
    <asp:Button CssClass="hidden" ID="CopyObjectsButton" runat="server" OnClick="CopyObjectsButton_Click" Text="Copy Objects" />
    <asp:Button CssClass="hidden" ID="MoveObjectsButton" runat="server" OnClick="MoveObjectsButton_Click" Text="Move Objects" />
    <asp:Button CssClass="hidden" ID="UpdateMenuButton" runat="server" OnClick="UpdateMenuButton_Click" Text="Update Menu" />
    <asp:Button CssClass="hidden" ID="SelectRowButton" runat="server" OnClick="SelectRowButton_Click" Text="Select" />
    <asp:Button CssClass="hidden" ID="SelectNodeButton" runat="server" OnClick="SelectNodeButton_Click" Text="Select Node" />
    <asp:Button CssClass="hidden" ID="SelectNodeCollapsedButton" runat="server" OnClick="SelectNodeCollapsedButton_Click" Text="Select Node Leave Collapsed" />

    <asp:Panel ID="MenuPane" runat="server" CssClass="MenuPane FullWidth ClearFix">

        <asp:UpdatePanel ID="MenuUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">

            <ContentTemplate>
                <div runat="server" id="ObjectBrowserMenuDiv" translate="yes">
                    <asimenu:ObjectBrowserMenu ID="MainMenu" runat="server" OnClientItemClicked="function(sender, args){ objectBrowserClass.MenuClick(sender, args); }" EnableAutoScroll="true">
                        <Items>
                            <asimenu:ObjectBrowserMenuItem runat="server" id="OrganizeMenuItem" Text="Organize" ShowIcon="false">
                                <GroupSettings />
                                <Items>
                                    <asimenu:ObjectBrowserMenuItem id="RefreshMenuItem" Text="Refresh" runat="server" MenuItemAction="Refresh" />
                                    <asimenu:ObjectBrowserMenuItem id="Separator1" runat="server" IsSeparator="true" />
                                    <asimenu:ObjectBrowserMenuItem id="CutMenuItem" runat="server" Text="Cut" MenuItemAction="Cut" />
                                    <asimenu:ObjectBrowserMenuItem id="CopyMenuItem" runat="server" Text="Copy" MenuItemAction="Copy" />
                                    <asimenu:ObjectBrowserMenuItem id="PasteMenuItem" runat="server" Text="Paste" MenuItemAction="Paste" />
                                    <asimenu:ObjectBrowserMenuItem id="UndoMenuItem" runat="server" Text="Undo" Value="undo" MenuItemAction="Undo" Visible="false" />
                                    <asimenu:ObjectBrowserMenuItem id="Separator2" runat="server" IsSeparator="true" />
                                    <asimenu:ObjectBrowserMenuItem id="SelectAllMenuItem" runat="server" Text="Select All" MenuItemAction="SelectAll" ShowIcon="false" />
                                    <asimenu:ObjectBrowserMenuItem id="Separator3" runat="server" IsSeparator="true" />
                                    <asimenu:ObjectBrowserMenuItem id="LayoutMenuItem" runat="server" Text="Layout" Visible="false">
                                        <Items>
                                            <asimenu:ObjectBrowserMenuItem id="LayoutStandardMenuItem" runat="server" Text="Standard" />
                                            <asimenu:ObjectBrowserMenuItem id="LayoutPreviewMenuItem" runat="server" Text="Preview" />
                                        </Items>
                                    </asimenu:ObjectBrowserMenuItem>
                                    <asimenu:ObjectBrowserMenuItem id="FolderAndSearchOptionsMenuItem" runat="server" Text="Folder and Search Options" Visible="false" />
                                    <asimenu:ObjectBrowserMenuItem id="Separator4" runat="server" IsSeparator="true" Visible="false" />
                                    <asimenu:ObjectBrowserMenuItem id="RequestDeleteMenuItem" runat="server" Text="Request Delete" SupportedDocumentTypes="CON,WST" MenuItemAction="RequestDelete" />
                                    <asimenu:ObjectBrowserMenuItem id="DeleteMenuItem" runat="server" Text="Delete" MenuItemAction="Delete" />
                                    <asimenu:ObjectBrowserMenuItem id="PurgeMenuItem" runat="server" Text="Purge" ToolTip="Permanently delete selected items" MenuItemAction="Purge" ShowIcon="false" />
                                    <asimenu:ObjectBrowserMenuItem id="PurgeAllMenuItem" runat="server" Text="Empty the Recycle Bin" ToolTip="Permanently delete all recycled items" MenuItemAction="PurgeAll" ShowIcon="false" Visible="false" />
                                    <asimenu:ObjectBrowserMenuItem id="PropertiesMenuItem" runat="server" Text="Properties" MenuItemAction="Select" ShowIcon="false" />
                                    <asimenu:ObjectBrowserMenuItem id="Separator5" runat="server" IsSeparator="true" />
                                    <asimenu:ObjectBrowserMenuItem id="SummaryPaneItem" runat="server" Text="Hide Summary" ToolTip="Display the summary pane when available" ShowIcon="false" />
                                </Items>
                            </asimenu:ObjectBrowserMenuItem>
                            <asimenu:ObjectBrowserMenuItem id="NewMenuItem" runat="server" Text="New" ShowIcon="false" MenuItemAction="New" />
                            <asimenu:ObjectBrowserMenuItem id="EditMenuItem" runat="server" Text="Edit" MenuItemAction="Edit" />
                            <asimenu:ObjectBrowserMenuItem id="ImportMenuItem" runat="server" Text="Import" MenuItemAction="Import" />
                            <asimenu:ObjectBrowserMenuItem id="ExportMenuItem" runat="server" Text="Export" MenuItemAction="Export" />
                            <asimenu:ObjectBrowserMenuItem id="VersionsMenuItem" runat="server" Text="Versions" MenuItemAction="Versions" />
                            <asimenu:ObjectBrowserMenuItem id="RunMenuItem" runat="server" Text="Run" MenuItemAction="Execute" Visible="true" NonSupportedDocumentTypes="FOL,LAY,NAV,RCT,TCT,WEB" />
                            <asimenu:ObjectBrowserMenuItem id="DownloadMenuItem" runat="server" Text="Download" MenuItemAction="Download" NonSupportedDocumentTypes="APC,APP,BOD,BUS,CFL,COM,CON,COP,CTY,DBB,DBO,DBS,IQD,LAY,MEA,MEP,NAV,NPE,OP2,OPP,POS,RCT,RFA,RFM,SLP,SPE,SRT,WEB,WFD,XPE" />
                            <asimenu:ObjectBrowserMenuItem id="SubmitMenuItem" runat="server" Text="Submit for Approval" MenuItemAction="Submit" SupportedDocumentTypes="CON,WST" />
                            <asimenu:ObjectBrowserMenuItem id="PublishMenuItem" runat="server" Text="Publish" MenuItemAction="Publish" />
                            <asimenu:ObjectBrowserMenuItem id="PreviewMenuItem" runat="server" Text="Preview" MenuItemAction="Preview" SupportedDocumentTypes="CON,DOC,GIF,HTM,JPE,JPG,NAV,PDF,PNG,PPT,RTF,TCT,TXT,WEBL,WMV,XML,ZIP" />
                            <asimenu:ObjectBrowserMenuItem id="SearchMenuItem" runat="server" Text="Search" MenuItemAction="Search" Visible="false" />
                            <asimenu:ObjectBrowserMenuItem id="ViewsMenuItem" runat="server" Text="Views" Visible="false">
                                <Items>
                                    <asimenu:ObjectBrowserMenuItem id="ViewsDetailMenuItem" runat="server" Text="Detail" />
                                    <asimenu:ObjectBrowserMenuItem id="ViewsListMenuItem" runat="server" Text="List" />
                                </Items>
                            </asimenu:ObjectBrowserMenuItem>
                        </Items>
                    </asimenu:ObjectBrowserMenu>
                </div>
            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="SelectNodeButton" />
                <asp:AsyncPostBackTrigger ControlID="SelectNodeCollapsedButton" />
                <asp:AsyncPostBackTrigger ControlID="UpdateMenuButton" />
                <asp:AsyncPostBackTrigger ControlID="RefreshFolderButton" />
                <asp:AsyncPostBackTrigger ControlID="CopyObjectsButton" />
                <asp:AsyncPostBackTrigger ControlID="MoveObjectsButton" />
            </Triggers>

        </asp:UpdatePanel>

    </asp:Panel>

    <div style="clear: both;"></div>

    <div ID="Toolbars" runat="server" class="Toolbars ClearFix">
 
        <asp:Panel ID="AddressPane" runat="server" CssClass="AddressPane" DefaultButton="AddressGoButton">

            <asp:UpdatePanel ID="AddressUpdatePanel" runat="server" UpdateMode="Always">

                <ContentTemplate>               
                    <div class="OBNavIcons">
                        <asp:ImageButton ID="AddressBackButton" runat="server" ImageUrl="~/AsiCommon/Images/icon_back.png" OnClick="AddressBackButton_Click" ToolTip="Back" AlternateText="Back" CssClass="OBNavIcon" />
                        <asp:ImageButton ID="AddressForwardButton" runat="server" ImageUrl="~/AsiCommon/Images/icon_forward.png" OnClick="AddressForwardButton_Click" ToolTip="Forward" AlternateText="Forward" CssClass="OBNavIcon" />
                        <asp:ImageButton ID="AddressUpButton" runat="server" ImageUrl="~/AsiCommon/Images/icon_folderuplevel.png" OnClick="AddressUpButton_Click" ToolTip="Up" AlternateText="Up" CssClass="OBNavIcon" />                   
                    </div>
                    <asiweb:StyledLabel runat="server" id="AddressLabel" Text="Directory Path" CssClass="screen-reader-text" AssociatedControlID="Address"></asiweb:StyledLabel>
                    <asp:TextBox ID="Address" runat="server" CssClass="InputXLarge" style="margin-right: 5px;" />
                    <ajaxToolkit:AutoCompleteExtender ID="AddressAutoCompleteExtender" runat="server" TargetControlID="Address" CompletionInterval="500"
                        ServiceMethod="GetAddressCompletionList" ServicePath="~/AsiCommon/Controls/BSA/objectBrowser.aspx" FirstRowSelected="true" />
                    <asiweb:StyledButton ID="AddressGoButton" runat="server" Text="Go" OnClick="AddressGoButton_Click" />

                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="SelectNodeButton" />
                    <asp:AsyncPostBackTrigger ControlID="SelectNodeCollapsedButton" />
                    <asp:AsyncPostBackTrigger ControlID="RefreshFolderButton" />
                    <asp:AsyncPostBackTrigger ControlID="CopyObjectsButton" />
                    <asp:AsyncPostBackTrigger ControlID="MoveObjectsButton" />
                </Triggers>

            </asp:UpdatePanel>

            <asp:Panel ID="ObjectQuickFindPanel" runat="server" CssClass="QuickFindWrapper">
                <asp:Label ID="ObjectQuickFindLabel" AssociatedControlID="ObjectQuickFindTextBox" Text="<%# QuickFindText %>" runat="server" />
                <asp:TextBox ID="ObjectQuickFindTextBox" onkeyup="searchTable(jQuery(this).val());" runat="server" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="FilenamePane" runat="server" Visible="false" CssClass="AutoWidth PanelField Left">           	
		    <asp:Label ID="FilenameLabel" runat="server" AssociatedControlID="Filename" Text="Name" Style="padding-top:3px;padding-left:52px;"/>			
    	    <div class="PanelFieldValue">
                <asp:TextBox ID="Filename" runat="server" CssClass="InputXLarge" />
                <asp:Button ID="FileSaveButton" runat="server" Text="Save" CssClass="hidden" OnClick="FileSaveButton_Click" />
	        </div>                                   
        </asp:Panel>

    </div>

    <div style="clear: both;"></div>
    
    <asp:Panel runat="server" ID="SplitterContainer" translate="no">
        <telerik:RadSplitter ID="RadSplitterMain" runat="server" RenderMode="Lightweight"
        Width="100%" Height="100%" ResizeWithBrowserWindow="true" VisibleDuringInit="false">

        <telerik:RadPane ID="RadPaneTree" runat="server" Width="205" ShowContentDuringLoad="false"
            ResizeWithBrowserWindow="True" VisibleDuringInit="False"
            PersistScrollPosition="True" RenderMode="Lightweight">

            <asp:UpdatePanel ID="TreeUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">

                <ContentTemplate>

                    <asp:Panel ID="TreePane" runat="server" CssClass="Left TreePane">
                        <asp:Panel ID="TreeHeaderPane" runat="server" CssClass="TreeHeaderPane" Visible="<%# RootListDataSource != null || !String.IsNullOrEmpty(Text) %>">
                            <asp:Label ID="TextLabel" runat="server" CssClass="TreeHeaderPaneText" Text="<%# Text %>" Visible="<%# RootListDataSource == null && !String.IsNullOrEmpty(Text) %>" />
                            <asiweb:BusinessDropDownList ID="RootList" runat="server" AutoPostBack="true"
                                Visible="<%# RootListDataSource != null %>" DataSource="<%# RootListDataSource %>"
                                DataValueField="<%# RootListDataValueField %>" DataTextField="<%# RootListDataTextField %>"
                                OnSelectedIndexChanged="RootList_SelectedIndexChanged" ShowNullItem="false" />
                        </asp:Panel>
                        <telerik:RadTreeView ID="RadTreeView1" runat="server" AccessKey="t"
                            EnableDragAndDrop="true"
                            EnableDragAndDropBetweenNodes="true"
                            ShowLineImages="false" LoadingStatusPosition="None"
                            OnNodeExpand="RadTreeView1_NodeExpand"
                            OnClientLoad="function(sender, args) { objectBrowserClass.TreeViewOnLoad(sender, args); }"
                            OnClientContextMenuItemClicked="function(sender, args) { objectBrowserClass.TreeViewContextMenuClick(sender, args); }"
                            OnClientNodeDropping="function(sender, args) { objectBrowserClass.TreeViewDrop(sender, args); }"
                            OnClientNodeDragStart="function(sender, args) { objectBrowserClass.TreeViewDrag(sender, args); }"
                            OnClientNodeClicking="function(sender, args) { objectBrowserClass.TreeViewBeforeClick(sender, args); }"
                            OnClientNodeClicked="function(sender, args) { objectBrowserClass.TreeViewAfterClick(sender, args); objectBrowserClass.ClearObjectQuickFindTextBox();}"
                            OnClientNodeCollapsed="function(sender, args) { objectBrowserClass.TreeViewAfterToggle(sender, args); }"
                            OnClientDoubleClick="function(sender, args) { objectBrowserClass.TreeViewBeforeDoubleClick(sender, args); }">
                            <ContextMenus>
                                <asimenu:ObjectBrowserTreeContextMenu ID="TreeContextMenu" runat="server" CollapseAnimation-Duration="0">
                                    <Items>
                                        <asimenu:ObjectBrowserNewMenuItem id="NewFolderTreeContextMenuItem" Text="New Folder" MenuItemAction="New" DocumentType="FOL" />
                                        <asimenu:ObjectBrowserMenuItem id="DeleteTreeContextMenuItem" Text="Delete" MenuItemAction="Delete" />
                                        <asimenu:ObjectBrowserMenuItem id="CutTreeContextMenuItem" Text="Cut" MenuItemAction="Cut" />
                                        <asimenu:ObjectBrowserMenuItem id="CopyTreeContextMenuItem" Text="Copy" MenuItemAction="Copy" />
                                        <asimenu:ObjectBrowserMenuItem id="PasteTreeContextMenuItem" Text="Paste" MenuItemAction="Paste" />
                                    </Items>
                                </asimenu:ObjectBrowserTreeContextMenu>
                            </ContextMenus>
                        </telerik:RadTreeView>
                    </asp:Panel>

                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="RefreshFolderButton" />
                    <asp:AsyncPostBackTrigger ControlID="CopyObjectsButton" />
                    <asp:AsyncPostBackTrigger ControlID="MoveObjectsButton" />
                    <asp:AsyncPostBackTrigger ControlID="SelectNodeButton" />
                    <asp:AsyncPostBackTrigger ControlID="SelectNodeCollapsedButton" />
                </Triggers>

            </asp:UpdatePanel>

        </telerik:RadPane>

        <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Both" />

        <telerik:RadPane ID="RadPaneContent" runat="server" ShowContentDuringLoad="false"
            ResizeWithBrowserWindow="true" VisibleDuringInit="false"
            PersistScrollPosition="true" RenderMode="Lightweight" Scrolling="None">

            <asp:UpdatePanel ID="ContentListUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" class="ContentListUpdatePanel">

                <ContentTemplate>

                    <asp:Panel ID="ContentContainerPane" runat="server" >

                        <asp:Panel ID="ContentListPane" runat="server">
                        
                            <%-- When in surf-to-edit content editor mode --%>
                            <telerik:RadSplitter ID="RadSplitterContent" runat="server" RenderMode="Lightweight"
                                Width="100%" Height="100%" ResizeWithBrowserWindow="true" VisibleDuringInit="false"
                                Orientation="Vertical" >

                                <telerik:RadPane ID="RadPaneContentList" runat="server" Width="205" ShowContentDuringLoad="true"
                                    ResizeWithBrowserWindow="true" VisibleDuringInit="true"
                                    PersistScrollPosition="true" RenderMode="Lightweight">

                                    <asp:Panel ID="ContentEmptyLabel" runat="server" CssClass="ObjectBrowserContentListEmpty" Visible="false">
                                        <asp:Label ID="Label1" runat="server" Text="(empty)" />
                                    </asp:Panel>
                                    <asp:Repeater ID="ContentList" runat="server">
                                        <HeaderTemplate>
                                            <table id="<%= ID %>_ContentList" class="ObjectBrowserContentList">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="<%# GetEvenOrOdd() %>" 
                                                ondblclick='<%# "objectBrowserClass.RowDblClick(this, event, \""+CurrentHierarchyKey.Equals(recycleBinKey).ToString(CultureInfo.InvariantCulture).ToLower() +"\");" %>'
                                                onmousedown='<%# "objectBrowserClass.RowMouseDown(this, event, \""+CurrentHierarchyKey.Equals(recycleBinKey).ToString(CultureInfo.InvariantCulture).ToLower() +"\", \"" + DragAndDropAllowed(((DocObject)Container.DataItem).DocumentType).ToString(CultureInfo.InvariantCulture).ToLower() + "\");" %>'
                                                onmouseover="addClass(this, 'hover');"
                                                onmouseout="removeClass(this, 'hover');"
                                                id='<%# ((DocObject)Container.DataItem).Key %>'
                                                data-hierarchykey='<%# ((DocObject)Container.DataItem).HierarchyKey %>'
                                                data-documenttypecode='<%# ((DocObject)Container.DataItem).DocumentType %>'
                                                data-parentname='<%# ((DocObject)Container.DataItem).ParentName %>'
                                                data-relateddocumenttypecode='<%# ((DocObject)Container.DataItem).RelatedDocumentType %>'
                                                data-relatedhierarchykey='<%# ((DocObject)Container.DataItem).RelatedDocumentHierarchyKey %>'
                                                data-documentname='<%# ((DocObject)Container.DataItem).Name%>'
                                                data-cancut="true"
                                                data-cancopy="true"
                                                data-canpaste="true"
                                                data-iscontainer='<%# ((DocObject)Container.DataItem).IsContainer.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>'>
                                                <td>
                                                    <span class='ObjectBrowserIcon ObjectBrowserContentListName<%# ((DocObject)Container.DataItem).IsSystem ? " ReadOnlyRow" : string.Empty %> <%# ((DocObject)Container.DataItem).Status == Asi.Business.Common.DocumentStatus.Working ? "unPublishedRow" : ((DocObject)Container.DataItem).Status < Asi.Business.Common.DocumentStatus.Published ? "unPublishedPendingRow" : string.Empty %>'
                                                        title='<%# ((DocObject)Container.DataItem).Status < Asi.Business.Common.DocumentStatus.Published ? string.Format(ItemStatusTextFormatString, ((DocObject)Container.DataItem).Status.ToString()) : string.Empty %>'
                                                        style="background-image: url(<%# ((DocObject)Container.DataItem).IconURL %>)">&nbsp;<%#string.IsNullOrEmpty(((DocObject)Container.DataItem).AlternateName) ? ((DocObject)Container.DataItem).Name : ((DocObject)Container.DataItem).AlternateName%></span>
                                                </td>
                                                <td id="DescriptionCell" runat="server" visible="<%# ShowDescription  %>" title='<%# ((DocObject)Container.DataItem).Description %>'>
                                                    <asp:Label ID="Label2" runat="server" Visible="<%# !string.IsNullOrEmpty(((DocObject)Container.DataItem).Description) %>" Text='<%# ((DocObject)Container.DataItem).Description %>'></asp:Label>
                                                </td>
                                                <td id="PathCell" runat="server" visible="<%# !string.IsNullOrEmpty(((DocObject)Container.DataItem).Path) %>" title='<%# ((DocObject)Container.DataItem).Path %>'>
                                                    <asp:Label ID="pathLabel" runat="server" Text='<%# ((DocObject)Container.DataItem).Path %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>

                                </telerik:RadPane>

                                <telerik:RadSplitBar ID="RadSplitbar2" runat="server" CollapseMode="Both" Visible="false" />

                                <telerik:RadPane ID="RadPaneContentEdit" runat="server" ShowContentDuringLoad="true"
                                    ResizeWithBrowserWindow="true" VisibleDuringInit="true"
                                    PersistScrollPosition="true" RenderMode="Lightweight" Scrolling="None" 
                                    Visible="false">
                                    <iframe id="ContentEditFrame" runat="server" class="FullSize" src="<%# BlankUrl %>" style="border:none;" />
                                </telerik:RadPane>
                            
                                <telerik:RadPane ID="RadPaneSummary" runat="server" Height="75px" ShowContentDuringLoad="false"
                                    VisibleDuringInit="false" Visible="false" Scrolling="None">                                                                                                                                        
                                    <iframe id="SummaryFrame" runat="server" class="FullSize" src="<%# BlankUrl %>" style="border:none;" />                                   
                                    <asp:Panel ID="ContentSummaryPane" runat="server"></asp:Panel>  
                                </telerik:RadPane>

                            </telerik:RadSplitter>
                        
                        </asp:Panel>
                                                          
                    </asp:Panel>
                                
                    <asp:Panel ID="ContentEditPane" CssClass="ContentContainerPane" Visible="false" runat="server">
                        <iframe id="EditFrame" runat="server" class="FullSize" src="<%# BlankUrl %>" style="border:none;" />
                    </asp:Panel>  

                    <asimenu:ObjectBrowserContextMenu ID="GridContextMenu" runat="server" CollapseAnimation-Duration="0" OnClientItemClicked="function(sender, args){ objectBrowserClass.GridContextMenuClick(sender, args); }">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="ContentListPane" />
                        </Targets>
                        <Items>
                            <asimenu:ObjectBrowserMenuItem id="DeleteGridContextMenuItem" Text="Delete" MenuItemAction="Delete" />
                            <asimenu:ObjectBrowserMenuItem id="CutGridContextMenuItem" Text="Cut" MenuItemAction="Cut" />
                            <asimenu:ObjectBrowserMenuItem id="CopyGridContextMenuItem" Text="Copy" MenuItemAction="Copy" />
                            <asimenu:ObjectBrowserMenuItem id="PasteGridContextMenuItem" Text="Paste" MenuItemAction="Paste" />
                        </Items>
                    </asimenu:ObjectBrowserContextMenu>

                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="RefreshFolderButton" />
                    <asp:AsyncPostBackTrigger ControlID="CopyObjectsButton" />
                    <asp:AsyncPostBackTrigger ControlID="MoveObjectsButton" />
                    <asp:AsyncPostBackTrigger ControlID="SelectNodeButton" />
                    <asp:AsyncPostBackTrigger ControlID="SelectNodeCollapsedButton" />
                </Triggers>

            </asp:UpdatePanel>

        </telerik:RadPane>

    </telerik:RadSplitter>
    </asp:Panel>
</div>

<script id="ObjectBrowserScript" type="text/javascript">

    addLoadEvent(HookEndRequest);
  
    function HookEndRequest() {
        window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(ObjectBrowser_EndRequest);   
    }

    jQuery(document).ready(function() {
        SetSplitterHeight();
    });

    jQuery(window).resize(function() {
        SetSplitterHeight();
    });

    function SetSplitterHeight() {
        // calculate the height of the Object Browser window
        var additionalElements = ["div.MenuPane", "div.Toolbars"];
        // arbitrary 5 extra pixels removed to give it a little breathing room :)
        jQuery("#<%= SplitterContainer.ClientID %>").height(GetAvailableHeight(additionalElements) - 5);
    }
    
    function ObjectBrowser_EndRequest(sender, args) {
        Window_Resize();
        // Re-apply the quick find filter string, if one has been specified.
        var qftb = jQuery('#'+ '<%= ObjectQuickFindTextBox.ClientID %>');
        if (qftb.val() != '')
            searchTable(qftb.val());
    }  
    var isEasyEditEnabled = '<%= (Page is DisplayPageBase) ? ((DisplayPageBase)Page).SurfToEditEnabled.ToString().ToLowerInvariant() : "false" %>';
 
    var objectBrowserClass = new ObjectBrowserClass();
    objectBrowserClass.MessageNothingSelected = '<%= MessageNothingSelected %>';
    objectBrowserClass.MessageMoreThanOneSelected = '<%= MessageMoreThanOneSelected %>';
    objectBrowserClass.DocumentExistsMessage = '<%= Asi.ResourceManager.GetPhrase("DocumentExists","Document Exists") %>';
    objectBrowserClass.MoveObjectsButtonID = '<%= MoveObjectsButton.UniqueID %>';
    objectBrowserClass.CopyObjectsButtonID = '<%= CopyObjectsButton.UniqueID %>';
    objectBrowserClass.NewDocNameID = '<%= NewDocName.ClientID %>';
    objectBrowserClass.RefreshFolderButtonID = '<%= RefreshFolderButton.UniqueID %>';
    objectBrowserClass.UpdateMenuButtonID = '<%= UpdateMenuButton.UniqueID %>';
    objectBrowserClass.SelectNodeButtonID = '<%= SelectNodeButton.UniqueID %>';
    objectBrowserClass.ConflictingPathResolutionSkip = '<%= Asi.Business.Common.ConflictingPathResolution.Skip %>';
    objectBrowserClass.ShowMenu = <%= ShowMenu.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.ShowEdit = <%= ShowEdit.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.ShowSummary = <%= ShowSummary.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.EditAction = '<%= Asi.Web.UI.PageOperation.Edit.ToString().ToLowerInvariant() %>';
    objectBrowserClass.ExecuteAction = '<%= Asi.Web.UI.PageOperation.Execute.ToString().ToLowerInvariant() %>';
    objectBrowserClass.DownloadAction = '<%= Asi.Web.UI.PageOperation.Download.ToString().ToLowerInvariant() %>';
    objectBrowserClass.SelectAction = '<%= Asi.Web.UI.PageOperation.Select.ToString().ToLowerInvariant() %>';
    objectBrowserClass.ImportAction = '<%= Asi.Web.UI.PageOperation.Import.ToString().ToLowerInvariant() %>';
    objectBrowserClass.VersionsAction = '<%= Asi.Web.UI.PageOperation.Versions.ToString().ToLowerInvariant() %>';
    objectBrowserClass.PreviewAction = '<%= Asi.Web.UI.PageOperation.Preview.ToString().ToLowerInvariant() %>';
    objectBrowserClass.SelectAndReturnValueAction = '<%= Asi.Web.UI.PageOperation.SelectAndReturnValue.ToString().ToLowerInvariant() %>';
    objectBrowserClass.ExportAction = '<%= Asi.Web.UI.PageOperation.Export.ToString().ToLowerInvariant() %>';
    objectBrowserClass.SubmitAction = '<%= Asi.Web.UI.PageOperation.Submit.ToString().ToLowerInvariant() %>';
    objectBrowserClass.PublishAction = '<%= Asi.Web.UI.PageOperation.Publish.ToString().ToLowerInvariant() %>';
    objectBrowserClass.RequestDeleteAction = '<%= Asi.Web.UI.PageOperation.RequestDelete.ToString().ToLowerInvariant() %>';
    objectBrowserClass.DeleteAction = '<%= Asi.Web.UI.PageOperation.Delete.ToString().ToLowerInvariant() %>';
    objectBrowserClass.PurgeAction = '<%= Asi.Web.UI.PageOperation.Purge.ToString().ToLowerInvariant() %>';
    objectBrowserClass.NewAction = '<%= Asi.Web.UI.PageOperation.New.ToString().ToLowerInvariant() %>';
    objectBrowserClass.CutAction = '<%= Asi.Web.UI.PageOperation.Cut.ToString().ToLowerInvariant() %>';
    objectBrowserClass.CopyAction = '<%= Asi.Web.UI.PageOperation.Copy.ToString().ToLowerInvariant() %>';
    objectBrowserClass.PasteAction = '<%= Asi.Web.UI.PageOperation.Paste.ToString().ToLowerInvariant() %>';
    objectBrowserClass.RefreshAction = '<%= Asi.Web.UI.PageOperation.Refresh.ToString().ToLowerInvariant() %>';
    objectBrowserClass.SelectAllAction = '<%= Asi.Web.UI.PageOperation.SelectAll.ToString().ToLowerInvariant() %>';
    objectBrowserClass.PurgeAllAction = '<%= Asi.Web.UI.PageOperation.PurgeAll.ToString().ToLowerInvariant() %>';
    objectBrowserClass.UndoAction = '<%= Asi.Web.UI.PageOperation.Undo.ToString().ToLowerInvariant() %>';
    objectBrowserClass.RadTreeViewClientID = '<%= RadTreeView1.ClientID %>';
    objectBrowserClass.MainMenuClientID = '<%= MainMenu.ClientID %>';
    objectBrowserClass.RemoveMainMenuElementTabIndex();
    objectBrowserClass.AllowMultiSelect = <%= AllowMultiSelect.ToString(CultureInfo.InvariantCulture).ToLower() %>;
    objectBrowserClass.AllowSingleClickAction = <%= (SingleClickAction == Asi.Web.UI.PageOperation.SelectAndReturnValue).ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    //This check is necessary for Easy Edit to be allowed on iparts in the masterpage.
    if(isEasyEditEnabled === "false")
        objectBrowserClass.ShowHierarchyTree = <%= ShowHierarchyTree.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.DoubleClickAction = '<%= DoubleClickAction %>';
    objectBrowserClass.SingleClickAction = '<%= SingleClickAction.ToString().ToLowerInvariant() %>';
    objectBrowserClass.ContentListID = '<%= ID %>_ContentList';
    objectBrowserClass.EditFrameClientID = '<%= EditFrame.ClientID %>';
    objectBrowserClass.ContentEditFrameClientID = '<%= ContentEditFrame.ClientID %>';
    objectBrowserClass.BlankUrl = '<%= BlankUrl %>';
    objectBrowserClass.ShowNonContainersInHeirarchyTree = <%= ShowNonContainersInHierarchyTree.ToString(CultureInfo.InvariantCulture).ToLower() %>;
    objectBrowserClass.SelectNodeCollapsedButtonID = '<%= SelectNodeCollapsedButton.UniqueID %>';
    objectBrowserClass.PathSeparator = '<%= PathSeparator %>';
    objectBrowserClass.HierarchyAddTypeAfterAsSibling = '<%= Asi.Business.Common.HierarchyAddType.AfterAsSibling.ToString() %>';
    objectBrowserClass.HierarchyAddTypeBeforeAsSibling = '<%= Asi.Business.Common.HierarchyAddType.BeforeAsSibling.ToString() %>';
    objectBrowserClass.HierarchyAddTypeAsLastChild = '<%= Asi.Business.Common.HierarchyAddType.AsLastChild.ToString() %>';
    objectBrowserClass.AllowUpwardNavigation = <%= (AllowUpwardNavigation).ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.MaxFileUploadSize = <%= MaxFileUploadSize %>;
    objectBrowserClass.EmbeddedMode = <%= EmbeddedMode.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.SelectContent = '<%= ObjectBrowserMode.SelectContent %>';
    objectBrowserClass.SelectContainer = '<%= ObjectBrowserMode.SelectContainer %>';
    objectBrowserClass.FilenameClientID = '<%= Filename.ClientID %>';
    objectBrowserClass.DialogMode = <%= DialogMode.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.WindowClientScript = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
    objectBrowserClass.ShowFilename = <%= ShowFilename.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;
    objectBrowserClass.SelectRowButtonClientID = '<%= SelectRowButton.ClientID %>';
    objectBrowserClass.ObjectBrowserEmbeddedModeToken = '<%= Asi.Web.UI.DisplayPageBase.ObjectBrowserEmbeddedModeToken %>';
    objectBrowserClass.EmptyGuid = '<%= Guid.Empty.ToString() %>';
    objectBrowserClass._mode = '<%= Mode %>';
    objectBrowserClass.ObjectQuickFindTextBoxID = '<%= ObjectQuickFindTextBox.ClientID %>';
    PageMethods.set_path('<%= Request.FilePath %>');
    
    if (objectBrowserClass.SelectAllAction) {
        document.onkeydown = function() {
            objectBrowserClass.RemoveMainMenuElementTabIndex();
            if (event != null) {
                if (event.keyCode == 17) {
                    window.blur();
                    return;
                }
            }
        };
    }
</script>
