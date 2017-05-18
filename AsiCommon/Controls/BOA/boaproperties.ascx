<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BOA.BOAProperties"  AutoEventWireup="true" Codebehind="BOAProperties.ascx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Src="~/AsiCommon/Controls/BOA/BOAPropertiesDefinition.ascx" TagPrefix="boa" TagName="PropertiesDefinition" %>
<%@ Register Src="~/asicommon/controls/boa/boapropertiesvalues.ascx" TagPrefix="boa" TagName="PropertiesValues" %>
<%@ Register Src="~/asicommon/controls/boa/boapropertiesdisplay.ascx" TagPrefix="boa" TagName="PropertiesDisplay" %>

<%--If scroll bars aren't shown, then the header gets out of line with the columns. This is an attempt to work around that. 
This behavior keeps changing with every Telerik upgrade. In the last release the problem was if the scroll bars were showing. 
There is also an issue with the column headers when the scroll bar is showing and there is a postback. --%>
<script type="text/javascript" id="GridScript">
	var grid;
	function GridCreated() {
		grid = this;

		var gridData = $('<%= PropertyList.ClientID %>_GridData');
		if (gridData != null)
			gridData.style.height = '190px';
	}
	function RowSelected(row) {
		InitiateControlEventWithArgument('<%= RowSelectedButton.ClientID %>', row._selectedIndexes[0] > 0 ? row._selectedIndexes[0] : '0');
	}
	function RowDblClick(row) {
		//TODO: go into edit mode on grid on double click
		//grid.MasterTableView.SelectedRows;
	}
