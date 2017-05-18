<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.PackageManagement.SupplementDefinition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="SupplementDefinition.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<div runat="server" translate="no">
    <script language="javascript"><!--
	    <asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
        function BSABrowserCallback(window)
        {
            if (!window.result)
                return;
		    document.getElementById(SelectedKeyID).value = window.result;
		    submitForm(document.getElementById(SelectedKeyID));
        }  
	    //-->
    </script>
</div>

<input type="hidden" id="SelectedKey" runat="server" onserverchange="SelectedKeyChanged" name="SelectedKey" />
<input type="hidden" id="SelectedType" runat="server" name="SelectedType" />

<asp:placeholder id="Placeholder1" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl2 ID="SupplementDefinitionPanel" runat="server" BorderStyle="None" ShowHeader="false">
    <div class="PanelField">
        <asp:label id="lblName" runat="server" AssociatedControlID="txtName" CssClass="Required"></asp:label>
        <div class="PanelFieldValue">
            <asp:textbox id="txtName" runat="server" ></asp:textbox>
            <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="txtName" CssClass="Important" Display="Dynamic" ErrorMessage="required" />
        </div>
    </div>
    <div class="PanelField">
        <asp:label id="lblDescription" runat="server" AssociatedControlID="txtDescription"></asp:label>
        <div class="PanelFieldValue">
            <asp:textbox id="txtDescription" runat="server" TextMode="MultiLine"></asp:textbox>
        </div>
    </div>
    <div class="PanelField">
        <asp:label id="lblCostsPrompt" runat="server" AssociatedControlID="lblCostsValue"></asp:label>
	    <div class="PanelFieldValue FloatNone">
	        <asp:label id="lblCostsValue" runat="server"></asp:label>&nbsp	        
	        <asiweb:StyledButton id="btnCost" runat="server" Text="..." ToolTip="Edit Cost" />        
	    </div>
    </div>
    <div class="PanelField">
	    <asp:label id="lblStatus" runat="server" AssociatedControlID="cboStatus"></asp:label>
	    <div class="PanelFieldValue">
	        <asp:dropdownlist id="cboStatus" runat="server"></asp:dropdownlist>
	    </div>
    </div>
    <div class="PanelField">
	    <asp:label id="lblSupplementType" runat="server" AssociatedControlID="cboSupplementType"></asp:label>
	    <div class="PanelFieldValue">
	        <asp:dropdownlist id="cboSupplementType" runat="server"></asp:dropdownlist>
	    </div>
    </div>
    <div class="PanelField">
	    <asp:label id="lblProcessEngine" runat="server" AssociatedControlID="txtProcessEngine"></asp:label>
	    <div class="PanelFieldValue FloatNone">
	        <asp:textbox id="txtProcessEngine" runat="server" ReadOnly="True"></asp:textbox>&nbsp;
	        <asiweb:StyledButton ID="btnPEBrowse" Text="..." ToolTip="Browse for Process Engine" runat="server" AutoPostBack="False" OnClientClick="OpenObjectBrowser('DocumentPath=$/Common/Shared Documents/Processes&ShowHierarchyTree=false&ShowContainers=true&ShowSummary=false&AllowMultiSelect=false&iTypeFilter=CRA,WMM,FOL,MPE,OPP,MEP',BSABrowserCallback);" />
	        <asiweb:StyledButton ID="btnClearPE" runat="server" Text="X" ToolTip="Clear Process Engine" />
        </div>
    </div>
</asiweb:PanelTemplateControl2>
