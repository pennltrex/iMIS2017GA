<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="AsiCommon_Controls_OpportunityManagement_ProcessTypeSelect" Codebehind="ProcessTypeSelect.aspx.cs" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <script type="text/javascript">
    function SelectAndReturnValue()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        var result = null;
        
        var radioButtonsContainer = $('<%= ProcessType.ClientID %>');
        var radioButtons = radioButtonsContainer.getElementsByTagName('input');
        for (var i=0; i<radioButtons.length; i++)
        {
            if (radioButtons[i].type.toLowerCase() == 'radio' && radioButtons[i].checked)
            {
                result = radioButtons[i].value;
                break;
            }
        }
        if(result != null)
        {
            oWindow.result = result;
            oWindow.Close();
        }
    }
    function CloseDialogWindow()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        if (oWindow != null)
        {
            <%= Asi.Web.UI.MasterPageBase.CloseWindowClientScript %>;
        }
    }
    </script>
    <asiweb:PanelTemplateControl ID="SelectProcessTypePanel" runat="server" ShowHeader="false" Collapsible="false" FieldSet="true">
        <div class="PanelField Top">
            <asp:Label ID="ProcessTypeSelectLabel" runat="server" AssociatedControlID="ProcessType" Text="Select a Process Type"></asp:Label>
            <div class="PanelFieldValue AutoWidth" style="margin-left: 1em;width:auto;">
                <asp:RadioButtonList ID="ProcessType" runat="server" DataTextField="Value" DataValueField="Key" RepeatLayout="Table" RepeatDirection="Vertical" 
                    DataSource="<%# OrderedProcessTypes %>"
                    OnDataBound="ProcessType_DataBound" />
            </div>
        </div>
    </asiweb:PanelTemplateControl>
</asp:Content>

