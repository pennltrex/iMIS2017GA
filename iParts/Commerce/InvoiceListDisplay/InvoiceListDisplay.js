function Asi_Web_iParts_Commerce_InvoiceListDisplay(gridID) {
    var editedRow;


    this.ReverseItem = function () {
        var grid = $find(gridID);
        if (grid != null) {
            var selItem = grid.get_selectedItems();
            //if nothing selected
            if (selItem.length == 0) {
                alert('Please select a row.');
                return false;
            }

            else {
                //Make sure we really want to reverse the invoice.
                var invoiceNumber = selItem[0].get_cell("InvoiceNumber").innerHTML;
                var invoiceAmount = selItem[0].get_cell("InvoiceAmount").innerHTML;
                var reversedAmount = selItem[0].get_cell("ReversedAmount").innerHTML;
                var tempthing = parseFloat(invoiceAmount) - parseFloat(reversedAmount);
                return confirm('Are you sure you want to reverse invoice number ' + invoiceNumber + ' for a total of ' + tempthing.toFixed(2) + '?');
            }
        }
    }
    
    //Highlight selected row
        this.RowSelected = function(sender, args) {
            var grid = sender;
            var masterTable = grid.get_masterTableView();
            masterTable.selectItem(args.get_itemIndexHierarchical());
            editedRow = args.get_itemIndexHierarchical();
        }

        //Make sure it's a command we know about
        this.GridCommand = function(sender, args) {
            if (args.get_commandName() != "Reverse") {
                editedRow = null;
            }
        }

        this.GridCreated = function(sender) {
            var gridElement = sender.get_element();
        }
}

