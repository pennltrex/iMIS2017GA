
function Asi_Web_iParts_Communications_FormFieldDisplay() {

    // Update a global collection with the formFieldDefinition's property ID and the value of the control
    // so that a function's responses can be persisted.
    this.SaveFormFieldValue = function (inputControl, fieldPropertyId) {
        var myValue = '';
        if (inputControl.id.indexOf('radioButtonList') > -1) {
            myValue = inputControl.rows[0].cells[0].firstChild.checked ? 'True' : 'False';
        }
        else if (inputControl.type != null 
            && (inputControl.type == 'text' || inputControl.type == 'textarea')) {
            
            myValue = inputControl.value;
        }
        else return;
        
        // FormFieldResponseData is a global var, defined in EventProgramDisplayDisplay.js
        FormFieldResponseData[fieldPropertyId] = myValue;
    };
}