function PanelDesignerClass() 
{
    /*
    The following behavior is expected:
    - The state of the 'RadioButtonShow...' radio buttons affect which tables are displayed in the treeview. 
        If RadioButtonShowSingle is selected, only single instance tables will be displayed.
        If RadioButtonShowMultiple is selected, only multiple instance tables will be displayed.
    - When the radio button selection changes, all previously selected fields are cleared.
    - When a multiple instance field is selected, all other multiple instance table nodes will be disabled.
    - When the last selected field is removed, or if the radio buttons changes state, any previously disabled
        nodes will be re-enabled.  
    */

    this.GridLayoutId;
    this.RadioButtonShowSingleId;
    this.RadioButtonShowMultipleId;
    this.TreeTablesId;
    this.HiddenPanelDefinitionId;
    this.ButtonColumnsPlusId;
    this.ButtonColumnsMinusId;
    this.ButtonColumnsPlusGrayId;
    this.ButtonColumnsMinusGrayId;
    this.PropertyTypeStringValue;
    this.PropertyTypeDecimalValue;
    
    var panelDefinitionInstance;

    this.editSourceDialogWidth = 350;
    this.editSourceDialogHeight = 250;
    this.editPropertyDialogWidth = 800;
    // Setting height to 100% to accommodate the ObjectBrowser when selecting a query
    this.editPropertyDialogHeight = "90%";

    /////////////////////////////////////////////////////////////
    // Event handler for when a tree node is dropped.
    //
    this.TreeTables_NodeDropping = function(sender, eventArgs) {
        // Verify that the drop location is as expected.
        var dropTarget = eventArgs.get_htmlElement();
        // Climb up the control hierarchy and find the element that has row and column id attributes
        while (dropTarget != null) {
            if (dropTarget.getAttribute == null) {
                dropTarget = dropTarget.parentNode;
                continue;
            }
            var rowId = dropTarget.getAttribute("ROWID");
            if (rowId == null) {
                dropTarget = dropTarget.parentNode;
                continue;
            }
            var columnId = dropTarget.getAttribute("COLID");
            break;
        }

        if (rowId == null || columnId == null)
            return;

        var nodes = eventArgs.get_sourceNodes();

        // If multiple nodes are being dropped, and they're multi-instance, can't have fields from multiple tables.
        // We can assume all nodes are of the same instance type, since the UI enforces this.
        if (nodes.length > 1) {
            var attributes = nodes[0].get_attributes();
            var isMultipleInstance = attributes.getAttribute("IsMultipleInstance");
            if (isMultipleInstance.toLowerCase() == "true") {
                // Now make sure all nodes are of the same table.
                var entityName = "";
                for (var i = 0; i < nodes.length; i++) {
                    var thisEntityName;
                    var node = nodes[i];
                    var attributes = node.get_attributes();
                    var isTable = attributes.getAttribute("IsTable");
                    if (isTable.toLowerCase() == "true")
                        thisEntityName = node.get_value();
                    else
                        thisEntityName = node.get_parent().get_value();

                    if (entityName == "")
                        entityName = thisEntityName;
                    else if (entityName != thisEntityName) {
                        alert('Cannot mix fields from different multi-instance tables.');
                        return;
                    }
                }
            }
        }

        for (var i = 0; i < nodes.length; i++) {
            if (i == 0) {
                this.AddFieldByTreeNode(nodes[i], rowId, columnId);
            }
            else {
                var rowColumn = this.GetFirstEmptyCell();
                if (rowColumn == null) {
                    alert('No more empty cells are available');
                    return;
                }
                this.AddFieldByTreeNode(nodes[i], rowColumn.RowId, rowColumn.ColumnId);
            }
        }
    };

    /////////////////////////////////////////////////////////////
    // Event handler for when a tree node is double-clicked
    //
    this.TreeTables_NodeDoubleClicked = function (sender, eventArgs) {
        var node = eventArgs.get_node();
        // Double-click event will fire for a disabled node, so catch it here.
        if (!node.get_enabled())
            return;
        var rowColumn = this.GetFirstEmptyCell();
        if (rowColumn == null) {
            alert('No empty cells are available');
            return;
        }
        this.AddFieldByTreeNode(node, rowColumn.RowId, rowColumn.ColumnId);
    };


    /////////////////////////////////////////////////////////////
    // Add a field to the grid
    //
    this.AddFieldByTreeNode = function(node, rowId, columnId) {
        this.AddFieldByTreeNodeWithProperties(node, rowId, columnId, null);
    };
    
    /////////////////////////////////////////////////////////////
    // Add a field to the grid
    //
    this.AddFieldByTreeNodeWithProperties = function (node, rowId, columnId, customizedProperties) {
        if (node == null)
            return;
        var attributes = node.get_attributes();
        var isTable = attributes.getAttribute("IsTable");
        if (isTable == null) return; // Neither a table or property node
        var isMultipleInstance = attributes.getAttribute("IsMultipleInstance");
        var isBooleanType = attributes.getAttribute("PropertyType") == "4"; //4 is the int value of Boolean type
        //alert("The source node text is: " + node.get_text() + "\n" + "The source node value is: " + node.get_value() + "\n" +
        //    "Is a table? " + isTable + "\n" + "Is multiple instance? " + isMultipleInstance);
        if (isTable.toLowerCase() == "false") {
            // Hide the node in the treeview, and add an item to the grid

            var propertyName = node.get_value();
            var caption = node.get_text();
            var entityName = node.get_parent().get_value();

            // Find the correct cell in the grid
            var gridLayout = $find(this.GridLayoutId);
            var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
            var cellTableField = row.findElement("ColumnTableField" + columnId);
            var cellLabel = row.findElement("ColumnLabelTextBox" + columnId);
            var cellReadOnly = row.findElement("ColumnReadOnlyCheckbox" + columnId);
            var cellRequired = row.findElement("ColumnRequiredCheckbox" + columnId);
            var cellHideInNormalView = row.findElement("ColumnHideInNormalViewCheckbox" + columnId);
            var cellHiddenField = row.findElement("ColumnHidden" + columnId);
            var cellContent = row.findElement("ColumnContent" + columnId);
            var emptyCellContent = row.findElement("EmptyColumnContent" + columnId);
            var cellDisplayBooleanType = row.findElement("ColumnDisplayBooleanTypeList" + columnId);
            
            if (cellHiddenField.value != "") {
                answer = confirm('Replace the current field?');
                if (!answer)
                    return;
                else
                    this.RemoveFieldFromGrid(rowId, columnId, false, false);
            }
            node.set_visible(false);
            cellTableField.innerHTML = entityName + "." + caption;
            var cellDisplayBooleanTypeLabel;
            if (customizedProperties != null) {
                cellLabel.value = customizedProperties.CustomLabel;
                cellReadOnly.checked = customizedProperties.ReadOnly;
                cellRequired.checked = customizedProperties.Required;
                cellHideInNormalView.checked = customizedProperties.HideInNormalView;
                if (cellDisplayBooleanType != null) {
                    cellDisplayBooleanTypeLabel = row.findElement("ColumnDisplayBooleanTypeLabel" + columnId);
                    if (isBooleanType) {
                        cellDisplayBooleanType.style.display = "";
                        cellDisplayBooleanTypeLabel.style.display = "";
                        //we need to populate display control types here, currently only support checkbox & radiobuttons for booleans
                        if (cellDisplayBooleanType.options == null || (cellDisplayBooleanType.options != null &&
                            cellDisplayBooleanType.options.length == 0)) {
                            try {
                                cellDisplayBooleanType.add(new Option("Checkbox", 0), null); // standards compliant; doesn't work in IE
                            } catch(ex) {
                                cellDisplayBooleanType.add(new Option("Checkbox", 0)); // IE only
                            }
                            try {
                                cellDisplayBooleanType.add(new Option("RadioButtons", 1), null); // standards compliant; doesn't work in IE
                            } catch(ex) {
                                cellDisplayBooleanType.add(new Option("RadioButtons", 1)); // IE only
                            }
                        }
                        for (var l = 0; l < cellDisplayBooleanType.options.length; l++) {
                            if (cellDisplayBooleanType.options[l].text == customizedProperties.DisplayControlType) {
                                cellDisplayBooleanType.selectedIndex = l;
                                break;
                            }
                        }
                    } else {
                        cellDisplayBooleanType.style.display = "none";
                        cellDisplayBooleanTypeLabel.style.display = "none";
                    }
                }   
            }
            else {
                cellLabel.value = caption;
                cellReadOnly.checked = false;
                cellRequired.checked = false;
                cellHideInNormalView.checked = false;
                if (cellDisplayBooleanType != null) {
                    cellDisplayBooleanTypeLabel = row.findElement("ColumnDisplayBooleanTypeLabel" + columnId);
                    if (isBooleanType) {
                        cellDisplayBooleanType.style.display = "";
                        cellDisplayBooleanTypeLabel.style.display = "";
                        //we need to populate display control types here, currently only support checkbox & radiobuttons for booleans
                        if (cellDisplayBooleanType.options == null || (cellDisplayBooleanType.options != null &&
                            cellDisplayBooleanType.options.length == 0)) {
                            try {
                                cellDisplayBooleanType.add(new Option("Checkbox", 0), null); // standards compliant; doesn't work in IE
                            } catch(ex) {
                                cellDisplayBooleanType.add(new Option("Checkbox", 0)); // IE only
                            }
                            try {
                                cellDisplayBooleanType.add(new Option("RadioButtons", 1), null); // standards compliant; doesn't work in IE
                            } catch(ex) {
                                cellDisplayBooleanType.add(new Option("RadioButtons", 1)); // IE only
                            }
                        }
                        cellDisplayBooleanType.selectedIndex = 0;
                        //since we default booleans to checkbox we need to disable required checkbox
                        cellRequired.disabled = true;
                        var cellRequiredLabel = row.findElement("ColumnRequiredLabel" + columnId);
                        if (cellRequiredLabel != null)
                            cellRequiredLabel.setAttribute("disabled", "disabled");
                    }
                    else {
                        cellDisplayBooleanType.style.display = "none";
                        cellDisplayBooleanTypeLabel.style.display = "none";
                    }
                }
            }
            // Note that the hidden field value is important here. It will be used to find the node later on,
            // since this value will match the tree node "TreeNodeId" attribute.
            cellHiddenField.value = entityName + "." + propertyName;
            cellContent.style.display = "block";
            emptyCellContent.style.display = "none";
            panelDefinitionInstance.AddFieldToPanelDefinition(rowId, columnId, propertyName, cellLabel.value,
                entityName, cellReadOnly.checked, cellRequired.checked, cellHideInNormalView.checked, 
                ((cellDisplayBooleanType != null && cellDisplayBooleanType.options.length > 0)
                    ? cellDisplayBooleanType.options[cellDisplayBooleanType.selectedIndex].value : null), isMultipleInstance);

            // If we've added a multi-instance field, disable all other tables in the treeview.
            if (isMultipleInstance.toLowerCase() == "true") {
                this.SetTableNodeEnableState(false, node.get_parent());
            }

            // Make sure the row after this row is visible.
            var rowAfter = gridLayout.get_masterTableView().get_dataItems()[parseInt(rowId) + 1];
            if (rowAfter != null)
            // NOTE: don't set this to 'block', Firefox will display rows incorrectly
                rowAfter._element.style.display = "";
        }
        else // Add all fields of the table that haven't already been added
        {
            for (var i = 0; i < node.get_nodes().get_count(); i++) {
                var childNode = node.get_nodes().getNode(i);
                if (childNode.get_visible()) {
                    // We'll add the first node to the drop location, and subsequent nodes to the first empty cells.
                    if (i == 0) {
                        this.AddFieldByTreeNode(childNode, rowId, columnId);
                    }
                    else {
                        var rowColumn = this.GetFirstEmptyCell();
                        if (rowColumn == null) {
                            alert('No more empty cells are available');
                            return;
                        }
                        this.AddFieldByTreeNode(childNode, rowColumn.RowId, rowColumn.ColumnId);
                    }
                }
            }
        }
    };

    /////////////////////////////////////////////////////////////
    // Source was renamed. Find all cells on panel and update appropriately
    //
    this.UpdateSourceOnPanel = function (sourceNode, oldSourceName, newSourceName) {
        for (var i = 0; i < sourceNode.get_nodes().get_count(); i++) {
            var nodeToUpdateOnPanel = sourceNode.get_nodes().getNode(i);
            if (nodeToUpdateOnPanel.get_visible())
            // If node is visible, it's not being used
                continue;
            var coordinates = this.GetCellByTreeNodeId(oldSourceName + "." + nodeToUpdateOnPanel.get_value());
            if (coordinates == null)
                continue;
            var propertyCaption = nodeToUpdateOnPanel.get_text();
            var propertyName = nodeToUpdateOnPanel.get_value();
            var gridLayout = $find(this.GridLayoutId);
            var row = gridLayout.get_masterTableView().get_dataItems()[coordinates.RowId];
            var cellTableField = row.findElement("ColumnTableField" + coordinates.ColumnId);
            var cellHiddenField = row.findElement("ColumnHidden" + coordinates.ColumnId);
            cellTableField.innerHTML = newSourceName + "." + propertyCaption;
            // Note that the hidden field value is important here. It will be used to find the node later on,
            // since this value will match the tree node "TreeNodeId" attribute.
            cellHiddenField.value = newSourceName + "." + propertyName;
            panelDefinitionInstance.UpdateEntityNameInPanelDefinition(propertyName, oldSourceName, newSourceName);
        }
    }; /////////////////////////////////////////////////////////////
    // Handle the click event of a remove button
    //
    this.ButtonRemove_Clicked = function(rowId, columnId) {
        this.RemoveFieldFromGrid(rowId, columnId, true, true);
        return false;
    };

    /////////////////////////////////////////////////////////////
    // Handle the changed event of a Label TextBox
    //
    this.Label_Changed = function(rowId, columnId) {
        var gridLayout = $find(this.GridLayoutId);
        var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
        var cellHiddenField = row.findElement("ColumnHidden" + columnId);
        if (cellHiddenField == null || cellHiddenField.value == "")
            return;
        var cellLabelTextBox = row.findElement("ColumnLabelTextBox" + columnId);
        if (cellLabelTextBox == null)
            return;
        var node = this.GetTreeNodeByValue(cellHiddenField.value);
        panelDefinitionInstance.UpdateLabelInPanelDefinition(node.get_value(), node.get_parent().get_value(), cellLabelTextBox.value);
    };

    /////////////////////////////////////////////////////////////
    // Handle the changed event of a ReadOnly checkbox
    //
    this.ReadOnly_Changed = function(rowId, columnId) {
        var gridLayout = $find(this.GridLayoutId);
        var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
        var cellHiddenField = row.findElement("ColumnHidden" + columnId);
        if (cellHiddenField == null || cellHiddenField.value == "")
            return;
        var cellReadOnlyCheckbox = row.findElement("ColumnReadOnlyCheckbox" + columnId);
        if (cellReadOnlyCheckbox == null)
            return;
        var node = this.GetTreeNodeByValue(cellHiddenField.value);
        //Fetch required checkbox/label too because its value/disable/enable depend on the value of read-only checkbox
        var cellRequiredCheckbox = row.findElement("ColumnRequiredCheckbox" + columnId);
        var cellRequiredLabel = row.findElement("ColumnRequiredLabel" + columnId);
        if (cellRequiredCheckbox != null && cellRequiredLabel != null) {
            if (cellReadOnlyCheckbox.checked) {
                var originalValue = cellRequiredCheckbox.checked;
                cellRequiredCheckbox.checked = false;
                cellRequiredCheckbox.disabled = true;
                cellRequiredLabel.setAttribute("disabled", "disabled");
                if (originalValue == true) { //if required checkbox was checked we need to uncheck it
                    panelDefinitionInstance.UpdateRequiredInPanelDefinition(node.get_value(), node.get_parent().get_value(), cellRequiredCheckbox.checked);
                }

            } else {
                var cellDisplayBooleanTypeList = row.findElement("ColumnDisplayBooleanTypeList" + columnId);
                if (cellDisplayBooleanTypeList == null || cellDisplayBooleanTypeList.options.length <= 0 || cellDisplayBooleanTypeList.options[cellDisplayBooleanTypeList.selectedIndex].text != "Checkbox") {
                    cellRequiredCheckbox.disabled = false;
                    cellRequiredLabel.removeAttribute("disabled");
                }
            }
        }
        panelDefinitionInstance.UpdateReadOnlyInPanelDefinition(node.get_value(), node.get_parent().get_value(), cellReadOnlyCheckbox.checked);
    };

    /////////////////////////////////////////////////////////////
    // Handle the changed event of a Required checkbox
    //
    this.Required_Changed = function (rowId, columnId) {
        var gridLayout = $find(this.GridLayoutId);
        var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
        var cellHiddenField = row.findElement("ColumnHidden" + columnId);
        if (cellHiddenField == null || cellHiddenField.value == "")
            return;
        var cellRequiredCheckbox = row.findElement("ColumnRequiredCheckbox" + columnId);
        if (cellRequiredCheckbox == null)
            return;
        var node = this.GetTreeNodeByValue(cellHiddenField.value);
        panelDefinitionInstance.UpdateRequiredInPanelDefinition(node.get_value(), node.get_parent().get_value(), cellRequiredCheckbox.checked);
    };
    
    /////////////////////////////////////////////////////////////
    // Handle the changed event of a HideInNormalView checkbox
    //
    this.HideInNormalView_Changed = function(rowId, columnId) {
        var gridLayout = $find(this.GridLayoutId);
        var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
        var cellHiddenField = row.findElement("ColumnHidden" + columnId);
        if (cellHiddenField == null || cellHiddenField.value == "")
            return;
        var cellHideInNormalViewCheckbox = row.findElement("ColumnHideInNormalViewCheckbox" + columnId);
        if (cellHideInNormalViewCheckbox == null)
            return;
        var node = this.GetTreeNodeByValue(cellHiddenField.value);
        panelDefinitionInstance.UpdateHideInNormalViewInPanelDefinition(node.get_value(), node.get_parent().get_value(), cellHideInNormalViewCheckbox.checked);
    };

    /////////////////////////////////////////////////////////////
    // Handle the changed event of a Display Boolean Type
    //
    this.DisplayBooleanType_Changed = function (rowId, columnId) {
        var gridLayout = $find(this.GridLayoutId);
        var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
        var cellHiddenField = row.findElement("ColumnHidden" + columnId);
        if (cellHiddenField == null || cellHiddenField.value == "")
            return;
        var cellDisplayBooleanTypeList = row.findElement("ColumnDisplayBooleanTypeList" + columnId);
        if (cellDisplayBooleanTypeList == null)
            return;
        var node = this.GetTreeNodeByValue(cellHiddenField.value);
        //Fetch required checkbox/label too because its value/disable/enable depend on the value of display boolean type
        var cellRequiredCheckbox = row.findElement("ColumnRequiredCheckbox" + columnId);
        var cellRequiredLabel = row.findElement("ColumnRequiredLabel" + columnId);
        if (cellRequiredCheckbox != null && cellRequiredLabel != null) {
            var cellReadOnlyCheckbox = row.findElement("ColumnReadOnlyCheckbox" + columnId);
            if (cellDisplayBooleanTypeList.options[cellDisplayBooleanTypeList.selectedIndex].text == "Checkbox") {
                var originalValue = cellRequiredCheckbox.checked;
                cellRequiredCheckbox.checked = false;
                cellRequiredCheckbox.disabled = true;
                cellRequiredLabel.setAttribute("disabled", "disabled");
                if (originalValue == true) { //if required checkbox was checked we need to uncheck it
                    panelDefinitionInstance.UpdateRequiredInPanelDefinition(node.get_value(), node.get_parent().get_value(), cellRequiredCheckbox.checked);
                }                
            } else if (cellReadOnlyCheckbox != null && !cellReadOnlyCheckbox.checked) { //don't enable if read-only is checked
                cellRequiredCheckbox.disabled = false;
                cellRequiredLabel.removeAttribute("disabled");
            }
        }
        panelDefinitionInstance.UpdateDisplayBooleanTypeInPanelDefinition(node.get_value(), node.get_parent().get_value(), cellDisplayBooleanTypeList.options[cellDisplayBooleanTypeList.selectedIndex].value);
    };

    /////////////////////////////////////////////////////////////
    // Remove a field from the grid, unhide its associated tree node, and remove it from the JSON object.
    // Return a CustomizablePropertiesClass representing the customizable properties of the field
    // that was removed (which will be used if moving the field to another cell).
    //
    this.RemoveFieldFromGrid = function(rowId, columnId, checkForEmptyGrid, checkForEmptyRows) {
        var gridLayout = $find(this.GridLayoutId);
        var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
        var cellHiddenField = row.findElement("ColumnHidden" + columnId);
        if (cellHiddenField == null || cellHiddenField.value == "")
            return;
        // Found the cell, clear it and hide the remove button.
        var customizedProperties = new CustomizablePropertiesClass();
        var selectedValue = cellHiddenField.value;
        cellHiddenField.value = "";
        var cellTableField = row.findElement("ColumnTableField" + columnId);
        cellTableField.innerHTML = "";
        var cellLabel = row.findElement("ColumnLabelTextBox" + columnId);
        customizedProperties.CustomLabel = cellLabel.value;
        cellLabel.value = "";
        var cellReadOnlyCheckbox = row.findElement("ColumnReadOnlyCheckbox" + columnId);
        customizedProperties.ReadOnly = cellReadOnlyCheckbox.checked;
        cellReadOnlyCheckbox.checked = false;
        var cellRequiredCheckbox = row.findElement("ColumnRequiredCheckbox" + columnId);
        customizedProperties.Required = cellRequiredCheckbox.checked;
        cellRequiredCheckbox.checked = false;
        var cellHideInNormalViewCheckbox = row.findElement("ColumnHideInNormalViewCheckbox" + columnId);
        customizedProperties.HideInNormalView = cellHideInNormalViewCheckbox.checked;
        cellHideInNormalViewCheckbox.checked = false;
        var cellContent = row.findElement("ColumnContent" + columnId);
        cellContent.style.display = "none";
        var emptyCellContent = row.findElement("EmptyColumnContent" + columnId);
        emptyCellContent.style.display = "block";
        var cellDisplayBooleanTypeList = row.findElement("ColumnDisplayBooleanTypeList" + columnId);
        if (cellDisplayBooleanTypeList != null && cellDisplayBooleanTypeList.options.length > 0) {
            customizedProperties.DisplayControlType = cellDisplayBooleanTypeList.options[cellDisplayBooleanTypeList.selectedIndex].value;
            cellDisplayBooleanTypeList.selectedIndex = 0;
        }
        
        // Unhide the item in the treeview
        var node = this.GetTreeNodeByValue(selectedValue);
        node.set_visible(true);

        panelDefinitionInstance.RemoveFieldFromPanelDefinition(node.get_value(), node.get_parent().get_value());

        if (checkForEmptyGrid)
            this.CheckForEmptyGrid();
        if (checkForEmptyRows)
            this.SetAllRowVisibility();

        return customizedProperties;
    };


    /////////////////////////////////////////////////////////////
    // If the grid is empty, enable all table nodes in the treeview, which may have been disabled
    // in the case of a multi-instance panel.
    //
    this.CheckForEmptyGrid = function() {
        var gridLayout = $find(this.GridLayoutId);
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            if (row._element.style.display == "none") {
                // If we find an invisible row before finding a populated row, the grid must be empty.
                this.SetTableNodeEnableState(true, null);
                return;
            }
            for (var columnCounter = 0; ; columnCounter++) {
                var cellHiddenField = row.findElement("ColumnHidden" + columnCounter);
                if (cellHiddenField == null)
                    break;
                if (cellHiddenField.value != "")
                    // Found a populated cell, nothing else to do.
                    return;
            }
        }

        // If we get this far, the grid must be empty.
        this.SetTableNodeEnableState(true, null);
    };


    /////////////////////////////////////////////////////////////
    // Initialize the PanelDefinition JSON object using the items that have been previously selected.
    // Note that on the initial load of the control, the grid is built server-side, then the JSON object
    // is initialized based on the state of the grid. Then while designing the panel, the grid and JSON
    // object are kept in sync client-side, and the state of the grid is stored in the HiddenPanelDefinition
    // hidden field. On a commit to the server, the server reads the HiddenPanelDefinition value, and
    // converts this serialized JSON data back to a PanelDefinition object.
    // 
    // This method also hides previously selected items in the tree, and hides the appropriate rows.
    this.InitializePanelDefinition = function () {

        panelDefinitionInstance = new PanelDefinitionClass(this.HiddenPanelDefinitionId);
        var showSingleInstanceTables = true;
        var tableNode = null;
        // Iterate through the grid of selected fields
        var gridLayout = $find(this.GridLayoutId);
        if (gridLayout == null || gridLayout.get_masterTableView() == null) {
            alert('There was an error initializing the panel.');
            return;
        }

        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            // Loop through the cells in the row. For each cell:
            // - Get the associated tree node for the field in the cell, and hide the tree node.
            // - Add the field object to the PanelDefinition JSON object
            // - Set flag (showSingleInstanceTables) to track whether this is a single or multi instance panel.
            // - Store the parent table node (tableNode) that will be used to disable other table nodes in the
            //      case of multi-instance.
            for (var columnCounter = 0; ; columnCounter++) {
                var cellHiddenField = row.findElement("ColumnHidden" + columnCounter);
                if (cellHiddenField == null)
                    break;
                if (cellHiddenField.value == "") // Empty cell
                    continue;
                var tableDotField = cellHiddenField.value;
                var node = this.GetTreeNodeByValue(tableDotField);
                if (node == null) {
                    alert('Found an invalid field: ' + tableDotField + '\nIt will not be used.');
                    // Clear the cell
                    cellHiddenField.value = "";
                    var cellTableField = row.findElement("ColumnTableField" + columnCounter);
                    var cellLabel = row.findElement("ColumnLabelTextBox" + columnCounter);
                    var cellReadOnly = row.findElement("ColumnReadOnlyCheckbox" + columnCounter);
                    var cellRequired = row.findElement("ColumnRequiredCheckbox" + columnCounter);
                    var cellHideInNormalView = row.findElement("ColumnHideInNormalViewCheckbox" + columnCounter);
                    var cellContent = row.findElement("ColumnContent" + columnCounter);
                    var emptyCellContent = row.findElement("EmptyColumnContent" + columnCounter);
                    var cellDisplayBooleanType = row.findElement("ColumnDisplayBooleanTypeList" + columnCounter);
                    cellTableField.innerHTML = "";
                    cellLabel.value = "";
                    cellReadOnly.checked = false;
                    cellRequired.checked = false;
                    cellHideInNormalView.checked = false;
                    cellContent.style.display = "none";
                    emptyCellContent.style.display = "block";
                    if (cellDisplayBooleanType != null)
                        cellDisplayBooleanType.selectedIndex = 0;
                    continue;
                }
                var attributes = node.get_attributes();
                var isMultipleInstance = attributes.getAttribute("IsMultipleInstance");
                if (isMultipleInstance.toLowerCase() == "true")
                    showSingleInstanceTables = false;
                var propertyName = node.get_value();
                var cellLabelTextBox = row.findElement("ColumnLabelTextBox" + columnCounter);
                if (cellLabelTextBox != null)
                    var caption = cellLabelTextBox.value;
                var cellReadOnlyCheckbox = row.findElement("ColumnReadOnlyCheckbox" + columnCounter);
                if (cellReadOnlyCheckbox != null)
                    var readOnly = cellReadOnlyCheckbox.checked;
                var cellRequiredCheckbox = row.findElement("ColumnRequiredCheckbox" + columnCounter);
                if (cellRequiredCheckbox != null) {
                    var required;
                    if (cellReadOnlyCheckbox != null && cellReadOnlyCheckbox.checked) {
                        required = false;
                        cellRequiredCheckbox.disabled = true;
                    } else {
                        required = cellRequiredCheckbox.checked;                        
                    }
                }
                var cellHideInNormalViewCheckbox = row.findElement("ColumnHideInNormalViewCheckbox" + columnCounter);
                if (cellHideInNormalViewCheckbox != null)
                    var hideInNormalView = cellHideInNormalViewCheckbox.checked;
                var entityName = node.get_parent().get_value();
                var cellDisplayBooleanTypeList = row.findElement("ColumnDisplayBooleanTypeList" + columnCounter);
                if (cellDisplayBooleanTypeList != null && cellDisplayBooleanTypeList.options.length > 0) {
                    var displayBooleanType = cellDisplayBooleanTypeList.options[cellDisplayBooleanTypeList.selectedIndex].value;
                    if (cellDisplayBooleanTypeList.options[cellDisplayBooleanTypeList.selectedIndex].text == "Checkbox") {
                        cellRequiredCheckbox.disabled = true;
                    }
                }
                panelDefinitionInstance.AddFieldToPanelDefinition(rowCounter, columnCounter,
                    propertyName, caption, entityName, readOnly, required, hideInNormalView, displayBooleanType, isMultipleInstance);
                node.set_visible(false);
                tableNode = node.get_parent();
            }
        }

        // Hide the rightmost empty columns. Make sure other columns are visible.
        var numColumns = gridLayout.get_masterTableView().get_columns().length;
        var foundFirstNonEmptyColumn = false;
        for (var i = numColumns - 1; i >= 1; i--) {
            var column = gridLayout.get_masterTableView().get_columns()[i];
            if (!this.IsColumnPopulated(i) && !foundFirstNonEmptyColumn)
                gridLayout.get_masterTableView().hideColumn(i);
            else {
                gridLayout.get_masterTableView().showColumn(i);
                foundFirstNonEmptyColumn = true;
            }
        }
        // Set the state of the add/remove column buttons
        //
        // If the second column is hidden, disable the 'remove column' button.
        if (!gridLayout.get_masterTableView().get_columns()[1].get_visible())
            this.SetAddRemoveColumnButtonState(true, false);
        // If the last column is visible, disable the 'add column' button.
        else if (gridLayout.get_masterTableView().get_columns()[numColumns - 1].get_visible())
            this.SetAddRemoveColumnButtonState(false, true);
        else
            this.SetAddRemoveColumnButtonState(true, true);

        // Hide or show the appropriate single/multi instance tables in the treeview, and initialize the
        // state of the single/multi instance radio buttons. If no fields are previously selected, we'll
        // default to single instance. If multi-instance fields are selected, we'll disable all other
        // table nodes in the treeview.
        var radioButtonSingle = document.getElementById(this.RadioButtonShowSingleId);
        var radioButtonMultiple = document.getElementById(this.RadioButtonShowMultipleId);
        if (showSingleInstanceTables) {
            this.SetTableNodeVisibility('single');
            radioButtonSingle.checked = "checked";
            radioButtonMultiple.checked = "";
        }
        else {
            this.SetTableNodeVisibility('multiple');
            radioButtonSingle.checked = "";
            radioButtonMultiple.checked = "checked";
            if (tableNode != null)
                this.SetTableNodeEnableState(false, tableNode);
        }

        this.SetAllRowVisibility();
        this.SetGridColumnWidth();
    };


    /////////////////////////////////////////////////////////////
    // Enable or disable the Add/Remove column buttons
    //
    this.SetAddRemoveColumnButtonState = function(addState, removeState) {
        var buttonPlus = document.getElementById(this.ButtonColumnsPlusId);
        var buttonPlusGray = document.getElementById(this.ButtonColumnsPlusGrayId);
        buttonPlusGray.disabled = true;
        if (addState) {
            buttonPlus.style.display = "";
            buttonPlusGray.style.display = "none";
        }
        else {
            buttonPlus.style.display = "none";
            buttonPlusGray.style.display = "";
        }
        var buttonMinus = document.getElementById(this.ButtonColumnsMinusId);
        var buttonMinusGray = document.getElementById(this.ButtonColumnsMinusGrayId);
        buttonMinusGray.disabled = true;
        if (removeState) {
            buttonMinus.style.display = "";
            buttonMinusGray.style.display = "none";
        }
        else {
            buttonMinus.style.display = "none";
            buttonMinusGray.style.display = "";
        }
    };

    /////////////////////////////////////////////////////////////
    // Hide appropriate rows. We want to show all rows up to the last populated row,
    // and show one row after the last populated row.
    //
    this.SetAllRowVisibility = function() {
        var gridLayout = $find(this.GridLayoutId);
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        // Loop backwards through the rows.
        for (var rowCounter = rowCount - 1; rowCounter >= 0; rowCounter--) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            if (row._element.style.display == "none")
            // Row is already hidden, no need to examine it.
                continue;
            for (var columnCounter = 0; ; columnCounter++) {
                var cellHiddenField = row.findElement("ColumnHidden" + columnCounter);
                if (cellHiddenField == null)
                    break; // Hit the last column, go to the next row.
                if (cellHiddenField.value != "") {
                    // Found a populated row, unhide the row after.
                    var rowAfter = gridLayout.get_masterTableView().get_dataItems()[rowCounter + 1];
                    if (rowAfter != null)
                    // NOTE: don't set this to 'block', Firefox will display rows incorrectly
                        rowAfter._element.style.display = "";
                    // Remaining rows are already visible, so we're done.
                    return;
                }
            }
            if (rowCounter != 0) // First row is always visible.
                row._element.style.display = "none";
        }
    };

    /////////////////////////////////////////////////////////////
    // Retrieve a tree node given a "table.field" identifier
    //
    this.GetTreeNodeByValue = function(tableDotField) {
        var tree = $find(this.TreeTablesId);
        if (tree == null) return null;
        var node = tree.findNodeByAttribute("TreeNodeId", tableDotField);
        return node;
    };

    /////////////////////////////////////////////////////////////
    // Retrieve a tree node given a grid row and column coordinate.
    // Will return null if the coordinate points to an empty grid cell
    //
    this.GetTreeNodeByRowColumn = function(rowId, columnId) {
        if (rowId == null || columnId == null) return null;
        var gridLayout = $find(this.GridLayoutId);
        var row = gridLayout.get_masterTableView().get_dataItems()[rowId];
        var cellHiddenField = row.findElement("ColumnHidden" + columnId);
        if (cellHiddenField == null || cellHiddenField.value == "")
            return null;
        return this.GetTreeNodeByValue(cellHiddenField.value);
    };

    /////////////////////////////////////////////////////////////
    // Event handler for when the table type radio button is changed
    //
    this.RadioButtonTableType_Clicked = function(type) {
        // If any fields selected, show warning that they will be removed.
        // Loop through the grid to determine if any cells are populated.
        var gridLayout = $find(this.GridLayoutId);
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        var foundPopulatedCell = false;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            for (var columnCounter = 0; ; columnCounter++) {
                var cellHiddenField = row.findElement("ColumnHidden" + columnCounter);
                if (cellHiddenField == null)
                    break;
                if (cellHiddenField.value != "") {
                    foundPopulatedCell = true;
                    break;
                }
            }
            if (foundPopulatedCell)
                break;
        }

        if (foundPopulatedCell) {
            answer = confirm('All previously selected fields will be cleared. Continue?');
            if (!answer) {
                // Reselect the previously selected radio button
                if (type == 'single') {
                    var radioButton = document.getElementById(this.RadioButtonShowMultipleId);
                    radioButton.checked = "checked";
                }
                else {
                    var radioButton = document.getElementById(this.RadioButtonShowSingleId);
                    radioButton.checked = "checked";
                }
                return false;
            }
        }
        // Remove all selected items, and make them visible in the tree
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            if (row._element.style.display == "none")
                continue;
            for (var columnCounter = 0; ; columnCounter++) {
                var cellHiddenField = row.findElement("ColumnHidden" + columnCounter);
                if (cellHiddenField == null)
                    break;
                if (cellHiddenField.value != "") {
                    // Clear the cell
                    var value = cellHiddenField.value;
                    cellHiddenField.value = "";
                    var cellTableField = row.findElement("ColumnTableField" + columnCounter);
                    var cellLabel = row.findElement("ColumnLabelTextBox" + columnCounter);
                    var cellReadOnly = row.findElement("ColumnReadOnlyCheckbox" + columnCounter);
                    var cellRequired = row.findElement("ColumnRequiredCheckbox" + columnCounter);
                    var cellHideInNormalView = row.findElement("ColumnHideInNormalViewCheckbox" + columnCounter);
                    var cellContent = row.findElement("ColumnContent" + columnCounter);
                    var emptyCellContent = row.findElement("EmptyColumnContent" + columnCounter);
                    var celldisplayBooleanType = row.findElement("ColumndisplayBooleanTypeList" + columnCounter);
                    if (celldisplayBooleanType != null) celldisplayBooleanType.selectedIndex = 0;
                    
                    cellTableField.innerHTML = "";
                    cellLabel.value = "";
                    cellReadOnly.checked = false;
                    cellRequired.checked = false;                    
                    cellHideInNormalView.checked = false;
                    cellContent.style.display = "none";
                    emptyCellContent.style.display = "block";

                    // Unhide the item in the treeview
                    var node = this.GetTreeNodeByValue(value);
                    node.set_visible(true);
                }
            }
        }
        panelDefinitionInstance = new PanelDefinitionClass(this.HiddenPanelDefinitionId);
        panelDefinitionInstance.SavePanelDefinitionState();

        // Hide and show the appropriate tree nodes.
        this.SetTableNodeVisibility(type);
        // Enable all table nodes.
        this.SetTableNodeEnableState(true, null);

        this.HideAllButFirstColumn();
        this.SetAllRowVisibility();
    };

    /////////////////////////////////////////////////////////////
    // Show and hide the appropriate table nodes, based on the given type (single or multiple instance).
    //
    this.SetTableNodeVisibility = function (type) {
        var tree = $find(this.TreeTablesId);
        if (tree == null) return null;
        
        for (var i = 0; i < tree.get_nodes().get_count(); i++) {
            var node = tree.get_nodes().getNode(i);
            var attributes = node.get_attributes();
            var isMultipleInstance = attributes.getAttribute("IsMultipleInstance");

            if ((type == 'single' && isMultipleInstance == 'false') || (type == 'multiple' && isMultipleInstance == 'true'))
                node.set_visible(true);
            else
                node.set_visible(false);
        }
    };

    /////////////////////////////////////////////////////////////
    // Set the enabled state of all table nodes, excluding the given node. Unexpand any nodes that we're disabling.
    //
    this.SetTableNodeEnableState = function(enabled, excludeNode) {
        var tree = $find(this.TreeTablesId);
        if (tree == null) return null;

        for (var i = 0; i < tree.get_nodes().get_count(); i++) {
            var node = tree.get_nodes().getNode(i);
            if (node == excludeNode)
                continue;
            if (!enabled)
                node.set_expanded(false);
            node.set_enabled(enabled);
        }
    };

    /////////////////////////////////////////////////////////////
    // Return the coordinates of the first empty cell in the grid.
    //
    this.GetFirstEmptyCell = function() {
        var gridLayout = $find(this.GridLayoutId);
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            for (var columnCounter = 0; ; columnCounter++) {
                var cellHiddenField = row.findElement("ColumnHidden" + columnCounter);
                if (cellHiddenField == null)
                    break;
                if (!gridLayout.get_masterTableView().get_columns()[columnCounter].get_visible())
                    break;
                if (cellHiddenField.value == "") {
                    var rowColumn = new RowColumnClass(rowCounter, columnCounter);
                    return rowColumn;
                }
            }
        }
        return null;
    };

    /////////////////////////////////////////////////////////////
    // Return the coordinates of a property in the grid.
    //
    this.GetCellByTreeNodeId = function (treeNodeId) {
        var gridLayout = $find(this.GridLayoutId);
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            for (var columnCounter = 0; ; columnCounter++) {
                var cellHiddenField = row.findElement("ColumnHidden" + columnCounter);
                if (cellHiddenField == null)
                    break;
                if (cellHiddenField.value == treeNodeId) {
                    var rowColumn = new RowColumnClass(rowCounter, columnCounter);
                    return rowColumn;
                }
            }
        }
        return null;
    };

    /////////////////////////////////////////////////////////////
    // Unhide the first non-visible column in the grid.
    //
    this.AddColumn = function() {
        var gridLayout = $find(this.GridLayoutId);
        var numColumns = gridLayout.get_masterTableView().get_columns().length;
        var lastColumn = gridLayout.get_masterTableView().get_columns()[numColumns - 1];
        if (lastColumn.get_visible()) {
            return;
        }
        // Make the first non-visible column visible.
        for (var i = 1; i < numColumns; i++) {
            var column = gridLayout.get_masterTableView().get_columns()[i];
            if (!column.get_visible()) {
                gridLayout.get_masterTableView().showColumn(i);
                break;
            }
        }
        // Set appropriate button state
        this.SetAddRemoveColumnButtonState(!lastColumn.get_visible(), true);
        
        this.SetGridColumnWidth();
    };

    /////////////////////////////////////////////////////////////
    // Hide the last column in the grid.
    //
    this.RemoveColumn = function() {
        var gridLayout = $find(this.GridLayoutId);
        var numColumns = gridLayout.get_masterTableView().get_columns().length;
        var secondColumn = gridLayout.get_masterTableView().get_columns()[1];
        if (!secondColumn.get_visible()) {
            return;
        }
        // Hide the last visible column.
        for (var i = numColumns - 1; i >= 1; i--) {
            var column = gridLayout.get_masterTableView().get_columns()[i];
            if (column.get_visible()) {
                if (this.IsColumnPopulated(i)) {
                    answer = confirm('All fields in the rightmost column will be cleared. Continue?');
                    if (!answer)
                        return;
                    this.ClearColumn(i);
                }
                gridLayout.get_masterTableView().hideColumn(i);
                panelDefinitionInstance.RemoveColumnFromPanelDefinition(i);
                break;
            }
        }
        // Set appropriate button state
        this.SetAddRemoveColumnButtonState(true, secondColumn.get_visible());

        this.SetGridColumnWidth();
    };

    /////////////////////////////////////////////////////////////
    // Set the width of each visible column to (100% / [number of visible columns])
    // Note that as of this writing, this logic is only required for IE8. Since it doesn't
    // affect other browsers, we'll let it run for all browsers, rather than adding
    // browser conditional logic.
    //
    this.SetGridColumnWidth = function() {
        // Get the number of visible columns, and set the width of all cells in the visible columns
        // to the appropriate width.
        var numVisibleColumns = 0;
        var gridLayout = $find(this.GridLayoutId);
        var numColumns = gridLayout.get_masterTableView().get_columns().length;
        for (var i = 0; i < numColumns; i++) {
            var column = gridLayout.get_masterTableView().get_columns()[i];
            if (column.get_visible()) numVisibleColumns++;
        }
        var colWidth = 100 / numVisibleColumns;
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            for (i = 0; i < numVisibleColumns; i++) {
                row._element.cells[i].style.width = colWidth + "%";
            }
        }
    };

    /////////////////////////////////////////////////////////////
    // Hide all but the first column in the grid. NOTE: This function assumes the
    // columns are empty, and will not clear fields in the columns.
    //
    this.HideAllButFirstColumn = function() {
        var gridLayout = $find(this.GridLayoutId);
        var numColumns = gridLayout.get_masterTableView().get_columns().length;
        for (var i = numColumns - 1; i >= 1; i--) {
            gridLayout.get_masterTableView().hideColumn(i);
        }
        this.SetAddRemoveColumnButtonState(true, false);
        this.SetGridColumnWidth();
    };

    /////////////////////////////////////////////////////////////
    // Determine if a column has cells that contain fields
    //
    this.IsColumnPopulated = function(columnIndex) {
        var gridLayout = $find(this.GridLayoutId);
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter];
            if (row._element.style.display == "none")
                // If we get to invisible rows, no need to look further.
                return false;
            var cellHiddenField = row.findElement("ColumnHidden" + columnIndex);
            if (cellHiddenField == null)
                continue;
            if (cellHiddenField.value != "")
                return true;
        }
        return false;
    };

    /////////////////////////////////////////////////////////////
    // Clear all the fields in a column
    //
    this.ClearColumn = function(columnIndex) {
        var gridLayout = $find(this.GridLayoutId);
        var rowCount = gridLayout.get_masterTableView().get_dataItems().length;
        for (var rowCounter = 0; rowCounter < rowCount; rowCounter++) {
            var row = gridLayout.get_masterTableView().get_dataItems()[rowCounter]; 
            if (row._element.style.display == "none")
                break;
            this.RemoveFieldFromGrid(rowCounter, columnIndex, false, false);
        }
        this.CheckForEmptyGrid();
        this.SetAllRowVisibility();
    };

    /////////////////////////////////////////////////////////////
    // Callback handler for the EditSourceDialog window when adding. Add a source node to the tree.
    //
    this.AddSource = function (window, args, addPropertyText) {
        if (args.get_argument() == null || args.get_argument().cancel == true)
            return;

        var isMultipleInstance = args.get_argument().IsMultipleInstance;
        var sourceName = args.get_argument().SourceName;

        if (!this.ValidateNonEmpty(sourceName)) {
            alert('Name cannot be empty.');
            args.set_cancel(true);
            return;
        }

        sourceName = CollapsedSimpleName(sourceName);

        // Verify that the source name is not in use.
        var status = this.IsSourceNameInUse(sourceName);
        if (status === 'InUse') {
            alert('A source named ' + sourceName + ' already exists. Please enter a unique name.');
            args.set_cancel(true);
            return;
        }
        if (status === 'Deleted') {
            alert('A source named ' + sourceName + ' has been deleted but not saved. Please enter a unique name or save previous.');
            args.set_cancel(true);
            return;
        }

        var tree = $find(this.TreeTablesId);
        if (tree == null) {
            alert('Error adding source. Could not retrieve the tree.' + this.TreeTablesId);
            return;
        }

        var nodes = tree.get_nodes();
        tree.trackChanges();
        var newSourceNode = new Telerik.Web.UI.RadTreeNode();
        newSourceNode.set_text(sourceName);
        newSourceNode.set_value(sourceName);
        // Note that the attribute names here must match the names defined in PanelDesigner.ascx.cs.
        newSourceNode.get_attributes().setAttribute("IsTable", 'true');
        newSourceNode.get_attributes().setAttribute("IsMultipleInstance", isMultipleInstance.toString());
        newSourceNode.get_attributes().setAttribute("TreeNodeId", sourceName);
        newSourceNode.get_attributes().setAttribute("IsDirty", 'true');
        newSourceNode.get_attributes().setAttribute("OperationType", 'Insert');
        newSourceNode.set_contextMenuID("SourceMenuNewItem");

        // TODO: figure out what, if any, image to use here. Will need to somehow figure out base and theme url. Set in a hidden textbox?
        //newSourceNode.set_imageUrl("http://bpye-mac/Main10/App_Themes/BlueWave/images/icon_edit.gif");
        nodes.insert(2, newSourceNode);
        // Add an 'Add property' node
        var newPropertyNode = new Telerik.Web.UI.RadTreeNode();
        newPropertyNode.set_text(addPropertyText);
        newPropertyNode.set_contextMenuID("EmptyMenu");
        var script = "javascript:ShowDialog_NoReturnValue(\"EditPropertyDialog.aspx?SourceName=" + sourceName + "\", null, panelDesignerInstance.editPropertyDialogWidth, panelDesignerInstance.editPropertyDialogHeight, \"" + addPropertyText + "\", null, \"E\", function(sender, args) { panelDesignerInstance.AddProperty(sender, args); }, null, false, true, null, null)";
        newPropertyNode.set_navigateUrl(script);
        newSourceNode.get_nodes().insert(0, newPropertyNode);
        newSourceNode.expand();
        tree.commitChanges();
    };

    /////////////////////////////////////////////////////////////
    // Callback handler for the EditSourceDialog window when editing. Edit a source node on the tree.
    //
    this.EditSource = function (window, args) {
        if (args.get_argument() == null || args.get_argument().cancel == true)
            return;

        var sourceName = args.get_argument().SourceName;
        var oldSourceName = args.get_argument().OldSourceName;

        if (!this.ValidateNonEmpty(sourceName)) {
            alert('Name cannot be empty.');
            args.set_cancel(true);
            return;
        }

        sourceName = CollapsedSimpleName(sourceName);

        // Verify that the source name is not in use.
        var status = this.IsSourceNameInUse(sourceName);
        if (status === 'InUse') {
            alert('A source named ' + sourceName + ' already exists. Please enter a unique name.');
            args.set_cancel(true);
            return;
        }
        if (status === 'Deleted') {
            alert('A source named ' + sourceName + ' has been deleted but not saved. Please enter a unique name or save previous.');
            args.set_cancel(true);
            return;
        }

        var tree = $find(this.TreeTablesId);
        if (tree == null) {
            alert('Error editing source. Could not retrieve the tree. ' + this.TreeTablesId);
            return;
        }
        tree.trackChanges();
        var nodes = tree.get_nodes();
        var node = this.GetTreeNodeByValue(oldSourceName);
        if (node == null) {
            alert('Error editing source. Could not retrieve the node. ' + oldSourceName);
            return;
        }
        node.set_text(sourceName);
        node.set_value(sourceName);
        node.get_attributes().setAttribute("IsDirty", 'true');
        if (node.get_attributes().getAttribute("OperationType") != "Insert")
            node.get_attributes().setAttribute("OperationType", 'Update');
        node.get_attributes().setAttribute("OldSourceName", oldSourceName);
        node.get_attributes().setAttribute("TreeNodeId", sourceName);
        // Source was renamed, need to update all child property nodes
        for (var i = 0; i < node.get_nodes().get_count(); i++) {
            var childNode = node.get_nodes().getNode(i);
            if (i == 0) {
                // Reset the 'Add Property' node target url
                var script = "javascript:ShowDialog_NoReturnValue(\"EditPropertyDialog.aspx?SourceName=" + sourceName + "\", null, panelDesignerInstance.editPropertyDialogWidth, panelDesignerInstance.editPropertyDialogHeight , \"Add property\", null, \"E\", function(sender, args) {{ panelDesignerInstance.AddProperty(sender, args); }}, null, false, true, null, null)";
                childNode.set_navigateUrl(script);
            }
            else
                childNode.get_attributes().setAttribute("TreeNodeId", sourceName + "." + childNode.get_value());
        }


        tree.commitChanges();

        this.UpdateSourceOnPanel(node, oldSourceName, sourceName);
    };

    /////////////////////////////////////////////////////////////
    // Callback handler for the EditPropertyDialog window when adding. Add a property node to the tree.
    //
    this.AddProperty = function (window, args) {
        this.AddEditProperty(window, args, true);
    }; /////////////////////////////////////////////////////////////
    // Callback handler for the EditPropertyDialog window when editing. Edit a property node on the tree.
    //
    this.EditProperty = function (window, args) {
        this.AddEditProperty(window, args, false);
    }; /////////////////////////////////////////////////////////////
    // Add or edit a business object property.
    //
    this.AddEditProperty = function (window, args, isNew) {
        if (args.get_argument() == null || args.get_argument().cancel == true)
            return;

        var sourceName = args.get_argument().SourceName;
        var propertyName = args.get_argument().PropertyName;
        var oldPropertyName = args.get_argument().OldPropertyName;
        var propertyType = args.get_argument().PropertyType;
        var stringLength = args.get_argument().StringLength;
        var numberOfTextboxLines = args.get_argument().NumberOfTextboxLines;
        var decimalPrecision = args.get_argument().DecimalPrecision;
        var decimalScale = args.get_argument().DecimalScale;
        var toBeLogged = args.get_argument().ToBeLogged;
        var valueListQueryKey = args.get_argument().ValueListQueryKey;
        var valueListQueryDataColumn = args.get_argument().ValueListQueryDataColumn;
        var valueListQueryDisplayColumn = args.get_argument().ValueListQueryDisplayColumn;
        var explicitValueListData = args.get_argument().ExplicitValueListData;
        var allowedFileTypes = args.get_argument().AllowedFileTypes;
        var allowMultiSelect = args.get_argument().AllowMultiSelect;

        if (sourceName == null || propertyName == null) {
            alert('Error adding property.');
            return;
        }
        var sourceNode = this.GetTreeNodeByValue(sourceName);
        if (sourceNode == null) {
            alert('Error adding property.');
            return;
        }
        if (!this.ValidateNonEmpty(propertyName)) {
            alert('Name cannot be empty.');
            args.set_cancel(true);
            return;
        }
        propertyName = CollapsedSimpleName(propertyName);

        // Verify that the name is not in use.
        if (propertyName != oldPropertyName && this.IsPropertyNameInUse(propertyName, sourceNode)) {
            alert('A property by this name already exists for this source. Please enter a unique name.');
            args.set_cancel(true);
            return;
        }
        // Validate string length
        if (propertyType == this.PropertyTypeStringValue) {
            //if (!this.ValidatePositiveIntegerNonZero(stringLength) || stringLength > 400) {
            //    alert('String length must be a positive integer less than or equal to 400.');
            //    args.set_cancel(true);
            //    return;
            //}
            // The maximum length is provider specific. So we will have to postpone the length check until
            // panel commit.
            if (!this.ValidatePositiveIntegerNonZero(stringLength)) {
                alert('String length must be a positive integer.');
                args.set_cancel(true);
                return;
            }
        }

        // Validate decimal precision and scale
        if (propertyType == this.PropertyTypeDecimalValue) {
            if (!this.ValidatePositiveIntegerNonZero(decimalPrecision)) {
                alert('Decimal precision must be a positive integer greater than zero.');
                args.set_cancel(true);
                return;
            }
            if (!this.ValidatePositiveInteger(decimalScale)) {
                alert('Decimal scale must be a positive integer.');
                args.set_cancel(true);
                return;
            }
            if (decimalPrecision > 38) {
                alert('Decimal precision must be less than or equal to 38.');
                args.set_cancel(true);
                return;
            }
            if (decimalScale > 12) {
                alert('Decimal scale must be less than or equal to 12.');
                args.set_cancel(true);
                return;
            }
            if (parseInt(decimalScale) > parseInt(decimalPrecision)) {
                alert('Decimal scale must be less than or equal to precision.');
                args.set_cancel(true);
                return;
            }
        }

        var tree = $find(this.TreeTablesId);
        if (tree == null) {
            alert('Error adding property. Could not retrieve the tree. ' + this.TreeTablesId);
            return;
        }
        tree.trackChanges();

        var propertyNode = null;
        if (isNew) {
            propertyNode = new Telerik.Web.UI.RadTreeNode();
            propertyNode.set_contextMenuID("PropertiesMenuNewItem");
            var isMultipleInstance = sourceNode.get_attributes().getAttribute("IsMultipleInstance");
            propertyNode.get_attributes().setAttribute("IsMultipleInstance", isMultipleInstance);
        } else {
            propertyNode = this.GetTreeNodeByValue(sourceName + "." + oldPropertyName);
            if (propertyNode == null) {
                alert('Error editing property. Could not retrieve the node. ' + sourceName + "." + oldPropertyName);
                return;
            }
        }

        propertyNode.set_text(propertyName);
        propertyNode.set_value(propertyName);
        // Note that the attribute names here must match the names defined in PanelDesigner.ascx.cs.
        propertyNode.get_attributes().setAttribute("IsTable", "false");
        propertyNode.get_attributes().setAttribute("TreeNodeId", sourceName + "." + propertyName);
        propertyNode.get_attributes().setAttribute("PropertyType", propertyType);
        propertyNode.get_attributes().setAttribute("StringLength", stringLength);
        propertyNode.get_attributes().setAttribute("NumberOfTextboxLines", numberOfTextboxLines);

        propertyNode.get_attributes().setAttribute("DecimalPrecision", decimalPrecision);
        propertyNode.get_attributes().setAttribute("DecimalScale", decimalScale);

        propertyNode.get_attributes().setAttribute("ToBeLogged", toBeLogged);
        propertyNode.get_attributes().setAttribute("AllowedFileTypes", allowedFileTypes);
        propertyNode.get_attributes().setAttribute("AllowMultiSelect", allowMultiSelect);

        if (valueListQueryKey != null) {
            propertyNode.get_attributes().setAttribute("ValueListQueryKey", valueListQueryKey);
            propertyNode.get_attributes().setAttribute("ValueListQueryDataColumn", valueListQueryDataColumn);
            propertyNode.get_attributes().setAttribute("ValueListQueryDisplayColumn", valueListQueryDisplayColumn);
            propertyNode.get_attributes().setAttribute("ValueListExplicit", '');
        } else {
            propertyNode.get_attributes().setAttribute("ValueListQueryKey", '');
            propertyNode.get_attributes().setAttribute("ValueListQueryDataColumn", '');
            propertyNode.get_attributes().setAttribute("ValueListQueryDisplayColumn", '');
            propertyNode.get_attributes().setAttribute("ValueListExplicit", '');
        }

        if (explicitValueListData != null) {
            propertyNode.get_attributes().setAttribute("ExplicitValueListData", explicitValueListData);
        } else {
            propertyNode.get_attributes().setAttribute("ExplicitValueListData", '');
        }

        if (isNew)
            sourceNode.get_nodes().insert(1, propertyNode);

        // If parent node is not dirty, we must be doing a property insert/edit on an existing source. 
        // Set the parent node attributes appropriately.
        if (sourceNode.get_attributes().getAttribute("IsDirty") == null ||
            sourceNode.get_attributes().getAttribute("IsDirty").toLowerCase() == "false") {
            sourceNode.get_attributes().setAttribute("IsDirty", "true");
            sourceNode.get_attributes().setAttribute("OperationType", "Update");
        }

        tree.commitChanges();
    };
    
    /////////////////////////////////////////////////////////////
    // Determine if the given source name is already in use.
    // Returns: 
    // empty string - name is not in use
    // "InUse" - name is in use
    // "Deleted" - name is in use on a deleted source
    //
    this.IsSourceNameInUse = function (sourceName) {
        var tree = $find(this.TreeTablesId);
        if (tree == null) {
            alert('Processing error. Could not retrieve the tree.' + this.TreeTablesId);
            return "InUse";
        }

        for (var i = 0; i < tree.get_nodes().get_count(); i++) {
            var node = tree.get_nodes().getNode(i);
            if (node.get_text() == sourceName) {
                var atrValue = node.get_attributes().getAttribute("OperationType");
                if (atrValue === null || typeof atrValue === "undefined")
                    return 'InUse';
                if (atrValue === 'Delete')
                    return 'Deleted';
                return 'InUse';
            }
        }
        return ' ';
    }; /////////////////////////////////////////////////////////////
    // Determine if the given property name is already in use by the given source.
    //
    this.IsPropertyNameInUse = function (propertyName, sourceNode) {
        for (var i = 0; i < sourceNode.get_nodes().get_count(); i++) {
            var node = sourceNode.get_nodes().getNode(i);
            if (node.get_text() == propertyName) {
                return true;
            }
        }

        return false;
    }; /////////////////////////////////////////////////////////////
    // Determine if the given name follows the character rules:
    // Name can contain only alphanumeric characters and underscore character, and it must start with a letter.
    //
    // NOTE: this function was initially used to validate the names of sources and properties. But we found that
    // the back-end business object code would call Aid.CollapsedSimpleName() on the names of these. So we'll 
    // reimplement Aid.CollapsedSimpleName() on the client, and update the name that the user types.
    this.ValidateIdentifier = function (name) {
        var regEx = /^[a-zA-Z][a-zA-Z0-9_]*$/;
        return name.match(regEx);
    }; /////////////////////////////////////////////////////////////
    // Determine if the given value is not empty or contains only whitespace)
    //
    this.ValidateNonEmpty = function (value) {
        var trimmed = value.replace(/^\s+|\s+$/g, '');
        return (!trimmed.length == 0);
    }; /////////////////////////////////////////////////////////////
    // Determine if the given value is a positive integer (including zero)
    //
    this.ValidatePositiveInteger = function (value) {
        var regEx = /^[0-9][0-9]*$/;
        return value.match(regEx);
    }; /////////////////////////////////////////////////////////////
    // Determine if the given value is a non zero positive integer
    //
    this.ValidatePositiveIntegerNonZero = function (value) {
        var regEx = /^[1-9][0-9]*$/;
        return value.match(regEx);
    }; /////////////////////////////////////////////////////////////
    // Callback handler for the content menu click
    //
    this.ClientContextMenuItemClicked = function (sender, args) {
        var node = args.get_node();
        var item = args.get_menuItem();
        var menu = item.get_menu();

        if (item.get_value() == "deleteSource") {
            var response = confirm("Delete the data source " + node.get_text() +
                "?\n\nAll data source properties will be deleted, data based on this source will be unavailable, and any used " +
                "properties will be removed from the panel. This will also affect other panels that use the data source.");
            if (!response) { menu.hide(); return; }
            var tree = $find(this.TreeTablesId);
            if (tree == null) { menu.hide(); return; }
            tree.trackChanges();
            node.get_attributes().setAttribute("IsDirty", 'true');
            node.get_attributes().setAttribute("OperationType", 'Delete');
            node.set_visible(false);
            tree.commitChanges();
            // Remove any used properties from the panel
            for (var i = 0; i < node.get_nodes().get_count(); i++) {
                var nodeToRemoveFromPanel = node.get_nodes().getNode(i);
                var coordinates = this.GetCellByTreeNodeId(nodeToRemoveFromPanel.get_attributes().getAttribute("TreeNodeId"));
                if (coordinates == null)
                    continue;
                this.RemoveFieldFromGrid(coordinates.RowId, coordinates.ColumnId, false, false);
            }
            this.CheckForEmptyGrid();
            this.SetAllRowVisibility();
        }
        else if (item.get_value() == "editSource") {
            var url = 'EditSourceDialog.aspx?SourceName=' + node.get_value();
            ShowDialog(url, null, this.editSourceDialogWidth, this.editSourceDialogHeight, 'Edit source', null, 'E', function (sender, args) { panelDesignerInstance.EditSource(sender, args); }, null, false, true, null, null);
        }
        else if (item.get_value() == "deleteProperty") {
            var response = confirm("Delete the property " + node.get_text() +
                "?\n\nData based on this property will be unavailable. This will also affect other panels that use the property.");
            if (!response) { menu.hide(); return; }
            var tree = $find(this.TreeTablesId);
            if (tree == null) { menu.hide(); return; }
            tree.trackChanges();
            // Set the parent source node as dirty
            node.get_parent().get_attributes().setAttribute("IsDirty", 'true');
            node.get_parent().get_attributes().setAttribute("OperationType", 'Update');
            node.get_parent().get_nodes().remove(node);
            tree.commitChanges();
        }
        else if (item.get_value() == "editNewProperty" || item.get_value() == "editExistingProperty") {
            var isNew = (item.get_value() == "editNewProperty");
            var sourceName = node.get_parent().get_value();
            var propertyName = node.get_value();
            var propertyType = node.get_attributes().getAttribute("PropertyType");
            var propertyStringLength = node.get_attributes().getAttribute("StringLength");
            var propertyNumberOfTextboxLines = node.get_attributes().getAttribute("NumberOfTextboxLines");
            var propertyDecimalPrecision = node.get_attributes().getAttribute("DecimalPrecision");
            var propertyDecimalScale = node.get_attributes().getAttribute("DecimalScale");
            var propertyToBeLogged = node.get_attributes().getAttribute("ToBeLogged");
            var propertyValueListQueryKey = node.get_attributes().getAttribute("ValueListQueryKey");
            var propertyValueListQueryDataColumn = node.get_attributes().getAttribute("ValueListQueryDataColumn");
            var propertyValueListQueryDisplayColumn = node.get_attributes().getAttribute("ValueListQueryDisplayColumn");
            var propertyValueListExplicit = node.get_attributes().getAttribute("ExplicitValueListData");
            var propertyAllowedFileTypes = node.get_attributes().getAttribute("AllowedFileTypes");
            var propertyAllowMultiSelect = node.get_attributes().getAttribute("AllowMultiSelect");

            var url = 'EditPropertyDialog.aspx?SourceName=' + sourceName + '&PropertyName=' + propertyName + '&PropertyType=' + propertyType +
                '&PropertyStringLength=' + propertyStringLength + '&PropertyDecimalPrecision=' + propertyDecimalPrecision +
                '&PropertyDecimalScale=' + propertyDecimalScale + '&PropertyToBeLogged=' + propertyToBeLogged +
                '&PropertyIsNew=' + isNew + '&PropertyNumberOfTextboxLines=' + propertyNumberOfTextboxLines + '&PropertyAllowMultiSelect=' + propertyAllowMultiSelect;
            if (propertyValueListQueryKey != null)
                url = url + '&PropertyValueListQueryKey=' + propertyValueListQueryKey + '&PropertyValueListQueryDataColumn=' + propertyValueListQueryDataColumn +
                    '&PropertyValueListQueryDisplayColumn=' + propertyValueListQueryDisplayColumn;
            if (propertyAllowedFileTypes != null)
                url = url + '&AllowedFileTypes=' + propertyAllowedFileTypes;

            var windowArgs = null;
            if (propertyValueListExplicit != null) {
                windowArgs = new Object;
                windowArgs.ExplicitValueListData = propertyValueListExplicit;
            }
            ShowDialog(url, windowArgs, this.editPropertyDialogWidth, this.editPropertyDialogHeight, 'Edit property', null, 'E', function (sender, args) { panelDesignerInstance.EditProperty(sender, args); }, null, false, true, null, null);
        }

        menu.hide();
    }; /////////////////////////////////////////////////////////////
    // Validate sources. Returns true if valid, otherwise false
    //
    this.ValidateSources = function (sender, args) {
        // Verify all sources have at least one property
        var tree = $find(this.TreeTablesId);
        if (tree == null) return false;

        for (var i = 2; i < tree.get_nodes().get_count(); i++) {
            var node = tree.get_nodes().getNode(i);
            if (node == null)
                return true;
            // Don't validate 'clean' sources
            if (node.get_attributes().getAttribute("IsDirty") == null ||
                node.get_attributes().getAttribute("IsDirty").toLowerCase() == false)
                continue;
            // Don't validate deleted sources
            if (!node.get_visible())
                continue;
            if (node.get_nodes().get_count() <= 1) {
                alert('Cannot save a source that has no properties: ' + node.get_text());
                return false;
            }
        }
        return true;
    }; //////////////////////////////////////////////////////////////
    // Functions to support dragging and dropping within the grid
    //////////////////////////////////////////////////////////////
    
    var _dragStartX = 0;        // mouse starting positions
    var _dragStartY = 0;
    var _dragElement;           // needs to be passed from OnMouseDown to OnMouseMove
    var _dragStarted = false;
    var _dragClickTarget;
    var _dragClickRow;
    var _dragClickColumn;
    var _dragClickLabel;
    var _ignoreNextMouseDown = false;

    this.FindChildElementWhoseIdEndsWith = function(startingElement, idEnd) {
        if (startingElement == null) return null;
        if (startingElement.id.indexOf(idEnd, startingElement.id.length - idEnd.length) > -1)
            return startingElement;
        if (startingElement.children == null || startingElement.children.length == 0)
            return null;
        for (var i = 0; i < startingElement.children.length; i++) {
            var targetElement = this.FindChildElementWhoseIdEndsWith(startingElement.children[i], idEnd);
            if (targetElement != null) return targetElement;
        }
        return null;
    };
    this.CellMouseDown = function(target, e) {
        if (e == null)
            e = window.event;


        // When there is a click in the textbox, we want to ignore it, and ignore the next
        // click from the parent div.
        if (_ignoreNextMouseDown) {
            _ignoreNextMouseDown = false;
            return false;
        }
        if (target.id == "ColumnLabelTextBoxDiv") {
            _ignoreNextMouseDown = true;
            return false;
        }

        _dragClickTarget = target;
        _dragClickRow = _dragClickTarget.parentNode.getAttribute("ROWID");
        _dragClickColumn = _dragClickTarget.parentNode.getAttribute("COLID");

        // Find the ColumnTableField element
        _dragClickLabel = this.FindChildElementWhoseIdEndsWith(_dragClickTarget, "ColumnTableField" + _dragClickColumn);
        if (_dragClickLabel == null) {
            this.ResetDragDropVariables();
            return false;
        }

        // for IE, left click == 1, for Firefox, left click == 0
        if (e.button == 1 && window.event != null || e.button == 0) {
            // grab the mouse position
            _dragStartX = e.clientX;
            _dragStartY = e.clientY;

            // tell our code to start moving the element with the mouse
            var thisClassInstance = this;
            document.onmousemove = function(e) { thisClassInstance.OnMouseMove(e); };
            document.onmouseup = function(e) { thisClassInstance.OnMouseUp(e); };

            // Prevent text selection in Firefox. 
            if (document.onselectstart == null && document.body.style.MozUserSelect != null) {
                document.body.style.MozUserSelect = "none";
            }
            else {
                // Prevent text selection in other browsers.
                document.onselectstart = function() { return false; };
            }

            return false;
        }
    };

    this.OnMouseMove = function(e) {
        if (e == null)
            var e = window.event;
        
        if (!_dragStarted) {
            if ((Math.abs(e.clientX - _dragStartX) > 3) || (Math.abs(e.clientY - _dragStartY) > 3)) {
                _dragStarted = true;
                _dragElement = document.createElement('div');
                _dragElement.className = 'dragContainer';
                document.body.appendChild(_dragElement);

                // Make a copy of the label node that we can drag
                var clone = _dragClickLabel.cloneNode(true);
                clone.className = 'dragItem';
                _dragElement.appendChild(clone);

            }
        }

        if (_dragStarted && _dragElement != null && _dragElement.childNodes.length) {
            _dragElement.style.left = (e.clientX + 10) + 'px';
            _dragElement.style.top = (e.clientY + 5) + 'px';
        }
    };

    this.OnMouseUp = function(e) {
        if (window.event)
            e = window.event;

        if (_dragStarted && _dragElement != null && _dragElement.childNodes.length > 0) {
            var dropTarget;
            if (e.srcElement == null)
            // Firefox
                dropTarget = e.target;
            else
            // Other browsers
                dropTarget = e.srcElement;
            var targetRow = null;
            var targetColumn = null;

            while (dropTarget != null) {
                if (dropTarget.getAttribute == null) {
                    // Dropped outside the grid
                    this.ResetDragDropVariables();
                    return;
                }
                var targetRow = dropTarget.getAttribute("ROWID");
                if (targetRow != null) {
                    var targetColumn = dropTarget.getAttribute("COLID");
                    break;
                }
                dropTarget = dropTarget.parentNode;
            }
            if (targetRow != null && targetColumn != null && !(_dragClickColumn == targetColumn && _dragClickRow == targetRow)) {
                var sourceTreeNode = this.GetTreeNodeByRowColumn(_dragClickRow, _dragClickColumn);
                var targetTreeNode = this.GetTreeNodeByRowColumn(targetRow, targetColumn);
                if (targetTreeNode != null) {
                    // Dropped on an occupied cell
                    answer = confirm('Replace the current field?');
                    if (!answer) {
                        this.ResetDragDropVariables();
                        return;
                    }
                    else {
                        var customizedProperties = this.RemoveFieldFromGrid(_dragClickRow, _dragClickColumn, false, false);
                        this.RemoveFieldFromGrid(targetRow, targetColumn, false, false);
                        this.AddFieldByTreeNodeWithProperties(sourceTreeNode, targetRow, targetColumn, customizedProperties);
                        this.SetAllRowVisibility();
                    }
                }
                else {
                    // Dropped on an empty cell
                    var customizedProperties = this.RemoveFieldFromGrid(_dragClickRow, _dragClickColumn, false, false);
                    this.AddFieldByTreeNodeWithProperties(sourceTreeNode, targetRow, targetColumn, customizedProperties);
                    this.SetAllRowVisibility();
                }
            }
        }
        this.ResetDragDropVariables();
    };

    this.ResetDragDropVariables = function() {
        if (_dragElement != null)
            document.body.removeChild(_dragElement);
        _dragElement = null;
        _dragStarted = false;
        _dragClickTarget = null;
        _dragClickColumn = null;
        _dragClickLabel = null;
        _dragClickRow = null;

        // we're done with these events until the next OnMouseDown
        document.onmousemove = null;
        document.onmouseup = null;

        // Re-enable text selection in Firefox
        if (document.onselectstart == null && document.body.style.MozUserSelect != null) {
            document.body.style.MozUserSelect = "";
        }     
        else
            document.onselectstart = null;

    };

    //////////////////////////////////////////////////////////////
    // END Functions to support dragging and dropping within the grid
    //////////////////////////////////////////////////////////////
}

