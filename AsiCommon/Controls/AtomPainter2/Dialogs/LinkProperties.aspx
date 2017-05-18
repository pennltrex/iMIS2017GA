<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="AsiCommon_Controls_AtomPainter2_LinkProperties" Title="iMIS Hyperlink Manager" Codebehind="LinkProperties.aspx.cs" %>
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
        var selectedText;

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
            selectedText = $get('SelectedText');
            
            if (args.Text != null)
            {
                selectedText.value = args.Text;
                $get('textRadio').checked = true;
                textRadio_select();
            }
            else if (args.BoundPropertyName != null)
            {
                selectedProperty.value = args.BoundPropertyName;
                $get('propertyRadio').checked = true;
                propertyRadio_select();
            }
            else
            {
                $get('textRadio').checked = true;
                textRadio_select();
            }
            
            if (args.DisplayMask != null)
            {
                $get('displayMask').value = args.DisplayMask;
            }
        }

        function OkClicked() //fires when the Insert Link button is clicked
        {
            args.BoundPropertyName = null;
            args.Text = null;
        
            if ($get('propertyRadio').checked)
            {
                args.BoundPropertyName = selectedProperty.value;
                args.BoundPropertyCaption = selectedProperty.options[selectedProperty.selectedIndex].text;
            }
            if ($get('textRadio').checked)
                args.Text = selectedText.value;
                
            args.DisplayMask = $get('displayMask').value;

            getRadWindow().close(args);
        }
        
        function propertyRadio_select()
        {
            $get('SelectedProperty').disabled = false;
            $get('SelectedText').disabled = true;
        }
        
        function textRadio_select()
        {
            $get('SelectedText').disabled = false;
            $get('SelectedProperty').disabled = true;
        }
    </script>
</asp:Content>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <telerik:RadTabStrip ID="TabHolder" runat="server" Orientation="HorizontalTop">
        <Tabs>
            <telerik:RadTab PageViewID="iMISLinkView" Selected="true" Text="Link Text" ImageUrl="../../../Images/AtomPainter/iMISLinkTool.gif" />
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="TabContainer" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="iMISLinkView" runat="server">
            <%--TODO: allow specification of NavigationCode for the hyperlink, iUniformKey={0} would need to be appended to url
            <asp:Panel ID="NavigationCodePanel" runat="server"></asp:Panel>--%>
	        <table cellspacing="0" cellpadding="0" border="0">
	            <tr>
	                <td colspan="2"><h2>Specify how the text for the link is determined</h2></td>
	            </tr>
		        <tr>
			        <td class="Label" nowrap>
                        <input type="radio" id="propertyRadio" name="propertyOrText" style="float:left;" onclick="propertyRadio_select()" />
                        <div style="float:left; width: 200px;">
                            <label id="SelectedPropertyLabel" for="propertyRadio" class="Label">Dynamically based on Property</label>
                            <br />
                            <select id="SelectedProperty" disabled="disabled" class="DropDown">
                                <asp:Repeater ID="SelectedPropertyOptionsRepeater" runat="server" OnDataBinding="SelectedPropertyOptionsRepeater_DataBinding">
                                    <HeaderTemplate>
                                        <option></option>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <option value="<%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Name") %>"><%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Caption") %></option>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </select>
                        </div>
			        </td>
		        </tr>
		        <tr>
			        <td class="Label" nowrap>
                        <input type="radio" id="textRadio" name="propertyOrText" style="float:left;" onclick="textRadio_select()" />
                        <div style="float: left; width: 200px;">
                            <label id="SelectedTextLabel" for="textRadio" class="Label">Static text</label>
                            <br />
                            <input type="text" id="SelectedText" disabled="disabled" class="RadETextBox" />
                        </div>
			        </td>
		        </tr>
		        <tr>
		            <td class="Label" nowrap>
		                <hr />
		                <label class="Label" for="displayMask">Display Format</label>
		                <input type="text" id="displayMask" class="RadETextBox" />
		                <div style="margin-top: 10px; margin-left: 10px;">
		                    <a href="msnet-formatting-strings.pdf" target="_blank">View complete list of Date/Time and Number formats</a>
		                </div>
		            </td>
		        </tr>
	        </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
