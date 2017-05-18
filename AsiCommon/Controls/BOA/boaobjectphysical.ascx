<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BOA.BOAObjectPhysical" Codebehind="BOAObjectPhysical.ascx.cs" %>
<script type="text/javascript">
function ShowTableList() {
    ShowDialog(gWebRoot + "/AsiCommon/Controls/BOA/BOATableList.aspx", null, 600, 500, "Table List", null, "E", TableSelected, null, false, true, null);
    return CancelEvent();
}
function TableSelected(dialogWindow)  {
    var returnValue = dialogWindow.result;
    if (returnValue != null) {
        var newTables = document.getElementById("<%= NewTables.ClientID %>");
        newTables.value = returnValue;
        InitiateControlEventWithArgument('<%= TableAddedButton.ClientID %>', returnValue);
    }   
}
    function EnableDisableRemoveTableButton() {
        var tableList = document.getElementById("<%= TableList.ClientID %>");
        var selectedValue = tableList.options[tableList.selectedIndex].text;
        if (selectedValue.indexOf('(inherited)') >= 0) {
            document.getElementById("<%= RemoveTableButton.ClientID %>").disabled = true;
        } else {
            document.getElementById("<%= RemoveTableButton.ClientID %>").disabled = false;
        }
    }
</script>
<asiweb:PanelTemplateControl2 ID="DatabasePanel" runat="server" ShowHeader="false" FieldSet="true">
    <asp:Button ID="TableAddedButton" runat="server" style="display:none;" OnClick="AddTables" data-ajaxUpdatedControlID='TablesPanel' />
    <input id="NewTables" type="hidden" runat="server" />

    <asp:Panel ID="JoinsPanel" runat="server">
        <asp:UpdatePanel ID="JoinsUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div id="TablesPanel" class="PanelField Top">
                    <asp:label id="TablesLabel" runat="server" Text="Tables" AssociatedControlID="TableList" />
                    <div class="PanelFieldValue">
                        <asp:ListBox id="TableList" runat="server" Rows="6" CssClass="InputXLarge" OnChange="EnableDisableRemoveTableButton();"></asp:ListBox>
                    </div>
                    <div style="clear:both;">
                        <asiweb:StyledButton ID="AddTabButton" Text="Add" OnClientClick="ShowTableList();" runat="server" />
	                    <asiweb:StyledButton id="RemoveTableButton" runat="server" Text="Remove" OnClick="RemoveTableButton_Click" />
                    </div>
                </div>
                <div class="PanelField Top">
                    <div style="float:left;" >
                        <asp:label id="UsedColumnsLabel" runat="server" Text="Used Columns" AssociatedControlID="UsedColumnList" />
                        <div class="PanelFieldValue">
                            <asp:ListBox id="UsedColumnList" runat="server" Rows="6" CssClass="InputXLarge" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                    <div style="float:left;" >
                        <asp:label id="AvailableColumnsLabel" runat="server" Text="Available Columns" AssociatedControlID="AvailableColumnList" />
                        <div class="PanelFieldValue">
                            <asp:ListBox id="AvailableColumnList" runat="server" Rows="6" CssClass="InputXLarge" SelectionMode="Multiple" />
                        </div>
                    </div>
                    <div style="clear:both;">
	                    <asiweb:StyledButton id="AddPropertiesButton" runat="server" Text="Add as Properties" OnClick="AddPropertiesButton_Click" data-ajaxUpdatedControlID="ColumnsSpan" />
	                    <asiweb:StyledButton id="AddAllPropertiesButton" runat="server" Text="Add All as Properties" OnClick="AddPropertiesButton_Click" data-ajaxUpdatedControlID="ColumnsSpan" />
                    </div>
                </div>
                <div class="PanelField Top">
                    <asp:label id="FilterExpressionLabel" runat="server" Text="Filter Expression" AssociatedControlID="FilterExpression" />
                    <div class="PanelFieldValue">
                        <asp:TextBox id="FilterExpression" runat="server" Rows="4" CssClass="InputXXLarge" TextMode="MultiLine" />
                    </div>
                </div>
                <div class="PanelField Top">
                    <asp:label id="JoinsLabel" runat="server" Text="Joins" AssociatedControlID="JoinsList" />
                    <div class="PanelFieldValue">
                        <div>
	                        <div style="float:left;"><asp:DropDownList id="LeftJoinColumn" Runat="server"></asp:DropDownList></div>
	                        <div style="float:left;">=</div>
	                        <div style="float:left;"><asp:DropDownList id="RightJoinColumn" Runat="server"></asp:DropDownList>&nbsp;
	                        <asiweb:StyledButton id="AddJoinButton" runat="server" Text="Add" OnClick="AddJoinButton_Click" /></div>
                        </div>
                        <div style="clear:both;"></div>
                        <asp:ListBox id="JoinsList" runat="server" CssClass="InputXXLarge" />
                    </div>
                    <div style="clear:both;">
                        <asiweb:StyledButton id="RemoveJoinButton" runat="server" Text="Remove" OnClick="RemoveJoinButton_Click" />
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="AddPropertiesButton" />
                <asp:AsyncPostBackTrigger ControlID="AddAllPropertiesButton" />
                <asp:AsyncPostBackTrigger ControlID="TableAddedButton" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
</asiweb:PanelTemplateControl2>