// This class makes it easier to pass around grid coordinates
//
function RowColumnClass(rowId, columnId) {
    this.RowId = rowId;
    this.ColumnId = columnId;
}

// This class makes it easer to pass around the customizable properties of a field
//
function CustomizablePropertiesClass(customLabel, readOnly, required, hideInNormalView, displayBooleanType) {
    this.CustomLabel = customLabel;
    this.ReadOnly = readOnly;
    this.Required = required;
    this.HideInNormalView = hideInNormalView;
    this.DisplayControlType = displayBooleanType;
};

// This class is the client-side equivalent to the PanelDefinitionData server-side class.
// The object structure of PanelDefinitionClass and PanelDefinitionData must be kept in sync
// in order for server-side deserialization to work properly.
//
function PanelDefinitionClass(hiddenFieldId) {
    // If hiddenFieldId is passed, PanelDefinition state will be stored in its Value property.
    
    var panelDefinition = {};

    /* panelDefinition object structure must be kept in sync with the SOA PanelDefinitionData
        object structure.
    { 
         { "IsMultipleInstance" : "" 
           "Groups" : [
             { "Columns" : [
                { "Fields" : [
                    {   "PropertyName" : "",
                        "Caption" : "",
                        "EntityName" : "",
                        "IsReadOnly" : "",
                        "IsRequired" : "",
                        "HideInNormalView: "",
                        "DisplayControlType": ""
                    }]
                }]
             }]
         }
    }
    */
    // Add a field to the PanelDefinition JSON object. Initialize JSON object if it hasn't been.
    //
    this.AddFieldToPanelDefinition = function (rowId, columnId, propertyName, caption, entityName, isReadOnly, isRequired, hideInNormalView, displayBooleanType, isMultipleInstance) {
        // Initialize JSON object if it hasn't been created yet.
        if (panelDefinition.Groups == null) {
            // Initialize the Groups array, the Columns array, and the initial column.
            var Groups = { "Groups": [] };
            panelDefinition = Groups;
            var Columns = { "Columns": [] };
            panelDefinition.Groups[0] = Columns;
            var Fields = { "Fields": [] };
            panelDefinition.Groups[0].Columns[0] = Fields;
        }

        // Initialize other columns if needed.
        if (panelDefinition.Groups[0].Columns[columnId] == null) {
            // Need to initialize columns from index 1 to columnId.
            for (var i = 1; i <= columnId; i++) {
                if (panelDefinition.Groups[0].Columns[i] == null) {
                    var FieldsN = { "Fields": [] };
                    panelDefinition.Groups[0].Columns[i] = FieldsN;
                }
            }
        }
        var newField;
        if (displayBooleanType != null) {
            newField = { "PropertyName": propertyName, "Caption": caption, "EntityName": entityName, "IsReadOnly": isReadOnly, "IsRequired": isRequired, "HideInNormalView": hideInNormalView, "DisplayControlType": displayBooleanType };
        } else {
            newField = { "PropertyName": propertyName, "Caption": caption, "EntityName": entityName, "IsReadOnly": isReadOnly, "IsRequired": isRequired, "HideInNormalView": hideInNormalView };
        }
        panelDefinition.Groups[0].Columns[columnId].Fields[rowId] = newField;
        panelDefinition.IsMultipleInstance = isMultipleInstance;

        this.SavePanelDefinitionState();
    };

    // Get a field from the panel definition by property and entity name
    //
    this.GetField = function(propertyName, entityName) {
        // Find the field
        for (var iCol = 0; iCol < panelDefinition.Groups[0].Columns.length; iCol++) {
            for (var iField = 0; iField < panelDefinition.Groups[0].Columns[iCol].Fields.length; iField++) {
                if (panelDefinition.Groups[0].Columns[iCol].Fields[iField] != null &&
                    panelDefinition.Groups[0].Columns[iCol].Fields[iField].PropertyName == propertyName &&
                    panelDefinition.Groups[0].Columns[iCol].Fields[iField].EntityName == entityName) {
                    return panelDefinition.Groups[0].Columns[iCol].Fields[iField];
                }
            }
        }
        return null;
    };    

    // Remove a field from the PanelDefinition JSON object
    //
    this.RemoveFieldFromPanelDefinition = function(propertyName, entityName) {
        var field = this.GetField(propertyName, entityName);
        if (field == null) {
            alert('Warning: Could not remove field: ' + entityName + '.' + propertyName);
            return;
        }

        // Found it, now clear it.
        this.ClearFieldInPanelDefinition(field);
        this.SavePanelDefinitionState();
    };

    // Update a field entity name in the PanelDefinition JSON object
    //
    this.UpdateEntityNameInPanelDefinition = function (propertyName, oldEntityName, newEntityName) {
        var field = this.GetField(propertyName, oldEntityName);
        if (field == null) {
            alert('Warning: Could not update entityName for: ' + oldEntityName + '.' + propertyName);
            return;
        }
        field.EntityName = newEntityName;
        this.SavePanelDefinitionState();
    }; // Update a field label in the PanelDefinition JSON object
    //
    this.UpdateLabelInPanelDefinition = function(propertyName, entityName, labelValue) {
        var field = this.GetField(propertyName, entityName);
        if (field == null) {
            alert('Warning: Could not update label for: ' + entityName + '.' + propertyName);
            return;
        }
        field.Caption = labelValue;
        this.SavePanelDefinitionState();
    };

    // Update a field read-only attribute in the PanelDefinition JSON object
    //
    this.UpdateReadOnlyInPanelDefinition = function(propertyName, entityName, readOnlyValue) {
        var field = this.GetField(propertyName, entityName);
        if (field == null) {
            alert('Warning: Could not update read-only attribute for: ' + entityName + '.' + propertyName);
            return;
        }
        field.IsReadOnly = readOnlyValue;
        this.SavePanelDefinitionState();
    };


    // Update a field required attribute in the PanelDefinition JSON object
    //
    this.UpdateRequiredInPanelDefinition = function (propertyName, entityName, requiredValue) {
        var field = this.GetField(propertyName, entityName);
        if (field == null) {
            alert('Warning: Could not update required attribute for: ' + entityName + '.' + propertyName);
            return;
        }
        field.IsRequired = requiredValue;
        this.SavePanelDefinitionState();
    };
    
    // Update a field HideInNormalView attribute in the PanelDefinition JSON object
    //
    this.UpdateHideInNormalViewInPanelDefinition = function(propertyName, entityName, hideInNormalView) {
        var field = this.GetField(propertyName, entityName);
        if (field == null) {
            alert('Warning: Could not update HideInNormalView attribute for: ' + entityName + '.' + propertyName);
            return;
        }
        field.HideInNormalView = hideInNormalView;
        this.SavePanelDefinitionState();
    };

    // Update a field DisplayControlType attribute in the PanelDefinition JSON object
    //
    this.UpdateDisplayBooleanTypeInPanelDefinition = function (propertyName, entityName, displayBooleanTypeValue) {
        var field = this.GetField(propertyName, entityName);
        if (field == null) {
            alert('Warning: Could not update extension data attribute for: ' + entityName + '.' + propertyName);
            return;
        }
        field.DisplayControlType = displayBooleanTypeValue;
        this.SavePanelDefinitionState();
    };


    // Clear the properties of field in the PanelDefinition JSON object
    //
    this.ClearFieldInPanelDefinition = function(field) {
        field.PropertyName = null;
        field.Caption = null;
        field.EntityName = null;
        field.IsReadOnly = "false";
        field.IsRequired = "false";
        field.HideInNormalView = "false";
        field.DisplayControlType = null;
    }; // Remove a column from the PanelDefinition JSON object
    //
    this.RemoveColumnFromPanelDefinition = function(columnId) {
        if (panelDefinition == null || panelDefinition.Groups == null || panelDefinition.Groups[0].Columns == null)
            return;
        panelDefinition.Groups[0].Columns.splice(columnId, 1);
        this.SavePanelDefinitionState();
    };
   
    // Save the PanelDefinition JSON object to the hidden input element
    //
    this.SavePanelDefinitionState = function() {
        // Save the current state of the panel, which will be accessed server-side.
        var hiddenPanelDefinition = document.getElementById(hiddenFieldId);
        hiddenPanelDefinition.value = JSON.stringify(panelDefinition);
    };
}