<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationCreatorAdditionalDataSources.ascx.cs" Inherits="Asi.Web.iParts.Communications.CommunicationCreator.CommunicationCreatorAdditionalDataSources" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<h2><%=PageTitle%></h2>
<div runat="server" id="MainContentWrapper" translate="yes">
    <div class="PanelField Left">
        <telerik:RadAjaxLoadingPanel ID="AdditionalDataSourcesLoadingPanel" runat="server" ValidateRequestMode="Disabled" SkinID="AjaxLoadingPanel" />
        <telerik:RadAjaxPanel ID="AdditionalDataSourcesContentPanel" runat="server" ValidateRequestMode="Disabled" Visible="True" EnableAJAX="True" EnableViewState="True" LoadingPanelID="AdditionalDataSourcesRadAjaxLoadingPanel">
            <telerik:RadInputManager ID="AdditionalDataSourcesRadInputManager" runat="server">
            </telerik:RadInputManager>
            <telerik:RadGrid ID="AdditionalDataSourcesRadGrid" runat="server" ValidateRequestMode="Disabled" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" ShowStatusBar="True"
                AllowMultiRowSelection="False" PageSize="10" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"
                AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter">
                <pagerstyle mode="NextPrevNumericAndAdvanced" />
                <mastertableview allowmulticolumnsorting="True" commanditemdisplay="Top" datakeynames="Alias" clientdatakeynames="Alias" editmode="EditForms" insertitempageindexaction="ShowItemOnCurrentPage">
                        <SortExpressions>
                            <telerik:GridSortExpression FieldName="Alias" SortOrder="Ascending" />
                        </SortExpressions>
                        <CommandItemTemplate>
                            <div class="FloatRight">
                                <asp:LinkButton ID="AddButton" runat="server" CommandName="InitInsert" CausesValidation="False" Visible='<%# !AdditionalDataSourcesRadGrid.MasterTableView.IsItemInserted %>'>
                                    <asp:Image ID="Image5" runat="server" AlternateText="Add" SkinID="PanelCommandButtonAdd" />
                                    <span class="RadGridCommandText"><%# AddDataSourceText %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                            </div>                        
                        </CommandItemTemplate>
                        <Columns>
                             <telerik:GridTemplateColumn UniqueName="Query" HeaderText="Query" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="Query" SortExpression="Query" EditFormHeaderTextFormat="Query" AllowFiltering="True">
                                <ItemTemplate>
                                    <div style="min-width:150px;">
                                        <asiweb:StyledHyperlink runat="server" ID="QueryColumnLink"></asiweb:StyledHyperlink>       
                                    </div>                                
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Alias" HeaderText="Alias" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="Alias" SortExpression="Alias" EditFormHeaderTextFormat="Alias">
                                <ItemTemplate>
                                    <div style="min-width:150px;">
                                        <asiweb:BusinessLabel ID="AliasColumn" runat="server" />  
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>    

                            <telerik:GridEditCommandColumn ButtonType="ImageButton" 
                                EditImageUrl="~/AsiCommon/Images/icon_edit.png" UniqueName="EditColumn" >
                                <ItemStyle Width="25px" CssClass="MiddleCenter" />    
                            </telerik:GridEditCommandColumn>
                            <telerik:GridButtonColumn ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_delete.png" CommandName="Delete" 
                                UniqueName="DeleteColumn" ConfirmTitle="Delete" 
                                ConfirmText="Are you sure you want to delete this row or record?">
                                <ItemStyle Width="25px" CssClass="MiddleCenter" />    
                            </telerik:GridButtonColumn>
                                </Columns>
                            <NoRecordsTemplate>
                                <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" Text="None" ></asiweb:BusinessLabel>
                            </NoRecordsTemplate>
                            <EditFormSettings EditFormType="Template">
                                <FormTemplate>
                                    <table class="Form">
                                        <tr class="PanelField Left">
                                            <td>
                                                    <asiweb:BusinessLabel ID="QueryLabel" runat="server" Text=<%# ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.Query", "Query") %> AssociatedControlID="QueryTextBox" CssClass="Required" />
                                            </td>
                                            <td>
                                                <asiweb:BusinessDocumentBrowserControl runat="server" DisplayCaption="False"  TextBoxWidth="350px" 
                                                        ID="QueryTextBox" DocumentTypesAllowed="IQD" AutoPostBack="True" RenderPanelField="False" ValidateRequestMode="Enabled" 
                                                        OnDataChanged="Browser_DataChanged"></asiweb:BusinessDocumentBrowserControl>    
                                                <asiweb:StyledLabel ID="QueryValidationMessage" runat="server" CssClass="Error"/>  
                                            </td>
                                        </tr>
                                            <tr class="PanelField Left">
                                            <td>
                                                <asiweb:BusinessLabel ID="AliasLabel" runat="server" Text=<%# ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.Alias", "Alias") %> AssociatedControlID="AliasTextBox" CssClass="Required"  />         
                                            </td>
                                            <td>
                                                <asiweb:BusinessTextBox ID="AliasTextBox" runat="server" ValidateRequestMode="Enabled"/>
                                                <asiweb:AsiRequiredFieldValidator runat="server" ID="AliasRequiredValidator" ControlToValidate="AliasTextBox" ErrorMessage=<%# ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.AliasIsRequired", "Alias is required.") %>/>
                                                    <asp:CustomValidator ID="AliasNoSpaceValidator" runat="server" ControlToValidate="AliasTextBox" OnServerValidate="AliasNoSpaceServerValidation" ErrorMessage=<%# NoSpaceInAliasText %> Display="Dynamic" />
                                                    <asp:CustomValidator ID="AliasUniqueValidator" runat="server" ControlToValidate="AliasTextBox" OnServerValidate="AliasUniqueServerValidation" ErrorMessage=<%# DuplicateAliasText %> Display="Dynamic" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asiweb:StyledLabel ID="LinkLabel" runat="server" />  
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnUpdate" Text=<%# ResourceManager.GetWord("OK") %> CssClass="TextButton PrimaryButton" runat="server"  CausesValidation="False" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
                                                </asp:Button>&nbsp;
                                                <asp:Button ID="btnCancel" Text=<%# ResourceManager.GetWord("Cancel") %> CssClass="TextButton" runat="server" CausesValidation="False" CommandName="Cancel"></asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </FormTemplate>
                            </EditFormSettings>
                        </mastertableview>
                <validationsettings enablevalidation="False"></validationsettings>
                <clientsettings>
                    <Selecting AllowRowSelect="False" /> 
                </clientsettings>
            </telerik:RadGrid>
        </telerik:RadAjaxPanel>
    </div>
</div>
<div style="float: right;">
    <asp:LinkButton runat="server" ID="ButtonModeSwitchLink" OnClick="ButtonModeSwitchOnClick" Text="" CausesValidation="False" />
</div>
