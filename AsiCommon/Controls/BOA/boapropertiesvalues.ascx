<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BOA.BOAPropertiesValues" Codebehind="BOAPropertiesValues.ascx.cs" %>
<script type="text/javascript"><!--
	var queryContainer = null;
	function QueryBrowseClick(object)
	{
		// get the div that holds all of the query fields we need to set when we come back
		queryContainer = findAncestor(object, "DIV");
		if (queryContainer != null)
			OpenObjectBrowser('iTypeFilter=IQD,FOL', SetQueryObject);
	}
	function SetQueryObject(dialogWindow) 
	{
	    if (!dialogWindow.result)
	        return;
	    var result = dialogWindow.result;
	    var queryDocumentKey = document.getElementById('<%= QueryDocumentKey.ClientID %>');
	    queryDocumentKey.value = result;

	    var queryObjectSourceLabel = document.getElementById('<%= QueryObjectSourceLabel.ClientID %>');
	    if (dialogWindow.SelectedDocumentName != null && dialogWindow.SelectedDocumentName.length > 0)
	        queryObjectSourceLabel.innerText = dialogWindow.SelectedDocumentName;
	    else
	        queryObjectSourceLabel.innerText = "Name not specified";
	        
	    document.getElementById('<%= QuerySelectedButton.ClientID %>').click();
	}
	function QueryRemoveClick()
	{
	    var queryDocumentKey = $('<%= QueryDocumentKey.ClientID %>');
	    queryDocumentKey.value = '';
	    var queryObjectSourceLabel = $('<%= QueryObjectSourceLabel.ClientID %>');
        queryObjectSourceLabel.innerText = '';
	    $('<%= QuerySelectedButton.ClientID %>').click();
	}
	// clears a row in the value list when the delete button is pressed
	function DeleteValueRow(object) {
	    var valueContainer = findAncestor(object, "TR");
		if (valueContainer != null)
		{
			// find the DisplayValue and ListValue text boxes and clear them
			var children = valueContainer.getElementsByTagName("INPUT");
			for (i=0;i<children.length;i++)
			{
				childID = children[i].id;
				if ((childID.substring(childID.length - 13) == "ListDataValue") || (childID.substring(childID.length - 16) == "ListDisplayValue"))
					children[i].value = "";
			}
			valueContainer.style.display = 'none';
		}
	}
	
	function ComeFromChanged(object, which)
	{
	    var queryContainer = document.getElementById("<%= QueryContainer.ClientID %>");
	    var valueContainer = document.getElementById("<%= ValueListContainer.ClientID %>");
	    
	    queryContainer.style.display = "none";
	    valueContainer.style.display = "none";
	    
	    switch (which)
	    {
	        case 1: //"Finder":
	        case 2: //"Query":
	            queryContainer.style.display = "block";
	            break;
	        case 3: //"ValueList":
	            valueContainer.style.display = "block";
	            break;
	        case 0: //"FreeForm":
	        default:
	            break;
	    }
	}
	
	//-->
</script>

