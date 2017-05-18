<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="AsiCommon_Controls_AtomPainter2_ConditionalDisplayProperties" Title="iMIS Conditional Display Manager" Codebehind="ConditionalDisplayProperties.aspx.cs" %>
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

        var selectedCompareValue1;
        var selectedCompareValue2;
        var selectedDataType;
        var selectedComparisonType;

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
            selectedCompareValue1 = $get('TestCompareValue1');
            selectedCompareValue2 = $get('TestCompareValue2');
            selectedDataType = $get('TestDataType');
            selectedComparisonType = $get('TestCompareType');
        
            var value1Manager = new CompareValueManager(args.TestCompareValue1, 'TestCompareValue1');
            value1Manager.initialize();

            var value2Manager = new CompareValueManager(args.TestCompareValue2, 'TestCompareValue2');
            value2Manager.initialize();

            if (args.TestDataType != null)
                selectedDataType.value = args.TestDataType;
            TestDataType_Change();
            
            if (args.TestCompareType != null)
                selectedComparisonType.value = args.TestCompareType;
            TestCompareType_Change();
        }

        function OkClicked()
        {
            if (selectedCompareValue1.value.length > 0)
                args.TestCompareValue1 = selectedCompareValue1.value;
            if (selectedCompareValue2.value.length > 0)
                args.TestCompareValue2 = selectedCompareValue2.value;
            if (selectedComparisonType.value.length > 0)
                args.TestCompareType = selectedComparisonType.value;
            if (selectedDataType.value.length > 0)
                args.TestDataType = selectedDataType.value;

            getRadWindow().close(args);
        }
    </script>
    <script type="text/javascript"> 
        function TestCompareType_Change()
        {
            var compareTypeControl = $get('TestCompareType');
            var compareType = compareTypeControl.value;
            switch (compareType)
            {
                case 'None':
                case 'Empty':
                case 'IsTrue':
                case 'IsFalse':
                case 'NotEmpty':
                    $get('TestCompareValue2Panel').style.display = 'none';
                    break;
                default:
                    $get('TestCompareValue2Panel').style.display = 'block';
                    break;
            }
        }
        function TestDataType_Change()
        {
            var testDataTypeControl = $get('TestDataType');
            var testCompareType = $get('TestCompareType');
            
            // clear existing options
            for (var i = testCompareType.options.length; i >= 0; i--)
                testCompareType.options.remove(i);
            
            var dataType = (testDataTypeControl.value).split('.')[1];
            var compareTypeSelect = $get('TestCompareType_' + dataType);
            
            for (var i = 0; i < compareTypeSelect.options.length; i++)
            {
                var newOption = document.createElement('option');
                newOption.text = compareTypeSelect.options[i].text;
                newOption.value = compareTypeSelect.options[i].value;
                testCompareType.options.add(newOption);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Orientation="HorizontalTop">
        <Tabs>
            <telerik:RadTab PageViewID="iMISDisplayConditionViewer" Selected="true" Text="Display Condition" ImageUrl="../../../Images/AtomPainter/iMISConditionalDisplayTool.gif" />
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="TabContainer" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="iMISDisplayConditionViewer" runat="server">
            <%--TODO: allow specification of NavigationCode for the hyperlink, iUniformKey={0} would need to be appended to url
            <asp:Panel ID="NavigationCodePanel" runat="server"></asp:Panel>--%>
			<table cellspacing="0" cellpadding="0" border="0">
			    <tr>
			        <td colspan="3"><h2>Specify condition to display selected element(s)</h2></td>
			    </tr>
<%--
				<tr>
				    <td class="Label" colspan="2">Enter some instructional and helpful text here.</td>
				</tr>
--%>					
                <tr>
					<td class="Label" nowrap>
                        <label id="TestDataTypeLabel" for="TestCompareType" class="Label">Data type</label>
		                <select id="TestDataType" onchange="TestDataType_Change()" class="DropDown">
		                    <option value="System.String" selected="selected">String</option>
			                <option value="System.Guid">Guid</option>
			                <option value="System.Int32">Integer</option>
			                <option value="System.DateTime">Date</option>
			                <option value="System.Boolean">Boolean</option>
		                </select>
		                <%--<asp:RequiredFieldValidator ID="DataTypeRequiredFieldValidator" runat="server" Contro--%>
					</td>
				    <td class="Label" colspan="2" nowrap>
                        <label id="TestCompareTypeLabel" for="TestCompareType" class="Label">Comparison type</label>
                        <select id="TestCompareType" onchange="TestCompareType_Change()" class="DropDown"></select>
                        <select id="TestCompareType_String" style="display:none;">
                            <%--<option value="None">None </option>--%>
                            <option value="Equal">Equal</option>
                            <option value="NotEqual">Not Equal</option>
                            <option value="Less">Less </option>
                            <option value="LessEqual">Less or Equal</option>
                            <option value="Greater">Greater</option>
                            <option value="GreaterEqual">Greater or Equal </option>
                            <option value="Contain">Contains</option>
                            <option value="NotContain">Not Contains</option>
                            <option value="StartsWith">Starts With</option>
                            <option value="EndsWith">Ends With</option>
                            <option value="Empty">Is Empty</option>
                            <option value="NotEmpty">Is Not Empty </option>
                            <%--<option value="In">Is In</option>--%>
                            <%--<option value="NotIn">Is Not In</option>--%>
                            <%--<option value="Raw">Raw </option>--%>
                        </select>
                        <select id="TestCompareType_Guid" style="display:none;">
                            <option value="Equal">Equal</option>
                            <option value="NotEqual">Not Equal</option>
                            <option value="Empty">Is Empty</option>
                            <option value="NotEmpty">Is Not Empty </option>
                        </select>
                        <select id="TestCompareType_Int32" style="display:none;">
                            <option value="Equal">Equal</option>
                            <option value="NotEqual">Not Equal</option>
                            <option value="Less">Less </option>
                            <option value="LessEqual">Less or Equal</option>
                            <option value="Greater">Greater</option>
                            <option value="GreaterEqual">Greater or Equal </option>
                            <option value="Empty">Is Empty</option>
                            <option value="NotEmpty">Is Not Empty </option>
                        </select>
                        <select id="TestCompareType_DateTime" style="display:none;">
                            <option value="Equal">Equal</option>
                            <option value="NotEqual">Not Equal</option>
                            <option value="Less">Less </option>
                            <option value="LessEqual">Less or Equal</option>
                            <option value="Greater">Greater</option>
                            <option value="GreaterEqual">Greater or Equal </option>
                            <option value="Empty">Is Empty</option>
                            <option value="NotEmpty">Is Not Empty </option>
                            <option value="WithInDay">Within Number of Days</option>
                            <option value="WithInMonth">Within Number of Months</option>
                            <option value="WithInYear">Within Number of Years</option>
                        </select>
                        <select id="TestCompareType_Boolean" style="display:none;">
                            <option value="Equal">Equal</option>
                            <option value="NotEqual">Not Equal</option>
                            <option value="IsTrue">Is True</option>
                            <option value="IsFalse">Is False</option>
                        </select>
				    </td>
				</tr>
				<tr>
				    <td colspan="2">
				        <hr />
				    </td>
				    <td></td>
				</tr>
				<tr>
					<td class="Label" nowrap>
					    <table border="solid 1px black">
					        <tr>
					            <th colspan="2" style="font-size: larger; font-weight:bolder; vertical-align:top;">First comparison value</th>
					        </tr>
					        <tr>
					            <td><label id="TestCompareValue1SourceLabel" for="TestCompareValue1Source" class="Label">Source</label></td>
					            <td><select id="TestCompareValue1Source" class="DropDown"></select></td>
					        </tr>
					        <tr>
					            <td><label id="TestCompareValue1ValueLabel" for="TestCompareValue1Text" class="Label">Value</label></td>
					            <td>
					                <select id="TestCompareValue1PropertySelect" style="display:none;" class="DropDown">
                                        <asp:Repeater ID="Value1PropertyList" runat="server" OnDataBinding="PropertyList_DataBinding">
                                            <ItemTemplate>
                                                <option value="<%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Name") %>"><%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Caption") %></option>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </select>
                                    <input type="text" id="TestCompareValue1Text" style="display:none;" class="RadETextBox" />
                                    <input type="text" id="TestCompareValue1" style="display:none;" class="RadETextBox" />
                                </td>
					        </tr>
					    </table>
					</td>
					<td class="Label" style="width:175px" nowrap>
					    <table id="TestCompareValue2Panel" border="solid 1px black">
					        <tr>
					            <th colspan="2" style="font-size: larger; font-weight:bolder; vertical-align:top;">Second comparison value</th>
					        </tr>
					        <tr>
					            <td><label id="TestCompareValue2SourceLabel" for="TestCompareValue2Source" class="Label">Source</label></td>
					            <td><select id="TestCompareValue2Source" class="DropDown"></select></td>
					        </tr>
					        <tr>
					            <td><label id="TestCompareValue2ValueLabel" for="TestCompareValue2Text" class="Label">Value</label></td>
					            <td>
                                    <select id="TestCompareValue2PropertySelect" style="display:none;" class="DropDown">
                                        <asp:Repeater ID="Value2PropertyList" runat="server" OnDataBinding="PropertyList_DataBinding">
                                            <ItemTemplate>
                                                <option value="<%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Name") %>"><%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Caption") %></option>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </select>
                                    <input type="text" id="TestCompareValue2Text" style="display:none;" class="RadETextBox" />
                                    <input type="text" id="TestCompareValue2" style="display:none;" class="RadETextBox" />
                                </td>
					        </tr>
					    </table>
				    </td>
				</tr>
			</table>
		</telerik:RadPageView>
	</telerik:RadMultiPage>
</asp:Content>
