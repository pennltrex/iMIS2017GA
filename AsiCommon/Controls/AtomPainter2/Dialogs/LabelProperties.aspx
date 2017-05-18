<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="AsiCommon_Controls_AtomPainter2_LabelProperties" Title="iMIS Label Manager" Codebehind="LabelProperties.aspx.cs" %>
<%@ Register TagPrefix="telerik" NameSpace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="TemplateHead">
    <script type="text/javascript">
        var args = getRadWindow().ClientParameters; //get the arguments supplied from the parent page

        if (window.attachEvent)
        {
            window.attachEvent("onload", initDialog);
        }
        else if (window.addEventListener)
        {
            window.addEventListener("load", initDialog, false);
        }

        var selectedProperty;
        var displayValue;
        var displayMask;

        function getRadWindow()
        {
            if (window.radWindow)
            {
                return window.radWindow;
            }
            if (window.frameElement && window.frameElement.radWindow)
            {
                return window.frameElement.radWindow;
            }
            return null;
        }

        function initDialog()
        {
            selectedProperty = $get('SelectedProperty');
            displayValue = $get('DisplayValue');
            displayMask = $get('DisplayMask');
            
            if (args.BoundPropertyName != null)
                selectedProperty.value = args.BoundPropertyName;
            
            if (args.DisplayMask != null)
                displayMask.value = args.DisplayMask;
                
            if (args.DisplayValue != null)
                displayValue.checked = args.DisplayValue;
        }

        function OkClicked() //fires when the Insert Link button is clicked
        {
            args.DisplayValue = displayValue.checked;
            args.BoundPropertyName = selectedProperty.value;
            args.BoundPropertyCaption = selectedProperty.options[selectedProperty.selectedIndex].text;
            args.DisplayMask = displayMask.value;

            getRadWindow().close(args);
        }
    </script>
</asp:Content>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Orientation="HorizontalTop">
        <Tabs>
            <telerik:RadTab PageViewID="iMISLabelViewer" Selected="true" Text="Properties" ImageUrl="../../../Images/AtomPainter/iMISLabelTool.gif" />
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="TabContainer" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="iMISLabelViewer" runat="server">
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td colspan="2" class="Label" nowrap>
					    <input type="checkbox" id="DisplayValue" checked="checked" />
					    <label for="DisplayValue">Display Value</label>
                    </td>
				</tr>
				<tr>
					<td class="Label" nowrap>
                        <label id="SelectedPropertyLabel" for="SelectedProperty" class="Label">Property</label>
                    </td>
                    <td>
                        <select id="SelectedProperty" class="DropDown">
                            <asp:Repeater ID="SelectedPropertyOptionsRepeater" runat="server" OnDataBinding="SelectedPropertyOptionsRepeater_DataBinding">
                                <HeaderTemplate>
                                    <option></option>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <option value="<%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Name") %>"><%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Caption") %></option>
                                </ItemTemplate>
                            </asp:Repeater>
                        </select>
					</td>
				</tr>
				<tr>
				    <td class="Label" nowrap>
				        <label class="Label" for="DisplayMask">Display Format</label>
				    </td>
				    <td>
				        <input type="text" id="DisplayMask" class="RadETextBox" />
				    </td>
				</tr>
				<tr>
    			    <td colspan="2" style="padding-top: 5px; padding-left: 10px;">
	                    <a href="msnet-formatting-strings.pdf" target="_blank" style="font-size:smaller;">View complete list of Date/Time and Number formats</a>
				    </td>
				</tr>
			</table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
