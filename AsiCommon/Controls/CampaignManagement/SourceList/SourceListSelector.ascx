<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_SourceListSelector" Codebehind="SourceListSelector.ascx.cs" %>

<script type="text/javascript">
    addLoadEvent(SelectControl);
    function SelectControl(dropdownlist, selectedvalue)
    {
        if (dropdownlist == null)
            dropdownlist = $get('<%= ComponentSelector.ClientID %>');
            
        for(var i=0;i<dropdownlist.options.length;i++)
        {
            var id = dropdownlist.options[i].value;
            var componentControl = $get(id);
            if (componentControl != null) {
                if (componentControl.id != 'IQAQuery')
                    componentControl.style.display = "none";
                else
                    componentControl.style.visibility = "hidden";
            }
        }
        // If selectedvalue is passed in, use it to set the value of the 
        // dropdownlist and the visible component control. If selectedvalue
        // is passed in empty, use the current value of the dropdown.
        if (selectedvalue == null || selectedvalue.length == 0)
            selectedvalue = dropdownlist.value;
        else
            dropdownlist.value = selectedvalue;
            
        var visibleControl = $get(selectedvalue);
        
        if(visibleControl != null) {
            if (visibleControl.id == 'IQAQuery')
                visibleControl.style.visibility = "visible";
            else
                visibleControl.style.display = "block";
        }
    }
</script>

<asiweb:PanelTemplateControl2 ID="CreateNewSourceListPanel" runat="server" Collapsible="false" TemplateTitle="Add Source List" FieldSet="true">
    <asiweb:BusinessDropDownList ID="ComponentSelector" runat="server" RenderPanelField="true" DisplayCaption="true" Caption='<%# Asi.ResourceManager.GetPhrase("SelectType","Select Type") %>' DataSource="<%# RegisteredComponents %>" DataTextField="Description" DataValueField="Name" />
    <asp:Panel runat="server" ID="ComponentPanel" style="width:99%;clear: both"></asp:Panel>
</asiweb:PanelTemplateControl2>