</script>
<asiweb:PanelTemplateControl2 ID="PropertiesPanel" runat="server" Collapsible="false">
    <radG:RadGrid ID="PropertyList" runat="server" EnableAJAX="false" AutoGenerateColumns="false">
        <MasterTableView ClientDataKeyNames="BranchPropertyKey" RetrieveAllDataFields="false" AdditionalDataFieldNames="BranchPropertyKey" EditMode="InPlace" DataKeyNames="BranchPropertyKey">
            <Columns>
                <telerik:GridTemplateColumn UniqueName="RefreshFromDatabaseColumn" Groupable="False">
                    <HeaderStyle HorizontalAlign="Center" Width="30px" />
                    <ItemStyle HorizontalAlign="Center" />                     
                    <ItemTemplate>
                        <asp:ImageButton ID="RefreshFromDatabaseButton" BorderWidth="0px" CommandName="RefreshFromDatabase" 
                            ImageUrl="~/AsiCommon/images/icon_refresh.png" ToolTip="Refresh from database"
                            AlternateText="Refresh from database" Style="cursor:pointer;" runat="server"></asp:ImageButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <radG:GridEditCommandColumn ButtonType="ImageButton" HeaderStyle-Width="52px" 
                    EditImageUrl="~/AsiCommon/Images/icon_edit.png" EditText="Edit"
                    UpdateImageUrl="~/AsiCommon/Images/icon_save.png" UpdateText="Update"
                    CancelImageUrl="~/AsiCommon/Images/icon_close.png" CancelText="Cancel" />
                <radG:GridTemplateColumn HeaderText="Property Name">
                    <ItemTemplate>
                        <asp:Label ID="Name" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Name" runat="server" Width="100%" />
                    </EditItemTemplate>
                </radG:GridTemplateColumn>
                <radG:GridTemplateColumn HeaderText="Data Type">
                    <ItemTemplate>
                        <asp:Label ID="DataType" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:dropdownlist id="DataType" runat="server">
                            <asp:ListItem Value="BigInt">Big Integer</asp:ListItem>
                            <asp:ListItem Value="LongVarBinary">Blob</asp:ListItem>
                            <asp:ListItem Value="Boolean">Boolean</asp:ListItem>
                            <asp:ListItem Value="DBTimeStamp">DateTime</asp:ListItem>
                            <asp:ListItem Value="Numeric">Decimal</asp:ListItem>
                            <asp:ListItem Value="Guid">Guid</asp:ListItem>
                            <asp:ListItem Value="Integer">Integer</asp:ListItem>
                            <asp:ListItem Value="VarWChar">String</asp:ListItem>
                            <asp:ListItem Value="LongVarWChar">Text</asp:ListItem>
                        </asp:dropdownlist>
                    </EditItemTemplate>
                </radG:GridTemplateColumn>
                <radG:GridTemplateColumn HeaderText="Length">
                    <HeaderStyle Width="80px" />
                    <ItemStyle Width="80px" />                     
                    <ItemTemplate>
                        <asp:Label ID="Length" runat="server" Text="display" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Length" runat="server" Text="edit" Width="65px" />
                    </EditItemTemplate>
                </radG:GridTemplateColumn>
                <radG:GridTemplateColumn HeaderText="Scale">
                    <HeaderStyle Width="80px" />
                    <ItemStyle Width="80px" />                     
                    <ItemTemplate>
                        <asp:Label ID="Scale" runat="server" Text="&nbsp;"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Scale" runat="server" Width="65px"></asp:TextBox>
                    </EditItemTemplate>
                </radG:GridTemplateColumn>
                <radG:GridTemplateColumn HeaderText="Key">
                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                    <ItemStyle HorizontalAlign="Center" Width="80px" />                     
                    <ItemTemplate>
                        <asp:CheckBox ID="IsInPrimaryKey" runat="server" Enabled="false" />
                    </ItemTemplate>
                </radG:GridTemplateColumn>
                <radG:GridTemplateColumn HeaderText="Required">
                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                    <ItemStyle HorizontalAlign="Center" Width="80px" />                    
                    <ItemTemplate>
                        <asp:CheckBox ID="Required" runat="server" Enabled="false" />
                    </ItemTemplate>
                </radG:GridTemplateColumn>
                <radG:GridButtonColumn CommandName="Delete" ButtonType="ImageButton" Text="Delete" HeaderStyle-Width="40px" ItemStyle-Width="40px"
                    ImageUrl="~/AsiCommon/Images/icon_delete.png" ConfirmText="Are you sure you wish to remove this property?" />
            </Columns>
            <NoRecordsTemplate>
                <asp:label runat="server" id="NoRecordsLabel">There are no properties. Select the Database tab to create properties.</asp:label>
            </NoRecordsTemplate>
        </MasterTableView>
        <ClientSettings>
            <ClientEvents OnGridCreated="GridCreated" OnRowSelected="RowSelected" OnRowDblClick="RowDblClick" />
            <Selecting AllowRowSelect="true" />
            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
            <Resizing AllowColumnResize="True" AllowRowResize="false" ResizeGridOnColumnResize="true" ClipCellContentOnResize="true" EnableRealTimeResize="true" />
        </ClientSettings>
    </radG:RadGrid>
    <asp:Button ID="RowSelectedButton" runat="server" Style="display:none;" OnClick="RowSelectedButton_Click" />

    <div style="clear:both;padding-bottom:.5em;"></div>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" SkinID="SubTabs">
        <Tabs>
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
            <telerik:RadTab Text="Display" PageViewID="DisplayPage" />
            <telerik:RadTab Text="Values" PageViewID="ValuesPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <asp:UpdatePanel ID="PropertiesUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <ContentTemplate>
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
             Style="margin-top:-1px;">
            <telerik:RadPageView runat="server" ID="DefinitionPage">
                <asp:Panel ID="DefinitionPanel" runat="server">
                    <boa:PropertiesDefinition ID="PropertyDefinition" runat="server" Enabled="false" />
                </asp:Panel>             
            </telerik:RadPageView> 
            <telerik:RadPageView runat="server" ID="DisplayPage">
                <asp:Panel ID="DisplayPanel" runat="server">
                    <boa:PropertiesDisplay ID="PropertyDisplay" runat="server" Enabled="false" />
                </asp:Panel>             
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ValuesPage" >
                <asp:Panel ID="ValuesPanel" runat="server">
                    <boa:PropertiesValues ID="PropertyValues" runat="server" Enabled="false" />
                </asp:Panel>             
            </telerik:RadPageView>                                         
        </telerik:RadMultiPage> 
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RowSelectedButton" />
        </Triggers>
    </asp:UpdatePanel>

</asiweb:PanelTemplateControl2>