<asiweb:PanelTemplateControl2 runat="server" FieldSet="true" ShowHeader="false" Collapsible="false" Height="100%">
    <div class="PanelField AutoWidth">
        <asp:label id="DefaultValueLabel" runat="server" Text="Default Value" AssociatedControlID="DefaultValue" />
        <asp:textbox id="DefaultValue" runat="server" Width="288px" Text="<%# Property.Property.DefaultValue %>" />
    </div>
    <div class="PanelField">       
        <asp:label id="ValuesComeFromLabel" runat="server" Text="Values come from" AssociatedControlID="ValuesComeFrom" ></asp:label>       
        <div class="PanelFieldValue">
            <asp:RadioButtonList CssClass="AutoWidth" ID="ValuesComeFrom" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem Text="Freeform data entry" Value="FreeForm" onclick="ComeFromChanged(this, 0)" />
                <asp:ListItem Text="Finder" Value="Finder" onclick="ComeFromChanged(this, 1)" Enabled="false" />
                <asp:ListItem Text="Query object" Value="Query" onclick="ComeFromChanged(this, 2)" />
                <asp:ListItem Text="Value list" Value="ValueList" onclick="ComeFromChanged(this, 3)" />
            </asp:RadioButtonList>
            <div id="QueryContainer" runat="server" style="clear: both;">
                <asp:UpdatePanel ID="QueryUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="PanelField">
                            <label id="QueryContainerLabel" for="QueryContainer">Query</label>
                            <div class="PanelFieldValue AutoWidth">
                                <input id="QueryDocumentKey" onserverchange="Reload" type="hidden" runat="server" value="<%# Property.Property.ValueListQuery %>" />
                                <asp:label id="QueryObjectLabel" runat="server" Text="Query Object" Width="12em" AssociatedControlID="QueryObjectSourceLabel" Visible="false" />
                                <asp:label id="QueryObjectSourceLabel" style="white-space:nowrap; font-style:italic; float:left;" runat="server" />
                                <asp:label id="QueryPathErrorLabel" CssClass="Error" Visible="false" runat="server"></asp:label>
                                <asiweb:StyledButton Text="Browse" id="QueryBrowseButton" AutoPostBack="false" onclientclick="QueryBrowseClick(this);" runat="server" />
                                <asiweb:StyledButton Text="Remove" ID="QueryRemoveButton" OnClientClick="QueryRemoveClick(this);" runat="server" />
                                <asp:Button ID="QuerySelectedButton" runat="server" style="display:none;" OnClick="Reload" />
                            </div>
                        </div>
                        <div class="PanelField">
                            <asp:label id="DataValueLabel" runat="server" Text="Data Value" AssociatedControlID="DataValue" />
                            <div class="PanelFieldValue">
                                <asp:DropDownList id="DataValue" runat="server"></asp:DropDownList>
                                <asiweb:InfoControl ID="DataValueFolderInfo" runat="server" Visible="false" Text="This list of columns comes from the default Query in the Folder you have selected.  You must ensure that all other Queries in the folder contain this column as well." />
                                <asp:label id="DataValueErrorLabel" CssClass="Error" Visible="false" runat="server"></asp:label>
                            </div>
                        </div>
                        <div class="PanelField">
                            <asp:label id="DisplayValueLabel" runat="server" Text="Display Value" AssociatedControlID="DisplayValue" />
                            <div class="PanelFieldValue">
                                <asp:DropDownList id="DisplayValue" runat="server"></asp:DropDownList>
                                <asiweb:InfoControl ID="DisplayValueFolderInfo" runat="server" Visible="false" Text="This list of columns comes from the default Query in the Folder you have selected.  You must ensure that all other Queries in the folder contain this column as well." />
                                <asp:label id="DisplayValueErrorLabel" CssClass="Error" Visible="false" runat="server"></asp:label>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="ValueListContainer" runat="server" style="clear: both;">
                <div class="PanelField AutoWidth">
                    <label id="ValueListContainerLabel" for="ValueListTable">Values</label>
                    <div class="PanelFieldValue">
                        <div id="ValueListTableContainer" runat="server" style="width:600px; height:150px; overflow:auto; border: solid 1px #CFCFCF; clear: both;">
                            <asp:UpdatePanel ID="ValueListUpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Repeater id="ValueList" runat="server" OnItemDataBound="ValueList_ItemDataBound">
                                        <HeaderTemplate>
                                            <table class="Grid" id="ValueListTable" style="width:99%">
                                                <tr class="GridHeader">
                                                    <th style="width:100px"><asp:label id="ListDataValueLabel" runat="server" Width="100px" Text="Data Value" /></th>
                                                    <th style="width:300px"><asp:label id="ListDisplayValueLabel" runat="server" Width="300px" Text="Display Value" /></th>
                                                    <th></th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="GridRow">
                                                <td><asp:textbox id="ListDataValue" runat="server" Width="100px" OnTextChanged="ValueList_Changed" /></td>
                                                <td><asp:textbox id="ListDisplayValue" runat="server" Width="300px" OnTextChanged="ValueList_Changed" /></td>
                                                <td><asp:Image id="DeleteValue" SkinID="DeleteImage" onclick="DeleteValueRow(this);" runat="server"></asp:Image></td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>				                                    
                                    </asp:Repeater>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="MoreButton" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div style="text-align:right; width:600px;">
                            <asiweb:StyledButton ID="MoreButton" OnClick="Reload" Runat="server" Text="More" data-ajaxUpdatedControlID="ValueListTable" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asiweb:PanelTemplateControl2>

<script type="text/javascript">
	<asp:Literal id="InitValueTypeScript" runat="server" />
</script>