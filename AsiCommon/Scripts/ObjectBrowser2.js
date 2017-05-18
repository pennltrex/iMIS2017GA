function isArray(obj) {
    if (obj.constructor.toString().indexOf("Array") == -1) {
        return false;
    }
    else {
        return true;
    }
}

function DocumentObject(hierarchyKey, documentVersionKey, documentTypeCode, documentName, relatedDocumentVersionKey, relatedDocumentTypeCode, relatedHierarchyKey, parentName, canPaste, canCopy, canCut, isContainer) {
    this.HierarchyKey = hierarchyKey;
    this.DocumentVersionKey = documentVersionKey;
    this.DocumentTypeCode = documentTypeCode;
    this.DocumentName = documentName;
    this.RelatedDocumentVersionKey = relatedDocumentVersionKey;
    this.RelatedDocumentTypeCode = relatedDocumentTypeCode;
    this.RelatedHierarchyKey = relatedHierarchyKey;
    this.ParentName = parentName;
    this.CanPaste = canPaste;
    this.CanCopy = canCopy;
    this.CanCut = canCut;
    this.IsContainer = isContainer;
}

function ObjectBrowserClass() {
    this.EmptyGuid = '';
    this.ClickedNode = '';
    this.SelectRowLastId = "";
    this.TreeViewOnLoad = function (sender, eventArgs) {
        var treeview = $find(this.RadTreeViewClientID);
        if (treeview != null) {
            var selectedNode = treeview.get_selectedNode();
            selectedNode = treeview.findNodeByValue(this.ClickedNode);
            if (selectedNode != null) {
                var nodeElement = selectedNode.get_element();
                var treeViewElement = treeview.get_element();
                var nodeOffsetTop = treeview._getTotalOffsetTop(nodeElement);
                var treeOffsetTop = treeview._getTotalOffsetTop(treeViewElement);
                var relativeOffsetTop = nodeOffsetTop - treeOffsetTop;
                // this delay is necessary because the window onload will set scroll positions back to 0.
                window.setTimeout(function () {
                    treeViewElement.scrollTop = relativeOffsetTop;
                }, 500);
            }
        }
    };
    this.DocumentObjectFromNode = function (node) {
        if (!node) {
            return null;
        }

        return new DocumentObject(node.get_value(),
        node.get_attributes().getAttribute("DocumentVersionKey"),
        node.get_attributes().getAttribute("data-DocumentTypeCode"),
        node.get_attributes().getAttribute("data-DocumentName"),
        null,
        null,
        null,
        node.get_parent() != node.get_treeView() ? node.get_parent().get_text() : '',
        eval(node.get_attributes().getAttribute("data-CanPaste")),
        eval(node.get_attributes().getAttribute("data-CanCopy")),
        eval(node.get_attributes().getAttribute("data-CanCut")),
        eval(node.get_attributes().getAttribute("data-IsContainer")));
    };
    this.DocumentObjectFromRow = function (row) {
        return new DocumentObject(row.getAttribute("data-HierarchyKey"),
            row.id,
            row.getAttribute("data-DocumentTypeCode"),
            row.getAttribute("data-DocumentName"), //trim(document.all ? row.cells[0].innerText : row.cells[0].textContent), 
            row.getAttribute("RelatedDocumentVersionkey"),
            row.getAttribute("data-RelatedDocumentTypeCode"),
            row.getAttribute("data-RelatedHierarchyKey"),
            row.getAttribute("data-ParentName"),
            eval(row.getAttribute("data-CanPaste")),
            eval(row.getAttribute("data-CanCopy")),
            eval(row.getAttribute("data-CanCut")),
            eval(row.getAttribute("IsContainer")));
    };
    this.GetSelectedItems = function (useFolderIfNoRowsSelected) {
        var selectedRows = this.GetSelectedRows();
        var selectedItems = []; //this creates a new array

        if (selectedRows && selectedRows.length > 0) {
            for (var i = 0; i < selectedRows.length; i++) {
                selectedItems.push(this.DocumentObjectFromRow(selectedRows[i]));
            }
        }
        else if (useFolderIfNoRowsSelected) {
            var selectedNode = this.GetSelectedNode();
            if (selectedNode) {
                var currentFolder = this.DocumentObjectFromNode(selectedNode);
                selectedItems.push(currentFolder);
            }
        }
        return selectedItems;
    };
    this.GeneralClick = function (menuItem) {
        var selectedNode = this.GetSelectedNode();
        var currentFolder = null;
        if (selectedNode) {
            currentFolder = this.DocumentObjectFromNode(selectedNode);
        }

        var selectedItems = this.GetSelectedItems(true);

        if (menuItem.get_attributes().getAttribute("DocumentType") !== null) {
            this.PerformAction(menuItem.get_value(), selectedItems, currentFolder, menuItem.get_attributes().getAttribute("DocumentType"));
        }
        else {
            this.PerformAction(menuItem.get_value(), selectedItems, currentFolder);
        }
    };
    this.MenuClick = function (sender, args) {
        // close all open menus
        var numItems = args._item.get_items().length;
        if (numItems) {
            this.MenuClose();
        }

        if (args._item.get_value() && args._item.get_value().length > 0) {
            this.GeneralClick(args._item);

            if (window.event) {
                window.event.returnValue = false;
            }
            return false;
        }

        return true;
    };
    this.GetDocumentVersionKeysString = function (selectedItems, optional) {
        var selectedItemKeys = '';
        if (selectedItems) {
            for (var i = 0; i < selectedItems.length; i++) {
                //Adds the name of the child if it is one to the selectedItemsKeys.
                if (optional && (selectedItems[i].DocumentTypeCode == "DBB")) {
                    selectedItemKeys += "," + selectedItems[i].DocumentVersionKey + "|" + selectedItems[i].DocumentName;
                }
                else {
                    selectedItemKeys += "," + selectedItems[i].DocumentVersionKey;
                }
            }
        }
        return selectedItemKeys.substr(1);
    };
    this.GetHierarchyKeysString = function (selectedItems) {
        var selectedItemKeys = '';
        if (selectedItems) {
            for (var i = 0; i < selectedItems.length; i++) {
                selectedItemKeys += "," + selectedItems[i].HierarchyKey;
            }
        }
        return selectedItemKeys.substr(1);
    };
    this.EditAction = null;
    this.ExecuteAction = null;
    this.DownloadAction = null;
    this.SelectAction = null;
    this.ImportAction = null;
    this.VersionsAction = null;
    this.PreviewAction = null;
    this.SelectAndReturnValueAction = null;
    this.ExportAction = null;
    this.SubmitAction = null;
    this.PublishAction = null;
    this.RequestDeleteAction = null;
    this.DeleteAction = null;
    this.PurgeAction = null;
    this.NewAction = null;
    this.CutAction = null;
    this.CopyAction = null;
    this.PasteAction = null;
    this.RefreshAction = null;
    this.SelectAllAction = null;
    this.PurgeAllAction = null;
    this.UndoAction = null;
    this.RadTreeViewClientID = null;
    this.PerformAction = function (action, selectedItems, currentFolder, type) {
        var i = 0;
        this.SetSelectedKeys(selectedItems);

        action = action.toLowerCase();
        switch (action) {
            case this.EditAction:
            case this.ExecuteAction:
            case this.DownloadAction:
            case this.SelectAction:
            case this.ImportAction:
            case this.VersionsAction:
            case this.PreviewAction:
                this.ShowActionForm(action, selectedItems, currentFolder, true);
                break;
            case this.SelectAndReturnValueAction:
                this.SelectAndReturnValue();
                break;
            case this.ExportAction:
            case this.SubmitAction:
            case this.PublishAction:
                this.ShowActionForm(action, selectedItems, currentFolder, false);
                break;
            case this.RequestDeleteAction:
                this.ShowActionForm(action, selectedItems, currentFolder, false, 'Are you sure you want to request deletion of the selected object(s)?');
                break;
            case this.DeleteAction:
                this.ShowActionForm(action, selectedItems, currentFolder, false, 'Are you sure you want to delete the selected object(s) and all of their children?');
                // Wrapper function that selects the parent node before refreshing when deleting.
                var ob = this;
                var newDialogWindowClose = function (dialogWindow) {
                    try {
                        // If deletion was performed and selectedKeys (selection on right pane) content is equals than currentHierarchyKey (selection on tree)
                        var currentHierarchyKey = $('CurrentHierarchyKey').value;
                        var selectedKeys = $('SelectedKeys').value;
                        if (dialogWindow.IsDirty && selectedKeys !== null && currentHierarchyKey !== null && selectedKeys == currentHierarchyKey) {
                            var tree = $find(ob.RadTreeViewClientID);
                            var sn = tree.get_selectedNode();
                            if (sn.get_parent() != sn.get_treeView()) {
                                var selectedKey = sn.get_parent().get_value();
                                ob.SelectNode(selectedKey);
                                $('CurrentHierarchyKey').value = selectedKey;
                            }
                        }

                        if (dialogWindow.IsDirty) {
                            ob.RefreshNode();
                        }

                    }
                    finally {
                        // restore old DialogWindowClose function
                        ob.DialogWindowClose = window.oldDialogWindowClose;
                        window.oldDialogWindowClose = null;
                    }
                };

                window.oldDialogWindowClose = this.DialogWindowClose;
                this.DialogWindowClose = newDialogWindowClose;
                break;
            case this.PurgeAction:
                // handle nothing selected
                if (!selectedItems || selectedItems.length === 0 || selectedItems[0].DocumentName === undefined) {
                    alert(this.MessageNothingSelected);
                    return;
                }
                this.ShowActionForm(action, selectedItems, currentFolder, false, 'Are you sure you want to PERMANENTLY delete the selected object(s) and all of their children? You will not be able to undo this operation.');
                // Wrapper function that selects the parent node before refreshing when purging.
                var obj = this;
                var newDialogWindowClose1 = function (dialogWindow) {
                    try {
                        // If purge was performed and selectedKeys (selection on right pane) content is equals than currentHierarchyKey (selection on tree)
                        var currentHierarchyKey = $('CurrentHierarchyKey').value;
                        var selectedKeys = $('SelectedKeys').value;
                        if (dialogWindow.IsDirty && selectedKeys !== null && currentHierarchyKey !== null && selectedKeys == currentHierarchyKey) {
                            var tree = $find(obj.RadTreeViewClientID);
                            var sn = tree.get_selectedNode();
                            if (sn.get_parent() != sn.get_treeView()) {
                                var selectedKey = sn.get_parent().get_value();
                                obj.SelectNode(selectedKey);
                                $('CurrentHierarchyKey').value = selectedKey;
                            }
                        }
                        if (dialogWindow.IsDirty) {
                            obj.RefreshNode();
                        }
                    }
                    finally {
                        // restore old DialogWindowClose function
                        obj.DialogWindowClose = window.oldDialogWindowClose;
                        window.oldDialogWindowClose = null;
                    }
                };
                window.oldDialogWindowClose = this.DialogWindowClose;
                this.DialogWindowClose = newDialogWindowClose1;
                break;
            case this.NewAction:
                if (!type || !type.length) {
                    return;
                }
                this.ShowNewForm(currentFolder, type);
                break;
            case this.CutAction:
                // handle nothing selected
                if (!selectedItems || selectedItems.length === 0) {
                    alert(this.MessageNothingSelected);
                    return;
                }
                for (i = 0; i < selectedItems.length; i++) {
                    if (!selectedItems[i].CanCut) {
                        alert('Cannot move ' + selectedItems[i].DocumentName + '.  Operation cancelled.');
                        return;
                    }
                }
                this.SetValueToClipboard(this.GetHierarchyKeysString(selectedItems));
                this.SetDocTypeToClipboard(selectedItems[0].DocumentTypeCode);
                document.getElementById("ClipboardCutCopy").value = action;
                break;
            case this.CopyAction:
                // handle nothing selected
                if (!selectedItems || selectedItems.length === 0) {
                    alert(this.MessageNothingSelected);
                    return;
                }
                for (i = 0; i < selectedItems.length; i++) {
                    if (!selectedItems[i].CanCopy) {
                        alert('Cannot copy ' + selectedItems[i].DocumentName + '.  Operation cancelled.');
                        return;
                    }
                }
                this.SetValueToClipboard(this.GetHierarchyKeysString(selectedItems));
                this.SetDocTypeToClipboard(selectedItems[0].DocumentTypeCode);
                document.getElementById("ClipboardCutCopy").value = action;
                break;
            case this.PasteAction:
                this.PasteObjects(selectedItems);
                break;
            case this.RefreshAction:
                this.RefreshNode();
                break;
            case this.SelectAllAction:
                this.SelectAllRows();
                break;
            case this.PurgeAllAction:
                if (!confirm('Are you sure you want to PERMANENTLY delete the contents of the recycle bin? You will not be able to undo this operation.'))
                    return;

                this.SelectAllRows();
                var selectedRows = this.GetSelectedRows();
                selectedItems = []; //this creates a new array
                if (selectedRows && selectedRows.length > 0) {
                    for (i = 0; i < selectedRows.length; i++) {
                        selectedItems.push(this.DocumentObjectFromRow(selectedRows[i]));
                    }
                }
                this.ShowActionForm(this.PurgeAction, selectedItems, currentFolder, false, null);
                break;
        }
    };
    this.MainMenuClientID = null;
    this.MenuClose = function () {
        var menu = document.getElementById(this.MainMenuClientID);
        menu.Close();
    };
    this.SetValueToClipboard = function (clipboardValue) {
        document.getElementById("Clipboard").value = clipboardValue;
    };
    this.SetDocTypeToClipboard = function (firstClipboardDocumentType) {
        document.getElementById("DocumentTypeClipboard").value = firstClipboardDocumentType;
    };
    this.SetSelectedKeys = function (selectedItems) {
        document.getElementById("SelectedKeys").value = this.GetHierarchyKeysString(selectedItems);
    };
    this.MessageNothingSelected = null;
    this.MessageMoreThanOneSelected = null;
    this.ClipboardOperationTargetHierarchyKey = null;
    this.PasteObjects = function (selectedItems) {
        if (!selectedItems || !selectedItems.length) {
            alert(this.MessageNothingSelected);
            return false;
        }
        else if (selectedItems.length > 1) {
            alert(this.MessageMoreThanOneSelected);
            return false;
        }

        var selectedItem = selectedItems[0];
        if (selectedItem.CanPaste) {
            document.getElementById("SelectedKeys").value = document.getElementById("Clipboard").value;
            this.ClipboardOperationTargetHierarchyKey = selectedItem.HierarchyKey;

            var pasteItemDocumentType = '';
            var docType = document.getElementById("DocumentTypeClipboard").value;
            if (docType != '' && docType != null) {
                pasteItemDocumentType = docType;
            }
            else {
                pasteItemDocumentType = selectedItem.DocumentTypeCode;
            }

            if (pasteItemDocumentType == 'WEB') {
                document.getElementById(this.NewDocNameID).value = '';
                this.ShowRenameDialog();
            }
            else {
                var ob = this;
                PageMethods.CheckForPasteConflict(document.getElementById("SelectedKeys").value, selectedItem.HierarchyKey, function (showConflictDialog, userContext, methodName) { ob.CheckForPasteConflict_Succeeded(showConflictDialog, userContext, methodName); }, function (error, userContext, methodName) { ob.OnFailed(error, userContext, methodName); });
            }
        }
    };
    this.DocumentExistsMessage = null;
    this.MoveObjectsButtonID = null;
    this.CopyObjectsButtonID = null;
    this.ConflictingPathResolutionSkip = null;
    this.CheckForPasteConflict_Succeeded = function (showConflictDialog, userContext, methodName) {
        if (showConflictDialog) {
            var ob = this;
            ShowDialog_NoReturnValue(gWebRoot + "/iMIS/BSA/ConflictResolution.aspx", null, 500, 500, this.DocumentExistsMessage, null, null, function (dialogWindow) { ob.ConflictDialog_Close(dialogWindow); }, 'ObjectBrowserDialog', false, false, function (dialogWindow) { ob.DialogWindowCallback(dialogWindow); });
            return;
        }
        document.getElementById("ConflictResolution").value = '';
        var controlUniqueID = document.getElementById("ClipboardCutCopy").value == 'cut' ? this.MoveObjectsButtonID : this.CopyObjectsButtonID;
        InitiatePostBack(controlUniqueID, this.ClipboardOperationTargetHierarchyKey);
    };
    this.ConflictDialog_Close = function (dialogWindow) {
        var dialogResult = dialogWindow.result;
        if (!dialogResult || dialogResult == this.ConflictingPathResolutionSkip) {
            return;
        }
        document.getElementById("ConflictResolution").value = dialogResult;
        var controlUniqueID = document.getElementById("ClipboardCutCopy").value == 'cut' ? this.MoveObjectsButtonID : this.CopyObjectsButtonID;
        InitiatePostBack(controlUniqueID, this.ClipboardOperationTargetHierarchyKey);
    };
    this.refreshRequested = false;
    this.RefreshFolderButtonID = null;
    this.DialogWindowCallback = function (dialogWindow) {
        if (this.refreshRequested && dialogWindow.IsDirty) {
            this.RefreshNode();
        }
    };
    this.DialogWindowClose = function (dialogWindow) {
        if (this.refreshRequested && dialogWindow.IsDirty) {
            this.RefreshNode();
        }
    };
    this.RefreshNode = function () {
        this.refreshRequested = false;
        var selectedNode = this.GetSelectedNode();
        // Disable the menu while posting back; this won't persist past the postback.
        var menu = null;
        try {
            menu = this.MainMenuClientID;
        }
        catch (exc) {
        }

        if (menu) {
            this.DisableMenuItems(menu);
        }
        if (selectedNode) {
            InitiatePostBack(this.RefreshFolderButtonID, selectedNode.get_value());
        }
        else {
            InitiatePostBack(this.RefreshFolderButtonID);
        }
    };
    this.NewDocNameID = null;
    this.ShowRenameDialog = function () {
        var ob = this;
        var win = ShowDialog(gWebRoot + '/iMIS/ContentManagement/CopyWebsite.aspx', null, 500, 400, 'Copy website', null, null, function (dialogWindow) { ob.ShowRenameDialogCallback(dialogWindow); }, 'Copy website', false, false, function (dialogWindow) { ob.DialogWindowClose(dialogWindow); });
        win.set_modal(true); // Not sure why the window isn't already modal. No other dialog windows have to set this 'manually'.
        setTimeout(function () { win.setActive(true); }, 0);
    };
    this.ShowRenameDialogCallback = function (radWindow) {
        if (!radWindow.result || this.NewDocNameID == undefined || this.NewDocNameID == null)
            return;
        document.getElementById(this.NewDocNameID).value = '';
        document.getElementById(this.NewDocNameID).value = radWindow.result;
        if (radWindow.result != '' & radWindow.result != null) {
            radWindow.result = '';
            radWindow.DestroyOnClose = true; // Setting DestroyOnClose is the only way to clear out the RadWindow's result value (it causes the RadWindow to be disposed rather than re-used).
            radWindow.close();
            InitiatePostBack(this.CopyObjectsButtonID, this.ClipboardOperationTargetHierarchyKey);
        }
    };
    this.ShowMenu = false;
    this.UpdateMenuButtonID = null;
    this.UpdateMenu = function () {
        if (this.ShowMenu) {
            this.SetSelectedKeys(this.GetSelectedItems(true));
            InitiatePostBack(this.UpdateMenuButtonID);
        }
    };
    this.DisableMenuItems = function (menu) {
        if (!menu) {
            return;
        }
        var children = menu.Items;
        if (!children || !children.length) {
            return;
        }

        for (var i = 0; i < children.length; ++i) {
            var child = children[i];
            child.Disable();
            this.DisableMenuItems(child);
        }
    };
    this.AllowMultiSelect = false;
    this.AllowSingleClickAction = false;
    this.RowClick = function (rowObject, e) {
        if (e !== null && IsCtrl(e) && this.AllowMultiSelect) {
            if (this.IsSelected(rowObject)) {
                this.DeselectRow(rowObject);
            }
            else {
                this.SelectRow(rowObject);
            }
        }
        else if (e !== null && IsShift(e) && this.AllowMultiSelect) {
            var grid = rowObject.parentNode.parentNode;
            var selectedRows = this.GetSelectedRows(grid);
            this.DeselectAllRows(grid);

            if (selectedRows !== null && selectedRows.length > 0) {
                // TODO: put selected rows in a stack so i can get last clicked one
                // instead of last one in this list, it may be different.
                var lastSelectedRow = selectedRows[0], i = 0;
                if (lastSelectedRow.rowIndex < rowObject.rowIndex) {
                    for (i = lastSelectedRow.rowIndex; i < rowObject.rowIndex; i++) {
                        //if (grid.rows[i] != lastSelectedRow)
                        this.SelectRow(grid.rows[i], true);
                    }
                }
                else {
                    for (i = lastSelectedRow.rowIndex; i > rowObject.rowIndex; i--) {
                        //if (grid.rows[i] != lastSelectedRow)
                        this.SelectRow(grid.rows[i], true);
                    }
                }
            }

            // Select the row clicked on and fire the events
            this.SelectRow(rowObject);
        }
        else {
            this.DeselectAllRows(rowObject.parentNode.parentNode);
            this.SelectRow(rowObject, false);
        }

        if (this.AllowSingleClickAction) {
            this.SelectAndReturnValue();
            return;
        }
    };
    this.ShowHierarchyTree = false;
    this.SelectNodeButtonID = null;
    this.DoubleClickAction = null;
    this.RowDblClick = function (rowObject, e, isRecycle) {
        if (isRecycle == "true") {
            alert("Items within the Recycle Bin cannot be viewed. \nYou must Revert the item.");
            return false;
        }
        var selectedItems = this.GetSelectedItems(false);
        if (selectedItems.length === 0)
            return false;
        if (selectedItems[0].DocumentTypeCode == 'FOL' || selectedItems[0].DocumentTypeCode == 'CFL' || (selectedItems[0].DocumentTypeCode == 'SRT' && selectedItems[0].RelatedDocumentTypeCode == 'FOL')) {
            var selectedKey;
            if (selectedItems[0].DocumentTypeCode != 'SRT') {
                selectedKey = selectedItems[0].HierarchyKey;
            }
            else {
                selectedKey = selectedItems[0].RelatedHierarchyKey;
            }
            if (this.ShowHierarchyTree) {
                var ob = this;
                window.setTimeout(function () { ob.SelectNode(selectedKey); }, 50);
            }
            else {
                $('CurrentHierarchyKey').value = selectedKey;
                InitiatePostBack(this.SelectNodeButtonID, selectedKey);
            }
        }
        else {
            var currentNode = this.GetSelectedNode();
            var currentFolder = null;
            if (currentNode) {
                currentFolder = this.DocumentObjectFromNode(currentNode);
            }
            this.PerformAction(this.DoubleClickAction, selectedItems, currentFolder);
        }

        if (window.event) {
            window.event.returnValue = false;
        }
        else {
            return false;
        }
    };
    this.RowContextMenu = function (index, e) {
        var isSelected = this.Rows[index].Control.getAttribute("Selected");
        if (isSelected && isSelected != "1") {
            this.SelectRow(this.Rows[index].Control, false);
        }
    };
    this.ContentListID = null;
    this.GetSelectedRows = function (grid) {
        if (!grid) {
            grid = document.getElementById(this.ContentListID);
        }

        var result = [];
        if (grid) {
            var allRows = grid.rows;
            for (var i = 0; i < allRows.length; i++) {
                if (this.IsSelected(allRows[i])) {
                    result.push(allRows[i]);
                }
            }
        }
        return result;
    };
    this.IsSelected = function (rowObject) {
        return hasClass(rowObject, 'selected');
    };
    this.SelectRow = function (rowObject, suppressEvent) {
        if (rowObject == null)
            return;

        // Bug/PBI 37597 - Don't select rows that are hidden via the Quick Find feature.
        var row = jQuery(rowObject);
        if (row != null && row.css('display') != undefined && row.css('display') == 'none')
            return;

        addClass(rowObject, "selected");
        removeClass(rowObject, "hover");

        if (this.SelectRowLastId === rowObject.id) {
            this.UpdateMenu();
            return;
        }
        this.SelectRowLastId = rowObject.id;

        if (!suppressEvent) {
            this.UpdateSummary(rowObject.parentNode.parentNode);
            this.UpdateEdit(rowObject.parentNode.parentNode);
            this.UpdateMenu();
        }
    };
    this.SelectDefaultDocument = function () {
        var defaultSelectedKey = $('DefaultSelectedDocumentKey').value;
        if (defaultSelectedKey) {
            this.RowClick($(defaultSelectedKey), null);
        }
    };
    this.DeselectRow = function (rowObject, suppressEvent) {
        removeClass(rowObject, 'selected');

        if (!suppressEvent) {
            var selectedRows = this.GetSelectedRows(rowObject.parentNode.parentNode);
            if (selectedRows.length == 1) {
                this.SelectRow(selectedRows[0]);
            }
            else {
                this.UpdateSummary(rowObject.parentNode.parentNode);
                this.UpdateEdit(rowObject.parentNode.parentNode);
                this.UpdateMenu();
            }
        }
    };
    this.ShowEdit = false;
    this.ShowSummary = false;
    this.EditFrameClientID = null;
    this.ContentEditFrameClientID = null;
    this.BlankUrl = null;
    this.SingleClickAction = null;
    this.UpdateEdit = function (grid) {
        if (this.ShowEdit) {
            var editFrame = document.getElementById(this.EditFrameClientID);
            if (!editFrame)  // This can happen if we went from showing the edit frame to not, for example by clicking the Recycle Bin.
            {
                return;
            }

            var selectedRows = this.GetSelectedRows(grid);

            if (selectedRows.length == 1) {
                var item = this.DocumentObjectFromRow(selectedRows[0]);
                this.LoadEditPane(item, this.SingleClickAction, 'E');
            }
            else {
                this.LoadEditPane_Succeeded(this.BlankUrl, null, null);

                var message = '';
                if (!selectedRows.length) {
                    message = 'Select an item to edit.';
                }
                else if (!this.ShowSummary) {
                    message = '<b>' + selectedRows.length + '</b> items selected';
                }
                //WriteSummaryFrameMessage(message);
                var ob = this;
                window.setTimeout(function () { ob.WriteEditFrameMessage(message); }, 50);
            }
        }
    };
    this.UpdateSummary = function (grid) {
        if (this.ShowSummary) {
            var selectedRows = this.GetSelectedRows(grid);
            if (selectedRows.length == 1) {
                var item = this.DocumentObjectFromRow(selectedRows[0]);
                this.LoadSummaryPane(item, this.SingleClickAction, 'E');
            }
            else {
                this.LoadSummaryPane_Succeeded(this.BlankUrl, null, null);

                var message = '';
                if (!selectedRows.length) {
                    message = 'Select an item to view its summary information.';
                }
                else {
                    message = '<b>' + selectedRows.length + '</b> items selected';
                }

                //WriteSummaryFrameMessage(message);    
                var ob = this;
                window.setTimeout(function () { ob.WriteSummaryFrameMessage(message); }, 50);
            }
        }
    };
    this.SummaryFrameClientID = null;
    this.WriteSummaryFrameMessage = function (message) {
        var summaryFrame = document.querySelectorAll('[id$="_SummaryFrame"]');
        summaryFrame = summaryFrame[0];
        if (summaryFrame.contentWindow) {
            summaryFrame.contentWindow.document.open();
            summaryFrame.contentWindow.document.writeln(message);
            summaryFrame.contentWindow.document.close();
        }
    };
    this.WriteEditFrameMessage = function (message) {
        var editFrame = document.getElementById(this.EditFrameClientID);

        if (editFrame.contentWindow) {
            editFrame.contentWindow.document.open();
            editFrame.contentWindow.document.writeln(message);
            editFrame.contentWindow.document.close();
        }
    };
    this.SelectAllRows = function (grid) {
        if (!grid) {
            grid = $(this.ContentListID);
        }

        var allRows = grid.rows;
        for (var i = 0; i < allRows.length - 1; i++) {
            this.SelectRow(allRows[i], true);
        }
        this.SelectRow(allRows[i], false);
    };
    this.DeselectAllRows = function (grid) {
        var selectedRows = this.GetSelectedRows(grid);
        if (!selectedRows.length) {
            return;
        }
        for (var i = 0; i < selectedRows.length; i++) {
            this.DeselectRow(selectedRows[i], true);
        }
    };
    // called when double-clicking a Folder in the content
    // list pane
    this.SelectNode = function (hierarchyKey) {
        var selectedNode = this.GetSelectedNode();
        if (selectedNode) {
            selectedNode.unselect();
        }

        var treeView = $find(this.RadTreeViewClientID);
        var node = treeView.findNodeByValue(hierarchyKey);
        if (node != null) {
            node.select();
            node.expand();
            $('CurrentHierarchyKey').value = node.get_value();
            InitiatePostBack(this.SelectNodeButtonID, node.get_value());
        }
    };
    // returns currently selected treeview node
    this.GetSelectedNode = function () {
        try {
            var treeViewInstance = $find(this.RadTreeViewClientID);

            if (treeViewInstance.get_selectedNode()) {
                return treeViewInstance.get_selectedNode();
            }
        }
        catch (e) {
            // The tree may not be visible...
        }

        return null;
    };
    this.TreeViewBeforeClick = function (sender, eventArgs) {
        var node = eventArgs.get_node();
        if (!node.get_enabled()) {
            eventArgs.set_cancel(true);
        }
    };
    this.TreeViewAfterClick = function (sender, eventArgs) {
        var node = eventArgs.get_node();
        if (!node.get_expanded()) {
            node.expand();
        }

        if (this.ClickedNode == node.get_value()) {
            return;
        }

        $('CurrentHierarchyKey').value = node.get_value();
        this.ClickedNode = node.get_value();
        InitiatePostBack(this.SelectNodeButtonID, node.get_value());
    };
    this.ShowNonContainersInHierarchyTree = false;
    this.TreeViewBeforeDoubleClick = function (sender, eventArgs) {
        var node = eventArgs.get_node();
        if (this.ShowNonContainersInHierarchyTree) {
            if (!(node.get_attributes().getAttribute("data-DocumentTypeCode") == 'FOL' ||
            node.get_attributes().getAttribute("data-DocumentTypeCode") == 'CFL' ||
            (node.get_attributes().getAttribute("data-DocumentTypeCode") == 'SRT' &&
                node.get_attributes().getAttribute("data-RelatedDocumentTypeCode") == 'FOL'))) {
                var currentNode = this.GetSelectedNode();
                var currentFolder = null;
                if (currentNode) {
                    currentFolder = this.DocumentObjectFromNode(currentNode);
                }
                this.PerformAction(this.DoubleClickAction, [currentFolder], currentFolder);
            }
        }
    };
    this.SelectNodeCollapsedButtonID = null;
    this.TreeViewAfterToggle = function (sender, eventArgs) {
        var node = eventArgs.get_node();
        // If collapsing a node and one of its descendents is the current 
        // selected node, then select the collapsing node instead.
        var selectedNode = this.GetSelectedNode();
        if (selectedNode) {
            var ancestorNode = selectedNode.get_parent();
            while (ancestorNode) {
                if (node == ancestorNode) {
                    selectedNode.unselect();
                    node.select();
                    $('CurrentHierarchyKey').value = node.get_value();
                    InitiatePostBack(this.SelectNodeCollapsedButtonID, node.get_value());
                    break;
                }

                ancestorNode = ancestorNode.get_parent();
            }
        }
    };
    this.ScrollToSelectedNode = function () {
        var selectedNode = this.GetSelectedNode();
        if (selectedNode) {
            window.setTimeout(function () { selectedNode.scrollIntoView(); }, 50);
        }
    };
    this.PathSeparator = "/";
    this.GetCurrentPath = function () {
        var selectedNode = this.GetSelectedNode();
        if (selectedNode) {
            var result = selectedNode.get_attributes().getAttribute("data-DocumentName");
            while (selectedNode.get_parent() != selectedNode.get_treeView()) {
                selectedNode = selectedNode.get_parent();
                result = selectedNode.get_attributes().getAttribute("data-DocumentName") + this.PathSeparator + result;
            }
            return result;
        }
        return "";
    };
    this.HierarchyAddTypeAfterAsSibling = "";
    this.HierarchyAddTypeBeforeAsSibling = "";
    this.HierarchyAddTypeAsLastChild = "";
    this.TreeViewDrop = function (e, eventArgs) {
        var destNode = eventArgs.get_destNode();
        var dropPosition = eventArgs.get_dropPosition();

        if (!destNode) {
            return false;
        }

        //Ensure that dragging anywhere in root will result in "over" as dropPosition
        // otherwise stored procedure "asi_HierarchyMoveBranch" may cause dragged node to disappear
        if (typeof (destNode._element._item) !== "undefined") {
            var isRoot = destNode._element._item._isFirstRootNode();
            if (isRoot) {
                dropPosition = "over";
            }
        }

        var isCtrl = IsCtrl(e);

        var addType;
        switch (dropPosition) {
            case "below":
                addType = this.HierarchyAddTypeAfterAsSibling;
                break;
            case "above":
                addType = this.HierarchyAddTypeBeforeAsSibling;
                break;
                //case "over":      
            default:
                addType = this.HierarchyAddTypeAsLastChild;
                break;
        }

        $("HierarchyAddType").value = addType;

        var selectedItem = this.DocumentObjectFromNode(destNode);
        if ($("SelectedKeys").value.length === 0) {
            alert('Error: Nothing set in SelectedKeys');
        }
        else if (selectedItem.CanPaste) {
            var sourceKey = $('SelectedKeys').value;
            if (selectedItem.HierarchyKey == sourceKey) {
                return false;
            }

            document.getElementById("ClipboardCutCopy").value = isCtrl ? 'copy' : 'cut';
            this.ClipboardOperationTargetHierarchyKey = selectedItem.HierarchyKey;
            var ob = this;
            PageMethods.CheckForPasteConflict(document.getElementById("SelectedKeys").value, selectedItem.HierarchyKey, function (showConflictDialog, userContext, methodName) { ob.CheckForPasteConflict_Succeeded(showConflictDialog, userContext, methodName); }, function (error, userContext, methodName) { ob.OnFailed(error, userContext, methodName); });
        }

        return false;
    };
    this.TreeViewDrag = function (sender, eventArgs) {
        var sourceNode = eventArgs.get_node();
        if (window.event && window.event.button == 2) {
            return;
        }
        document.getElementById("SelectedKeys").value = '';

        var doc = this.DocumentObjectFromNode(sourceNode);
        if (doc && (doc.CanCopy || doc.CanCut)) {
            document.getElementById("SelectedKeys").value = doc.HierarchyKey; // doc.DocumentVersionKey;
        }
    };
    this.GridContextMenuClick = function (sender, args) {
        var selectedRows = this.GetSelectedRows();
        var selectedItems = []; //this creates a new array
        if (selectedRows && selectedRows.length > 0) {
            for (var i = 0; i < selectedRows.length; i++) {
                selectedItems.push(this.DocumentObjectFromRow(selectedRows[i]));
            }
        }

        var ob = this;
        window.setTimeout(function () { ob.PerformAction(args._item.get_value(), selectedItems, null); }, 150);
    };
    this.TreeViewContextMenuClick = function (sender, args) {
        var selectedFolder = this.DocumentObjectFromNode(this.GetSelectedNode());
        var selectedItems = new Array(selectedFolder);

        var ob = this;
        if (args._menuItem._attributes && args._menuItem._attributes.getAttribute("DocumentType")) {
            window.setTimeout(function () { ob.PerformAction(args._menuItem.get_value(), selectedItems, selectedFolder, args._menuItem._attributes.getAttribute("DocumentType")); }, 150);
        }
        else {
            window.setTimeout(function () { ob.PerformAction(args._menuItem.get_value(), selectedItems, selectedFolder); }, 150);
        }
    };
    this._startX = 0;            // mouse starting positions
    this._startY = 0;
    this._dragElement = null;           // needs to be passed from OnMouseDown to OnMouseMove
    this._dragStarted = false;
    this._clickTarget = null;
    this._fireRowClick = false;
    this.RowMouseDown = function (target, e, isRecycle, canDragAndDrop) {

        if (!e) {
            e = window.event;
        }

        //Debug('target', target.id);
        this._clickTarget = target;

        // for IE, left click == 1
        // for Firefox, left click == 0
        if ((e.button == 1 && window.event) || e.button === 0) {
            // grab the mouse position
            this._startX = e.clientX;
            this._startY = e.clientY;

            // tell our code to start moving the element with the mouse
            var thisClassInstance = this;
            // don't hook up the dragNdrop of content if our container is the recycle bin
            if (isRecycle == "false" && canDragAndDrop == "true") {
                document.onmousemove = function (e) { thisClassInstance.OnMouseMove(e); };
            }
            document.onmouseup = function (e) { thisClassInstance.OnMouseUp(e); };
            document.onselectstart = function () { return false; };

            if (!IsCtrl(e) && !this.IsSelected(target)) {
                this.RowClick(target, e);
            } else {
                this._fireRowClick = true;
            }

            // prevent text selection (except IE)
            return false;
        }
    };
    this.OnMouseMove = function (e) {
        if (window.event) {
            e = window.event;
        }
        else {
            return;
        }

        if (!this.ShowMenu) {
            return;
        }
        if (!this._dragStarted) {
            if ((Math.abs(e.clientX - this._startX) > 3) || (Math.abs(e.clientY - this._startY) > 3)) {
                this._dragStarted = true;
                this._dragElement = document.createElement('div');
                this._dragElement.className = 'dragContainer';
                document.body.appendChild(this._dragElement);

                // Select the node under the mouse if not already selected
                if (!this.IsSelected(this._clickTarget)) {
                    this.SelectRow(this._clickTarget);
                }

                // Get the selected rows that we're gonna drag
                var dragElements = this.GetSelectedRows(this._clickTarget.parentNode.parentNode);
                var docItems = [];
                for (var i = 0; i < dragElements.length; i++) {
                    var doc = this.DocumentObjectFromRow(dragElements[i]);
                    if (doc.CanCopy || doc.CanCut) {
                        docItems.push(doc);
                    }
                    else {
                        _DebugTrace('Drag not allowed: ' + dragElements.innerText);
                        continue;
                    }

                    // replace the row with a clone and drag it around instead of the original
                    // var clone = dragElements[i].cells[0].firstChild.cloneNode(true);
                    var clone = dragElements[i].cells[0].cloneNode(true);
                    clone.className = 'dragItem';
                    this._dragElement.appendChild(clone);
                }

                // set selected keys
                $('SelectedKeys').value = '';
                $('SelectedKeys').value = this.GetHierarchyKeysString(docItems);
            }
        }

        if (this._dragStarted && this._dragElement && this._dragElement.childNodes.length) {
            this._dragElement.style.left = (e.clientX + 10) + 'px';
            this._dragElement.style.top = (e.clientY + 5) + 'px';
        }
    };
    this.OnMouseUp = function (e) {
        if (window.event) {
            e = window.event;
        }
        if (this._dragStarted && this._dragElement && this._dragElement.childNodes.length > 0) {
            var tree = $find(this.RadTreeViewClientID);
            var treeId = this.RadTreeViewClientID;
            // See if we're dropping on a node, by going up the element chain until we hit the RadTreeView or run out of parents
            var inTree = false;
            var parent = null;
            if (e.srcElement == null)
                // Firefox
                parent = e.target;
            else
                // Other browsers
                parent = e.srcElement;
            var nodeLI = null;
            while (parent) {
                // If we pass an LI with class rtLI, save it as it's probably the RadTreeViewNode element.
                if (!nodeLI && parent.tagName == "LI" && parent.className.substring(0, 4) == "rtLI") {
                    nodeLI = parent;
                }
                if (parent.id == treeId) {
                    inTree = true;
                    break;
                }
                parent = parent.parentNode;
            }

            if (inTree) {
                // NOTE: this is a specific implementation for the RadTreeView.
                // If we change to a new version of RadTreeView or another control altogether
                // then this will most likely need to be updated.

                // Find the node that contains the nodeLI we found above.
                var nodes = tree.get_allNodes();
                var node = null;
                for (var i = 0; i < nodes.length; i++) {
                    if (nodes[i].get_element() == nodeLI) {
                        node = nodes[i];
                        break;
                    }
                }

                if (node) {
                    var targetHierarchyKey = node.get_value();
                    var canPaste = node.get_attributes().getAttribute("data-CanPaste") == 'true';
                    // Perform the action (copy/move)
                    if (targetHierarchyKey && canPaste) {
                        var sourceKey = $('SelectedKeys').value;
                        if (sourceKey.length === 0) {
                            alert('Error: Nothing set in SelectedKeys');
                        }
                        else if (sourceKey.indexOf(targetHierarchyKey) > -1) {
                            alert('Error: Cannot drop an item onto itself');
                        }
                        else {
                            document.getElementById("ClipboardCutCopy").value = IsCtrl(e) ? 'copy' : 'cut';
                            this.ClipboardOperationTargetHierarchyKey = targetHierarchyKey;
                            var ob = this;
                            PageMethods.CheckForPasteConflict(document.getElementById("SelectedKeys").value, targetHierarchyKey, function (showConflictDialog, userContext, methodName) { ob.CheckForPasteConflict_Succeeded(showConflictDialog, userContext, methodName); }, function (error, userContext, methodName) { ob.OnFailed(error, userContext, methodName); });
                        }
                    }
                }
            }
        }
        else if (this._fireRowClick) {
            this.RowClick(this._clickTarget, e);
        }

        // reset variables
        if (this._dragElement) {
            document.body.removeChild(this._dragElement);
        }
        this._dragElement = null;
        this._dragStarted = false;
        this._clickTarget = null;
        this._fireRowClick = false;

        // we're done with these events until the next OnMouseDown
        document.onmousemove = null;
        document.onmouseup = null;
        document.onselectstart = null;
    };
    this.KeyboardShortcut = function (e) {
        var keyNum;
        var keyChar;
        var isCtrl = IsCtrl(e);
        var isAlt = false;

        if (window.event) // IE
        {
            e = window.event;
            keyNum = e.keyCode;
            isAlt = e.altKey;

        }
        else if (e.which) // Netscape/Firefox/Opera
        {
            keyNum = e.which;
            isAlt = (e.modifiers & Event.ALT_MASK == Event.ALT_MASK);
        }

        if (keyNum == 17 || keyNum == 18) //ctrl, alt
        {
            return;
        }

        keyChar = String.fromCharCode(keyNum).toLowerCase();

        var action = null;
        if (isCtrl) {
            switch (keyChar) {
                case 'c':
                    action = this.CopyAction;
                    break;
                case 'x':
                    action = this.CutAction;
                    break;
                case 'v':
                    action = this.PasteAction;
                    break;
                case 'z':
                    action = this.UndoAction;
                    break;
                case 'r':
                    action = this.RefreshAction;
                    break;
                case 'a':
                    action = this.SelectAllAction;
                    break;
                case 'e':
                    action = this.EditAction;
                    break;
                case 'p':
                    action = this.SelectAction;
                    break;
            }
        }
        else {
            switch (keyNum) {
                case 45: // insert
                    action = this.NewAction;
                    break;
                case 46: // delete
                    action = this.DeleteAction;
                    break;
                    //                case 113: // rename (F2)     
                    //                    action = 'rename';     
                    //                    break;     
            }
        }

        if (action) {
            var currentFolder = null;
            var selectedItems = [];
            var selectedRows = this.GetSelectedRows();

            if (selectedRows && selectedRows.length > 0) {
                for (var i = 0; i < selectedRows.length; i++) {
                    selectedItems.push(this.DocumentObjectFromRow(selectedRows[i]));
                }
            }
            else {
                var selectedNode = this.GetSelectedNode();
                if (selectedNode) {
                    currentFolder = this.DocumentObjectFromNode(selectedNode);
                    selectedItems.push(currentFolder);
                }
            }

            if (window.event) {
                window.event.returnValue = false;
            }

            return this.PerformAction(action, selectedItems, currentFolder);
        }

        return true;
    };
    this.actionSelectedItems = null;
    this.actionCurrentFolder = null;
    this.ShowActionForm = function (action, selectedItems, currentFolder, singleSelect, confirmMessage) {
        // handle nothing selected
        if (!selectedItems || selectedItems.length === 0) {
            alert(this.MessageNothingSelected);
            return;
        }

        // handle single-item actions
        if (singleSelect && selectedItems.length > 1) {
            alert(this.MessageMoreThanOneSelected);
            return;
        }

        // handle confirm message   
        if (confirmMessage && confirmMessage.length > 0) {
            //Add Selected items to delete to confirm message
            if (action == 'delete' && this.ExistsBO(selectedItems)) {
                confirmMessage = 'Are you sure you want to delete the following child branch from the specified root business object?\n';
                for (var i = 0; i < selectedItems.length; i++) {
                    if (selectedItems[i].DocumentTypeCode == 'DBB') {
                        confirmMessage += '\n\t\t' + selectedItems[i].DocumentName + ' (a branch of ' + selectedItems[i].ParentName + ' )';
                    }
                    else {
                        confirmMessage += '\n\t\t' + selectedItems[i].DocumentName + ' (a root business object)';
                    }
                }
                confirmMessage += '\n\nThis will permanently remove the specified branch and set the status of the root business object and any remaining branches to "Working". The changes will not affect the live system until you publish the root business object.\n\nPress OK to delete the specified branch, or Cancel to leave the business object unchanged.';
            }
            if (!confirm(confirmMessage)) {
                return;
            }
        }

        var item = selectedItems[0];
        var type = item.DocumentTypeCode;

        this.actionSelectedItems = selectedItems;
        this.actionCurrentFolder = currentFolder;

        var currentFolderHierarchyKey = $('CurrentHierarchyKey').value;
        if (currentFolder) {
            currentFolderHierarchyKey = currentFolder.HierarchyKey;
        }

        var pageInstanceKey = $get('PageInstanceKey');
        if (pageInstanceKey) {
            pageInstanceKey = pageInstanceKey.value;
        }
        else {
            pageInstanceKey = this.NewGuid();
        }

        var websiteKey = gWebsiteKey;
        if (!websiteKey) {
            websiteKey = this.EmptyGuid;
        }

        var ob = this;
        actionLink = PageMethods.GetWindowProperties(action, 'E', type, item.HierarchyKey, item.DocumentVersionKey, currentFolderHierarchyKey, selectedItems.length, this.CloseOnCommit(type, action), websiteKey, pageInstanceKey, function (result, userContext, methodName) { ob.GetWindowProperties_Succeeded(result, userContext, methodName); }, function (error, userContext, methodName) { ob.OnFailed(error, userContext, methodName); });
    };
    this.ExistsBO = function (selectedItems) {
        for (var i = 0; i < selectedItems.length; i++) {
            if ((selectedItems[i].DocumentTypeCode == 'DBB') || (selectedItems[i].DocumentTypeCode == 'BOD')) {
                return true;
            }
        }
        return false;
    };
    this.CloseOnCommit = function (type, action) {
        // I like it how it closes the dialog window when clicking save on a new item, uncomment
        // the second line here to only do this for certain doc types.
        return action == this.NewAction && type != 'BOD';
        //&& (type == 'FOL' || type == 'NAV' || type == 'CON' || type == 'CFL');
    };
    this.ShowNewForm = function (currentFolder, type) {
        var currentFolderHierarchyKey = $('CurrentHierarchyKey').value;
        if (currentFolder) {
            currentFolderHierarchyKey = currentFolder.HierarchyKey;
        }

        var pageInstanceKey = $get('PageInstanceKey');
        if (pageInstanceKey) {
            pageInstanceKey = pageInstanceKey.value;
        }
        else {
            pageInstanceKey = this.NewGuid();
        }

        var websiteKey = gWebsiteKey;
        if (!websiteKey) {
            websiteKey = this.EmptyGuid;
        }

        var ob = this;
        actionLink = PageMethods.GetWindowProperties(this.NewAction, 'E', type, this.EmptyGuid, this.EmptyGuid, currentFolderHierarchyKey, 1, this.CloseOnCommit(type, this.NewAction), websiteKey, pageInstanceKey, function (result, userContext, methodName) { ob.GetWindowProperties_Succeeded(result, userContext, methodName); }, function (error, userContext, methodName) { ob.OnFailed(error, userContext, methodName); });
    };
    this.refreshRequested = false;
    this.AllowUpwardNavigation = false;
    this.MaxFileUploadSize = 0;
    this.EmbeddedMode = false;
    this.GetWindowProperties_Succeeded = function (result, userContext, methodName) {
        var documentKeys = null;
        var url = result.Url;

        if (url == "about:blank") {
            return;
        }
        if (this.actionSelectedItems && this.actionSelectedItems.length > 0) {
            //Adds a new value optional to say that is a delete
            if (result.WindowName == "DELETE") {
                documentKeys = this.GetDocumentVersionKeysString(this.actionSelectedItems, true);
            }
            else {
                documentKeys = this.GetDocumentVersionKeysString(this.actionSelectedItems, false);
            }
            if (url.indexOf('{1}') > -1 && this.actionSelectedItems.length == 1) {
                url = url.replace('{1}', this.actionSelectedItems[0].DocumentName);
            }
        }
        else if (this.actionCurrentFolder) {
            documentKeys = this.actionCurrentFolder.DocumentVersionKey;
        }

        this.refreshRequested = result.RefreshRequested;

        if (!this.AllowUpwardNavigation) {
            url += "&iAllowUpwardNavigation=False";
        }

        if (!this.ShowHierarchyTree) {
            url += "&iShowFolderTree=False";
        }

        // Tack on the max filesize
        url += "&MaxFileUploadSize=" + this.MaxFileUploadSize;

        if (result.WindowName == "EXECUTE" && this.EmbeddedMode) {
            window.location.href = url + "&EmbeddedMode=True";
        }
        else if (result.NewWindow) {
            var newWindow = window.open(url, '_blank');
            newWindow.focus();
        }
        else if (result.RedirectWindow) {
            window.location.href = url;
        }
        else {
            var ob = this;
            win = ShowDialog(url, documentKeys, result.Width, result.Height, document.title, result.IconUrl, null, function (dialogWindow) { ob.DialogWindowCallback(dialogWindow); }, 'ObjectBrowserDialog', false, false, function (dialogWindow) { ob.DialogWindowClose(dialogWindow); });
            //  win = ShowDialog(url, documentKeys, result.Width, result.Height,DocumentObject.toString(), result.IconUrl, null, DialogWindowCallback, 'ObjectBrowserDialog', false, false, DialogWindowClose);

            if (result.CloseImmediately) {
                win.Close();
            }
        }
        //ShowDialog(url, args,         width,        height,        title,               iconUrl,    templateType, callBackFunction, windowName,     closeWindowOnCommit, preserveStatefulBusinessContainer, dialogCloseFunction) 
    };
    this.SelectAndReturnValue = function () {
        this.SelectAndReturnValueWithOption(false);
    };
    this.SelectContent = null;
    this.SelectContainer = null;
    this.FilenameClientID = null;
    this.DialogMode = false;
    this.WindowClientScript = null;
    this.ShowFilename = false;
    this.SelectRowButtonClientID = null;
    this._mode = '';
    this.SelectAndReturnValueWithOption = function (useFolderIfNoRowsSelected) {
        var result, selectedRows;
        var selectedDocumentName;
        var selectedItems = this.GetSelectedItems(useFolderIfNoRowsSelected);

        if (this._mode == this.SelectContent) {
            if (!selectedItems || selectedItems.length === 0) {
                alert(this.MessageNothingSelected);
                return;
            }
            result = this.GetDocumentVersionKeysString(selectedItems, false);
            selectedDocumentName = selectedItems[0].DocumentName;
        }
        else if (this._mode == this.SelectContainer) {
            var selectedNode = this.GetSelectedNode();
            if (selectedNode) {
                result = selectedNode.get_value();
                selectedDocumentName = selectedNode.get_text();
            }
            else // no node returned; possibly because treeview is hidden in Desktop IQA embedded mode
            {
                // See if the user has a folder selected
                result = $('CurrentHierarchyKey').value;

                selectedRows = this.GetSelectedRows();
                var selectedDocument = null;
                if (selectedRows && selectedRows.length && selectedRows.length == 1) {
                    selectedDocument = this.DocumentObjectFromRow(selectedRows[0]);
                    if (selectedDocument.IsContainer) {
                        result = selectedDocument.HierarchyKey;
                    }
                }
                if (!result || trim(result) === '') {
                    result = this.FindURLParameter('FolderHierarchyKey');
                }
                selectedDocumentName = trim(document.getElementById(this.FilenameClientID).value);
            }
        }

        if (this.DialogMode) {
            var oWindow = this.WindowClientScript;

            oWindow.SelectedDocumentName = trim(selectedDocumentName);

            // Calculate full path. If no rows are selected, Document must have been selected from
            // the TreeView. In this case, don't concatenate the name to the path.
            selectedRows = this.GetSelectedRows();
            if (selectedRows && selectedRows.length > 0) {
                oWindow.UserSelectedAPathAndFile = true;
                oWindow.SelectedDocumentPath = trim(this.GetCurrentPath() + this.PathSeparator + selectedDocumentName);
            }
            else {
                oWindow.SelectedDocumentPath = trim(this.GetCurrentPath());
                oWindow.SelectedDocumentVersionKey = trim(this.GetDocumentVersionKeysString(selectedItems, false));
            }

            if (this.ShowFilename) {
                oWindow.Filename = trim(document.getElementById(this.FilenameClientID).value);
            }
            oWindow.result = result;
            oWindow.close();
        }
        else {
            this.SetSelectedKeys(selectedItems);

            var selectRowButton = document.getElementById(this.SelectRowButtonClientID);
            selectRowButton.click();
        }
    };
    this.CloseDialogWindow = function () {
        var oWindow = this.WindowClientScript;
        if (oWindow) {
            CloseRadWindow();
        }
    };
    // Callback function invoked on failure 
    // of the page method.
    this.OnFailed = function (error, userContext, methodName) {
        if (error) {
            if (error._statusCode === 401) {
                alert('Your session has timed out, or there was an authentication error. Please sign in again.');
            } else {
                alert('Action failed (' + methodName + '): ' + error._message);
            }
        }
        else {
            alert('Action failed without an error message (' + methodName + ').');
        }
    };
    this.LoadSummaryPane = function (item, action, templateType) {
        var pageInstanceKey = $get('PageInstanceKey');
        if (pageInstanceKey) {
            pageInstanceKey = pageInstanceKey.value;
        }
        else {
            pageInstanceKey = this.NewGuid();
        }

        var websiteKey = gWebsiteKey;
        if (!websiteKey) {
            websiteKey = this.EmptyGuid;
        }

        var ob = this;
        PageMethods.GetActionLink(action, templateType, item.DocumentTypeCode, item.HierarchyKey, item.DocumentVersionKey, this.EmptyGuid, 1, false, websiteKey, pageInstanceKey, function (result, userContext, methodName) { ob.LoadSummaryPane_Succeeded(result, userContext, methodName); }, function (error, userContext, methodName) { ob.OnFailed(error, userContext, methodName); });
    };
    this.LoadSummaryPane_Succeeded = function (result, userContext, methodName) {
        var summaryFrame = document.querySelectorAll('[id$="_SummaryFrame"]');
        summaryFrame = summaryFrame[0];
        if (summaryFrame != null && summaryFrame.src.toLowerCase() != result.toString().toLowerCase()) {
            summaryFrame.src = result;
        }
    };
    this.LoadEditPane = function (item, action, templateType) {
        var pageInstanceKey = $get('PageInstanceKey');
        if (pageInstanceKey) {
            pageInstanceKey = pageInstanceKey.value;
        }
        else {
            pageInstanceKey = this.NewGuid();
        }

        var websiteKey = gWebsiteKey;
        if (!websiteKey) {
            websiteKey = this.EmptyGuid;
        }
        var ob = this;
        PageMethods.GetActionLink(action, templateType, item.DocumentTypeCode, item.HierarchyKey, item.DocumentVersionKey, this.EmptyGuid, 1, false, websiteKey, pageInstanceKey, function (result, userContext, methodName) { ob.LoadEditPane_Succeeded(result, userContext, methodName); }, function (error, userContext, methodName) { ob.OnFailed(error, userContext, methodName); });
    };
    this.ObjectBrowserEmbeddedModeToken = '';
    this.LoadEditPane_Succeeded = function (result, userContext, methodName) {
        // HACK: Content Designer specific query string params to be passed
        // to the inline edit frame.
        var contentItemKey = FindURLParameter('ContentItemKey');
        var defaultPanel = FindURLParameter('DefaultPanel');

        if (contentItemKey) {
            result += '&ContentItemKey=' + contentItemKey;
        }

        if (defaultPanel) {
            result += '&DefaultPanel=' + defaultPanel;
        }

        result += '&' + this.ObjectBrowserEmbeddedModeToken + '=true';

        var contentEditFrame = document.getElementById(this.ContentEditFrameClientID);
        contentEditFrame.src = result;

    };
    this.SubPage_Committed = function () {
        if (this.ShowHierarchyTree) {
            this.RefreshNode();
        }
    };
    this.MainMenu_ItemClose = function (menu, eventArgs) {
    };
    this.FindDescendantElement = function (node, tagNameToLookFor, classNameToLookFor) {
        var checkFunction, i;
        if (isArray(tagNameToLookFor)) {
            for (i = 0; i < tagNameToLookFor.length; ++i) {
                tagNameToLookFor[i] = tagNameToLookFor[i].toLowerCase();
            }
            checkFunction = function (tagName) { return jQuery.inArray(tagName, tagNameToLookFor) > -1; };
        }
        else {
            checkFunction = function (tagName) { return !tagNameToLookFor || tagNameToLookFor.toLowerCase() == iterator.tagName.toLowerCase(); };
        }

        var queue = [node];
        var idx = 0;
        while (true) {
            var iterator = queue[idx++];
            if (!iterator) {
                break;
            }
            if (!iterator.tagName) {
                continue;
            }
            if (checkFunction(iterator.tagName.toLowerCase())) {
                if (!classNameToLookFor || classNameToLookFor.length === 0 || jQuery.inArray(classNameToLookFor.toLowerCase(), iterator.className.toLowerCase().split(' ') > -1)) {
                    return iterator;
                }
            }
            for (i = 0; i < iterator.childNodes.length; ++i) {
                queue.push(iterator.childNodes[i]);
            }

            if (idx >= queue.length) {
                break;
            }
        }

        return null;
    };
    this.NewGuid = function () {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        }).toUpperCase();

    };
    this.ObjectQuickFindTextBoxID = null;
    this.ClearObjectQuickFindTextBox = function () {
        jQuery('#' + this.ObjectQuickFindTextBoxID).val('');
    };
    this.RemoveMainMenuElementTabIndex = function () {
        // remove tabindex attribute to fix navigation tabbing issue
        var clientId = this.MainMenuClientID;

        // null and attribute existence checks
        if (clientId != null && jQuery('#' + clientId).attr('tabindex') !== undefined) {
            jQuery('#' + clientId).removeAttr('tabindex');
        }
    }
} /* ObjectBrowserClass */

function searchTable(inputVal) {
    var table = jQuery('table[ID $= "ContentList"]');
    table.find('tr').each(function (index, row) {
        var allCells = jQuery(row).find('td');
        if (allCells.length > 0) {
            var found = false;
            allCells.each(function (index, td) {
                var regExp = new RegExp(inputVal, 'i');
                if (regExp.test(jQuery(td).text())) {
                    found = true;
                    return false;
                }
            });
            if (found == true) jQuery(row).show(); else jQuery(row).hide();
        }
    });
}
