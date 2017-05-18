<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotificationSetEdit.ascx.cs" Inherits="Asi.Web.iParts.Communications.NotificationSetCreator.NotificationSetEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<style type="text/css">.rgEditForm{padding:10px!important;} .EditFormButtonRow TD{padding-top:5px;padding-left:45px;}</style>
<asiweb:PanelTemplateControl ID="NotificationSetPanel" runat="server" FieldSet="true"
	ShowHeader="true" BorderStyle="None" Text="New alert set" Collapsed="false" Collapsible="false">
	
	<asp:UpdatePanel runat="server" ID="RefreshPanel" UpdateMode="Conditional" ChildrenAsTriggers="False">
	<ContentTemplate>
	<asp:Panel ID="Panel1" runat="server" DefaultButton="SubmitButton" >
		<telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />
		<telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="True" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">
			<div runat="server" visible="false" id="DivLabelErrorMessage">
			<asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
			</div> 
			<div class="PanelField Left">      
				<asiweb:BusinessLabel id="NotificationSetNameLabel" runat="server" Text="Name" AssociatedControlID="NotificationSetNameTextBox" CssClass="Required"/>       
				<div class="PanelFieldValue">
					<asiweb:BusinessTextBox id="NotificationSetNameTextBox" runat="server" CssClass="InputXLarge" />
					<asiweb:AsiRequiredFieldValidator ID="NotificationSetNameTextBoxValidator" runat="server"
						ControlToValidate="NotificationSetNameTextBox" EnableClientScript="true" ErrorMessage="Required"
						Display="Static" SetFocusOnError="false" CssClass="Important" />   
				</div>
			</div>
			<div class="PanelField Left">        
				<asiweb:BusinessLabel id="NotificationSetDescLabel" runat="server" Text="Description" AssociatedControlID="NotificationSetDescTextBox" CssClass="Required"/>
				<div class="PanelFieldValue">
					<asiweb:BusinessTextBox id="NotificationSetDescTextBox" runat="server" Rows="4" TextMode="MultiLine" CssClass="InputXXLarge" />
					<asiweb:AsiRequiredFieldValidator ID="NotificationDescRequiredFieldValidator" runat="server"
						ControlToValidate="NotificationSetDescTextBox" EnableClientScript="true" ErrorMessage="Required"
						Display="Static" SetFocusOnError="false" CssClass="Important" />  
				</div>
			</div>    
			
			<div class="PanelField">
				<div class="PanelFieldValue AutoWidth FloatNone">
					<asp:CheckBox ID="LimitUsersCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" />
				</div>                
			</div>
			
			<asiweb:BusinessLabel id="BusinessLabel1" runat="server" Text="Alert Tasks" AssociatedControlID="RadGrid1"/><br/>      
			<asp:Label runat="server" ID="labelError" CssClass="Error" Visible="False"></asp:Label>
			<telerik:RadGrid AllowMultiRowEdit="false" AllowMultiRowSelection="false" AllowSorting="false" 
				AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="false" CssClass="Grid" 
				EnableLinqExpressions="false" FooterStyle-CssClass="GridFooter" GridLines="None" HeaderStyle-CssClass="GridHeader" 
				ID="RadGrid1" ItemStyle-CssClass="GridRow" runat="server" ShowStatusBar="false" ShowGroupPanel="false" AllowPaging="False">
			  
				<MasterTableView AllowMultiColumnSorting="false" ClientDataKeyNames="NotificationSetDetailId" CommandItemDisplay="Top"
					DataKeyNames="NotificationSetDetailId" EditMode="EditForms" ShowHeader="true"
					InsertItemPageIndexAction="ShowItemOnCurrentPage">
			
					<CommandItemStyle HorizontalAlign="right" />
					<CommandItemTemplate>
						<asp:LinkButton ID="btnEditSelected" runat="server" OnClientClick="javascript:return EditItem();" CommandName="EditSelected">
							<asp:Image ID="Image1" runat="server" SkinID="PanelCommandButtonEdit" />
							<span class="RadGridCommandText"> <%#GetTranslatedPhrase("Edit selected")%> </span>
							&nbsp;&nbsp;
						</asp:LinkButton>
						<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'>
							<asp:Image ID="Image2" runat="server" SkinID="CheckButton" />
							<span class="RadGridCommandText"> <%#GetTranslatedPhrase("Save")%> </span>
							&nbsp;&nbsp;
						</asp:LinkButton>
						<asp:LinkButton ID="SaveButton" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'>
							<asp:Image ID="Image3" runat="server" SkinID="CheckButton" />
							<span class="RadGridCommandText"> <%#GetTranslatedPhrase("Save")%> </span>
							&nbsp;&nbsp;
						</asp:LinkButton>
						<asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>' OnClientClick="CancelRow()">
							<asp:Image ID="Image4" runat="server" SkinID="CancelButton" />
							<span class="RadGridCommandText"> <%#GetTranslatedPhrase("Cancel")%> </span>
							&nbsp;&nbsp;
						</asp:LinkButton>
						<asp:LinkButton ID="AddButton" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>' OnClientClick="AddNewRow()">
							<asp:Image ID="Image5" runat="server" SkinID="PanelCommandButtonAdd" />
							<span class="RadGridCommandText"> <%#GetTranslatedPhrase("Add new")%> </span>
							&nbsp;&nbsp;
						</asp:LinkButton>                    
						<asp:LinkButton ID="DeleteButton" OnClientClick="javascript: return DeleteItem();" runat="server" CommandName="DeleteSelected">
							<asp:Image ID="Image6" runat="server" SkinID="PanelCommandButtonDelete" />
							<span class="RadGridCommandText"> <%#GetTranslatedPhrase("Delete selected")%> </span>
						</asp:LinkButton>&nbsp;&nbsp;                          
					</CommandItemTemplate>
									  
					<Columns>
				
						<telerik:GridTemplateColumn UniqueName="TaskIdColumn" HeaderText="Task" EditFormHeaderTextFormat="Task" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="TaskDefinitionId" SortExpression="TaskDefinitionId" >
						<ItemTemplate>                         
							<asiweb:BusinessLabel id="TaskLabel" runat="server" />                                    
						</ItemTemplate>                                      
						<EditItemTemplate>
							<span style="padding-left:1em;">                           
							<asiweb:BusinessDropDownList runat="server" ID="TaskIdSelect" ShowNullItem="false" />
							<asp:CustomValidator ID="UniqueValueValidator" runat="server" ErrorMessage="UniqueError" Display="dynamic"></asp:CustomValidator>                                                
							</span>
						</EditItemTemplate>
						</telerik:GridTemplateColumn>
																									 
						<telerik:GridTemplateColumn UniqueName="MoveButtonsColumn" EditFormHeaderTextFormat="">
							<ItemTemplate>
								<asp:ImageButton ID="MoveUpButton" runat="server" CommandName="MoveUp" OnCommand="Grid1_OnMoveCommand" 
									Visible="<%# RadGrid1.EditIndexes.Count < 1 && !RadGrid1.MasterTableView.IsItemInserted %>" SkinID="MoveItemUpButton" 
									ToolTip='<%# ResourceManager.GetPhrase("MoveUp", "Move Up") %>'/>
								<asp:ImageButton ID="MoveDownButton" runat="server" CommandName="MoveDown" OnCommand="Grid1_OnMoveCommand"
									Visible="<%# RadGrid1.EditIndexes.Count < 1 && !RadGrid1.MasterTableView.IsItemInserted %>" SkinID="MoveItemDownButton"
									ToolTip='<%# ResourceManager.GetPhrase("MoveDown", "Move Down") %>' />
							</ItemTemplate>
							<ItemStyle Width="25px" />
							<HeaderStyle Width="25px" />
						</telerik:GridTemplateColumn>
						
					</Columns> 
					 
					<NoRecordsTemplate>
						<asiweb:BusinessLabel ID="NoRecordLabel" runat="server" Text="(None)"></asiweb:BusinessLabel>
					</NoRecordsTemplate> 

					<EditFormSettings>
						<FormTableItemStyle Wrap="False"/>
						<FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" />
						<FormTableStyle GridLines="None" CellSpacing="0" CellPadding="5" />
						<FormTableAlternatingItemStyle Wrap="False"/>
						<FormStyle Width="100%"/>
						<EditColumn UniqueName="EditCommandColumn1" UpdateText="Save" CancelText="Cancel" InsertText="Save" ButtonType="PushButton" />                        
						<FormTableButtonRowStyle CssClass="EditFormButtonRow" />
					</EditFormSettings> 
								
				</MasterTableView>

				<ClientSettings>
					<Selecting AllowRowSelect="True" /> 
					<ClientEvents OnRowClick="RowSelected" OnGridCreated="GridCreated" OnCommand="GridCommand" ></ClientEvents>                                     
				</ClientSettings>
		
			</telerik:RadGrid>        
		</telerik:RadAjaxPanel>
		</asp:Panel>
	</ContentTemplate>    
	</asp:UpdatePanel> 

	<div id="commandButtons" class="ButtonPanel NotPrinted" runat="server" style="padding-top:1em;padding-bottom:0.5em;bottom:0;">
		<div class="CommandBar">           
			<asp:Button ID="SubmitButton" runat="server" OnClick="SubmitClick" causesvalidation="true" CssClass="TextButton PrimaryButton" />
			<asp:Button ID="ResetCancelButton" runat="server" OnClick="ResetCancel_Click" causesvalidation="false" CssClass="TextButton" /> 
		</div>           
	</div> 
	
	<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
	<script type="text/javascript">
		var submitButton = $get("<%#SubmitButton.ClientID%>");

		function AddNewRow() {
			submitButton.disabled = "disabled";
			submitButton.disabled = true;
			submitButton.setAttribute("disabled", true);
		}

		function CancelRow() {
			submitButton.disabled = false;
			submitButton.removeAttribute("disabled", 0);
		}

		var editedRow;
		function RowSelected(sender, args) {
			var grid = sender;
			var masterTable = grid.get_masterTableView();
			masterTable.selectItem(args.get_itemIndexHierarchical());
			editedRow = args.get_itemIndexHierarchical();
		}

		function GridCommand(sender, args) {
			if (args.get_commandName() != "Edit" || args.get_commandName() != "Delete") {
				editedRow = null;
				submitButton.disabled = false;
				submitButton.removeAttribute("disabled", 0);
			}
		}

		function GridCreated(sender) {
			var gridElement = sender.get_element();
		}

		function DeleteItem() {
			var grid = window.$find("<%= RadGrid1.ClientID %>");
			if (grid != null) {
				var selItem = grid.get_selectedItems();
				//if nothing selected
				if (selItem.length == 0) {
					alert('<%= GetTranslatedPhrase("Please select a row.") %>');
					return false;
				}
				else {
					return confirm('<%= GetTranslatedPhrase("Delete selected task?") %>');
				}
			}
			return false;
		}

		function EditItem() {
			var grid = window.$find("<%= RadGrid1.ClientID %>");
			if (grid != null) {
				var selItem = grid.get_selectedItems();
				//if nothing selected
				if (selItem.length == 0) {
					alert('<%= GetTranslatedPhrase("Please select a row.") %>');
					return false;
				}
				else {
					submitButton.disabled = "disabled";
					submitButton.disabled = true;
					submitButton.setAttribute("disabled", true);
					return true;
				}
			}
			return false;
		}

		function ReturnToTask(selectedIndex) {
			var oWindow = GetRadWindow();
			if (oWindow != null && oWindow.BrowserWindow != null) {
				var url = GetRadWindow().BrowserWindow.location.href;
				//url = url + '&RemoveScript=true';
				if (url.indexOf('SelectedIndex') < 0) url = url + '&SelectedIndex=' + selectedIndex;
				else {
					var re = /SelectedIndex=(\d*)/g;
					url = url.replace(re, 'SelectedIndex=' + selectedIndex);
				}
				oWindow.IsDirty = true;
				GetRadWindow().BrowserWindow.location.href = url;
			}
		}
	</script>
	</telerik:RadCodeBlock>      
	
</asiweb:PanelTemplateControl>