<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ContactAdder.Adder" Codebehind="Adder.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<input type="hidden" id="FinderAdderSelectedKey" runat="server" />

<asiweb:PanelTemplateControl ID="ContactAdderPanel" runat="server" TemplateTitle="New Contact" Visible="false">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server">
        <div style="text-align:right; margin-right:20px">
		    <asiweb:StyledButton ID="btnSave" runat="server" CommandButtonType="Save" />
		    <asiweb:StyledButton ID="btnCancel" runat="server" CommandButtonType="Cancel" />
		    </div>
			<asiweb:BusinessDataGrid id="DupeGrid" runat="server" cellpadding="3" autogeneratecolumns="False" visible="False">
				<columns>
					<asp:templatecolumn headertext="Full Name">
						<itemtemplate>
							<asp:linkbutton id="LinkButton1" runat="server" commandargument='<%# DataBinder.Eval(Container.DataItem, "ContactKey") %>' text='<%# DataBinder.Eval(Container.DataItem, "FullName") %>'>
							</asp:linkbutton>
						</itemtemplate>
					</asp:templatecolumn>
					<asp:boundcolumn datafield="FullAddress" headertext="Address"></asp:boundcolumn>
				</columns>
			</asiweb:BusinessDataGrid>
			<table cellspacing="0" width="100%">
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblId" runat="server"></asp:label></td>
					<td class="PanelTableValue" colspan="3"><asp:textbox id="txtId" runat="server" cssclass="ValueNumeric" enabled="False"></asp:textbox>&nbsp;&nbsp;
						<div id="divParent" style="DISPLAY: none"><asp:checkbox id="checkParent" runat="server" visible="True" text="Link To Parent"
								textalign="Right" checked="True"></asp:checkbox></div>
					</td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblMemberType" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:dropdownlist id="CboMemberType" tabIndex="1" runat="server"></asp:dropdownlist></td>
					<td class="PanelTablePrompt"><asp:label id="lblCompanyName" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtCompanyName" AutoPostBack="true" tabIndex="3" runat="server" Width="136px"></asp:textbox><asp:linkbutton id="btnCompany" runat="server" cssclass="LinkButton"></asp:linkbutton>&nbsp;
					    <asiweb:StyledButton ID="btnCompanyLookup" runat="server" Text="..." ToolTip="Company Lookup" />
					    <asiweb:StyledButton ID="btnCompanyClear" runat="server" Text="X" ToolTip="Clear Selected Company" />
					</td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblStatus" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:dropdownlist id="CboStatus" tabIndex="2" runat="server"></asp:dropdownlist></td>
					<td class="PanelTablePrompt"><asp:label id="lblCompanySort" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtCompanySort" tabIndex="4" runat="server" enabled="False"></asp:textbox></td>
				</tr>
				<tr>
					<td class="mdTitle" colspan="4"><asp:label id="lblContact" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblPrefix" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:dropdownlist id="CboPrefix" tabIndex="5" runat="server"></asp:dropdownlist></td>
					<td class="PanelTablePrompt"><asp:label id="lblTitle" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtTitle" tabIndex="11" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblFirstName" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtFirstName" tabIndex="6" runat="server"></asp:textbox></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblMiddleName" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtMiddleName" tabIndex="7" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"><asp:label id="lblHomePhone" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtHomePhone" tabIndex="13" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblLastName" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtLastName" tabIndex="8" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"><asp:label id="lblWorkPhone" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtWorkPhone" tabIndex="13" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblSuffix" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:dropdownlist id="CboSuffix" tabIndex="9" runat="server"></asp:dropdownlist></td>
					<td class="PanelTablePrompt"><asp:label id="lblFax" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtFax" tabIndex="14" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblInformalName" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtInformalName" tabIndex="10" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"><asp:label id="lblEmail" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtEmail" tabIndex="15" runat="server"/>
					    <asp:CustomValidator runat="server" ControlToValidate="txtEmail" ID="txtEmailValidator"/>
					</td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblWebSite" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtWebSite" tabIndex="10" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"><asp:label id="lblTollFree" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtTollFree" tabIndex="15" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td class="mdTitle" colspan="4"><asp:label id="lblAddressInfo" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblAddress" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtAddressLine1" tabIndex="16" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"><asp:label id="lblState" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:dropdownlist id="CboState" tabIndex="19" runat="server"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt">&nbsp;</td>
					<td class="PanelTableValue"><asp:textbox id="txtAddressLine2" tabIndex="17" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"><asp:label id="lblZip" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtZip" tabIndex="20" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt">&nbsp;</td>
					<td class="PanelTableValue"><asp:textbox id="txtAddressLine3" tabIndex="17" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"><asp:label id="lblCountry" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:dropdownlist id="CboCountry" tabIndex="21" runat="server"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="lblCity" runat="server"></asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="txtCity" tabIndex="18" runat="server"></asp:textbox></td>
					<td class="PanelTablePrompt"></td>
					<td class="PanelTableValue"></td>
				</tr>
			</table>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
