<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BOA.BOAPropertiesDefinition"  AutoEventWireup="true" Codebehind="BOAPropertiesDefinition.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" Collapsible="false" style="clear:both;">
    <asp:UpdatePanel ID="DefinitionUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <ContentTemplate>
            <div class="PanelField">
                <asp:label id="StoreInDatabaseLabel" Enabled="False" runat="server" AssociatedControlID="StoredInDatabase">Stored in database?</asp:label>
                <asp:RadioButtonList ID="StoredInDatabase" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="PanelFieldValue AutoWidth" Enabled="False">
                    <asp:ListItem Text="Yes" Enabled="false" />
                    <asp:ListItem Text="No" Enabled="false" />
                </asp:RadioButtonList>
            </div>
            <div class="PanelField">
                <asp:label id="SourceTableLabel" runat="server" AssociatedControlID="SourceTable" Text="Database table" />
                <asp:textbox id="SourceTable" CssClass="InputLarge" runat="server" Text="<%# Property.DBTableName %>" /> 
            </div>
            <div class="PanelField">
                <asp:label id="SourceColumnLabel" runat="server" AssociatedControlID="SourceColumn" Text="Database column" />
                <asp:textbox id="SourceColumn" runat="server" CssClass="InputLarge" Text="<%#Property.DBColumnName %>" />
            </div>
            <div class="PanelFieldValue AutoWidth FloatNone">
                <asp:CheckBox id="AllowDBNull" runat="server" Checked="<%# Property.Property.AllowDBNull %>" Text="Allows NULL?" TextAlign="Right" CssClass="PanelFieldValue" />            
            </div>
            <div class="PanelField">
                <asp:label id="ForeignObjectLabel" runat="server" AssociatedControlID="ForeignObject" Text="References object" />
                <asp:TextBox ID="ForeignObject" runat="server" CssClass="InputLarge" />
                
                <%--DataSourceDocumentKey="53A7F00D-12A4-44EB-A025-017616A22820"
                    DocumentTypesAllowed="BOD"--%>
                    
                <%--<asiweb:BusinessFinderControl ID="ForeignObject" runat="server"
                    DataSourceComponentName="Document"
                    DataSourceDocumentKey="53A7F00D-12A4-44EB-A025-017616A22820" />--%>
                    
                <%--<asiweb:BusinessDocumentBrowserControl ID="ForeignObject" runat="server"
                    DocumentHierarchyPath="$/Design Business Object Definition" />--%>
                    
                <%--<asp:image id="DeleteReferenceButton" runat="server" SkinID="DeleteImage" />--%>
                
                <%--<asiweb:BusinessDropDownList ID="ForeignObject" runat="server" DataSourceDocumentKey="53A7F00D-12A4-44EB-A025-017616A22820" DataSourceDocumentPath="$/Design Business Object Definition" />--%>
            </div>
            <div class="PanelField">
                <asp:label id="IsIdentityLabel" runat="server" AssociatedControlID="IsIdentity" Text="Identity column?" />
                <div class="PanelFieldValue AutoWidth FloatNone" >
                    <asp:CheckBox id="IsIdentity" runat="server" Checked="<%# Property.Property.IsIdentity %>" onclick="IsIdentityClick();" />
                    <span id="IdentityOptions">
                        <asp:label id="IdentitySeedLabel" runat="server" AssociatedControlID="IdentitySeed" Text="Start Value" style="margin-left:10px;" />
                        <asp:textbox id="IdentitySeed" runat="server" Width="20px" Text="<%# Property.Property.IdentitySeed %>" />
                        <%--<ajaxToolkit:NumericUpDownExtender runat="server" TargetControlID="IdentitySeed" Width="175" />--%>
                        <asp:label id="IdentityIncrementLabel" runat="server" AssociatedControlID="IdentityIncrement" Text="Increment" />
                        <asp:textbox id="IdentityIncrement" runat="server" Width="20px" Text="<%# Property.Property.IdentityIncrement %>" />
                        <%--<ajaxToolkit:NumericUpDownExtender runat="server" TargetControlID="IdentityIncrement" Width="175" />--%>
                    </span>
                </div>
            </div>
            <div class="PanelField">
                <asp:label id="CalculatedValueLabel" Enabled="false" runat="server" AssociatedControlID="ExpressionLabel" Text="Calculated value" />
                <div class="PanelFieldValue">
                    <asp:Label ID="ExpressionNo" runat="server" Text="No" Enabled="false" Visible="<%# string.IsNullOrEmpty(Property.Expression) %>" style="float:left;" />
                    <asp:Label id="ExpressionLabel" Enabled="false" runat="server" Text="<%# Property.Expression %>" Visible="<%# !string.IsNullOrEmpty(Property.Expression) %>" style="float:left;" />
		            <asiweb:StyledButton id="ExpressionEditButton" Enabled="false" runat="server" Text="Edit" Visible="<%# !string.IsNullOrEmpty(Property.Expression) %>" />
                </div>
            </div>
            <div style="clear:both;" class="PanelFieldValue"> 
                <asp:CheckBox id="IsReadOnly" runat="server" Checked="<%# Property.IsReadOnly %>" Text="Read only?" TextAlign="Right" />
            </div>       
            <div style="clear:both;" class="PanelFieldValue">
                <asp:CheckBox id="IsSystem" runat="server" Checked="<%# Property.Property.IsSystem %>" Text="System property? (Internal Use Only)" TextAlign="Right" />
            </div>     
            <div style="clear:both;" class="PanelFieldValue">
                <asp:CheckBox id="IsLogged" runat="server" Checked="<%# Property.IsLogged %>" Text="Log all changes?" TextAlign="Right" />                              
            </div>
            <div class="PanelField Left">
                <div style="display:inline;">
                    <label for="QueryBuilderSpan">Query builder</label>
                </div>
                <div id="QueryBuilderSpan" class="PanelFieldValue AutoWidth FloatNone">
                    <div style="clear:both;">
                        <asp:CheckBox id="AvailableToQueryBuilder" runat="server" Text="Available to query builder?" Checked="<%# !Property.Property.Hidden %>" TextAlign="Right" />
                    </div>
                    <div style="clear:both;">
                        <asp:CheckBox id="DisplaySet" runat="server" Text="Automatically include in queries?" Checked="<%# Property.Property.DisplaySet %>" TextAlign="Right" />
                    </div>
                </div>
            </div>
            <div class="PanelField" id="SecurityPanel" runat="server" Visible="False"> <% //Hidden until security is implemented %>
                <asp:label id="SecurityLabel" Enabled="false" runat="server" AssociatedControlID="Security" Text="Security" />
                <div class="PanelFieldValue">
                    <asp:RadioButtonList ID="Security" runat="server" Enabled="false" RepeatDirection="Vertical" RepeatLayout="Table" CssClass="PanelFieldValue AutoWidth" style="clear:both;">
                        <asp:ListItem Text="Same as object level" Enabled="false" />
                        <asp:ListItem Text="Read only for other than owner" Enabled="false" />
                        <asp:ListItem Text="Not visible except to owner" Enabled="false" />
                        <asp:ListItem Text="Custom" Enabled="false" />
                    </asp:RadioButtonList>
                    <asiweb:StyledButton ID="SecurityEditButton" Enabled="false" runat="server" Text="Edit" style="clear:both; margin-left:20px;"/>
                </div>
            </div>
            <div class="PanelField">
                <asp:label id="DescriptionLabel" runat="server" AssociatedControlID="Description" Text="Description" />
                <asp:TextBox id="Description" runat="server" TextMode="MultiLine" Rows="4" Columns="45" CssClass="InputXLarge" Text="<%# Property.Property.Description %>" /><%--style="position: relative; top: 6;" --%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asiweb:PanelTemplateControl2>


<script id="IsIdentityClick" type="text/javascript">
    IsIdentityClick();
    function IsIdentityClick()
    {
        var isIdentityCheckBox = document.getElementById("<%= IsIdentity.ClientID %>");
        var identityOptions = document.getElementById("IdentityOptions");
        var identitySeed = document.getElementById("<%= IdentitySeed.ClientID %>");
        var identityIncrement = document.getElementById("<%= IdentityIncrement.ClientID %>");
        identityOptions.disabled =
            identitySeed.disabled = 
            identityIncrement.disabled = !isIdentityCheckBox.checked;
    }
</script>