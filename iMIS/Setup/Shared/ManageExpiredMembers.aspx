<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" CodeBehind="ManageExpiredMembers.aspx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Shared.ManageExpiredMembers" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TemplateUserMessages" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" runat="server">

    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" Style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" />
    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="True">
        <asiweb:PanelTemplateControl2 runat="server" TemplateTitle="Manage expired members" Collapsible="False">
	        <telerik:RadTabStrip ID="ManageExpiredMembersRadTabStrip" runat="server" MultiPageID="ManageExpiredMembersPages" SelectedIndex="0" Visible="true" AutoPostBack="False" Translate="yes" ClickSelectedTab="True"
                OnTabClick="ManageExpiredMembersRadTabStrip_OnTabClick" >
		        <Tabs>
			        <telerik:RadTab Text="Update status or type" Value="manageExpiredMembers" />
			        <telerik:RadTab Text="Logs" Value="logs" Enabled="true" PostBack="True"/>
		        </Tabs>
	        </telerik:RadTabStrip>
	        <telerik:RadMultiPage ID="ManageExpiredMembersPages" runat="server" SelectedIndex="0" RenderSelectedPageOnly="True" >
		        <telerik:RadPageView ID="UpdateStatusOrTypePage" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
		            <div class="panel-body">
		                <asp:ValidationSummary runat="server" ID="FindValidationSummary" CssClass="Important" DisplayMode="List" Visible="True" ValidationGroup="CurrentValues" EnableClientScript="False"/>
		                <asp:ValidationSummary runat="server" ID="SubmitValidationSummary" CssClass="Important" DisplayMode="List" Visible="True" ValidationGroup="NewValues" EnableClientScript="False"
			                EnableViewState="True" Enabled="True" ShowSummary="True"/>
                        <div runat="server" id="OptionsPanel" class="panel-body">
                            <asp:CustomValidator runat="server" ID="FindFilterControlsValidator" ValidationGroup="CurrentValues"
						                    OnServerValidate="FindFilterControlsValidator_OnServerValidate" Display="None"
						                    ErrorMessage="Current member type and Expires on or before date are required."></asp:CustomValidator>
                            <div class="PanelField">
				                <div class="PanelFieldLabel">
					                <asiweb:StyledLabel runat="server" ID="CurrentMemberTypesSelectorLabel" AssociatedControlID="CurrentMemberTypesSelector" CssClass="Required"/>
				                </div>
				                <div class="PanelFieldValue">
					                <asiweb:BusinessDropDownList runat="server" ID="CurrentMemberTypesSelector" RenderPanelField="false" AutoPostBack="False" Required="True" CausesValidation="False" ValidationGroup="CurrentValues" />
				                </div>
			                </div>
                            <div class="PanelField">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="PaidThroughDateLabel" AssociatedControlID="PaidThroughDate" CssClass="Required"></asiweb:StyledLabel>
                                </div>
				                <div class="PanelFieldValue">
					                <asiweb:BusinessCalendar2 runat="server" ID="PaidThroughDate" RenderPanelField="false" AutoPostBack="False" Required="True" data-CausesValidation="False" data-ValidationGroup="CurrentValues" ControlType="DatePicker"/>

				                </div>
                            </div>
                            <div class="PanelField">
                                <asiweb:BusinessCheckBox runat="server" ID="IncludeMembersWithoutPaidThroughDate" Caption="Include members with a blank paid-through date" PositionCaption="Right" DisplayCaption="True" RenderPanelField="True"/>
                            </div>
                            <div class="PanelField">
                                <asiweb:StyledButton ID="FindButton" runat="server" Text="Find" OnClick="FindButton_OnClick" CausesValidation="True" ValidationGroup="CurrentValues" /> 
                            </div>
                        </div>
                        <div runat="server" ID="altResultsContainer" Visible="False">
                            <asp:Literal runat="server" Text="No matching members found"></asp:Literal>
                        </div>
                        <div runat="server" ID="resultsContainer" Visible="False">
                            <asiweb:Lister2 id="lstManageExpiredMembersGrid"
                                translate="yes"
                                runat="server"
                                AjaxEnabled="true"
                                Width="100%"
                                SortingEnabled="true"
                                PagingEnabled="true"
                                PagerMode="NextPrevAndNumeric"
                                PageSize="10"
                                ColumnReorderingEnabled="false"
                                DeleteColumnLocation="None"
                                AddButtonLocation="None"
                                SelectColumnLocation="None"
                                EditColumnLocation="None"
                                EnableClientSideDelete="false"
                                AllowNaturalSort="false"
                                HideResultsOnInitialLoad="Hidden"
                                OnPreEvaluateQuery="lstManageExpiredMembersGrid_PreEvaluateQuery"
                                OnItemDataBound="lstManageExpiredMembersGrid_OnItemDataBound"
                                OnDataAvailable="lstManageExpiredMembersGrid_OnDataAvailable"
                
                                CurrentQueryHasFilter="False"
                                DataSourceDocumentPath="$/Membership/DefaultSystem/Queries/ManageExpiredMembers"

                                CollapsiblePanelTemplate="false"
                                DisableQueryEdit="true"
                                ExportButtonLocation="TopRight" 

                                AllowRowSelecting="False"
                                SelectMode="False"
                                SelectMultipleEnabled="False"
                                AllowGridRowSelectStyle="False"/>
                            <div runat="server" id="SaveOptionsPanel" class="FloatRight">
			                    <div class="PanelField">
				                    <div class="PanelFieldLabel">
					                    <asp:CustomValidator runat="server" ID="NewValuesRequiredValidator" ValidationGroup="NewValues"
						                    OnServerValidate="NewMemberTypeOrStatusRequiredValidator_OnServerValidate" 
						                    ErrorMessage="New member type and/or new status required." Display="None"></asp:CustomValidator>
				                    </div>
				                    <div style="display: inline;">
					                    <asiweb:StyledLabel ID="NewMemberTypeLabel" runat="server" AssociatedControlID="NewMemberTypesSelector"  />
				                    </div>
				                    <div class="PanelFieldValue">
					                    <asiweb:BusinessDropDownList runat="server" ID="NewMemberTypesSelector" RenderPanelField="false" AutoPostBack="False" Required="False" CausesValidation="False" ValidationGroup="NewValues"/>
				                    </div>
			                    </div>
			                    <div class="PanelField">
				                    <div class="PanelFieldLabel">
				                    </div>
				                    <div style="display: inline;">
					                    <asiweb:StyledLabel ID="NewStatusLabel" runat="server" AssociatedControlID="NewMemberStatusSelector" CssClass="Label" />
				                    </div>
				                    <div class="PanelFieldValue">
					                    <asiweb:BusinessDropDownList runat="server" ID="NewMemberStatusSelector" AutoPostBack="False" CausesValidation="False" ValidationGroup="NewValues"/>
				                    </div>
			                    </div>
			                    <br/>
			                    <div class="FloatRight" style="padding-top: 10px;"> 
				                    <asiweb:StyledButton runat="server" ID="SubmitButton" Text="Submit" CssClass="PrimaryButton TextButton" OnClick="SubmitButton_OnClick" CausesValidation="True" ValidationGroup="NewValues"/>
				                    <asiweb:StyledButton runat="server" ID="CancelButton" Text="Cancel" CssClass="TextButton" OnClick="CancelButton_OnClick" CausesValidation="False"/>
			                    </div>
		                    </div>
                        </div>
                    </div>
		        </telerik:RadPageView>
		        <telerik:RadPageView ID="LogsPage" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay" >
			        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl" runat="server" Collapsible="false" >
				        <asiweb:Lister2 
					        runat="server" 
					        ID="LogsLister" 
					        Title="" 
					        ExportButtonLocation="None" 
					        EditColumnLocation="None"
					        DeleteColumnLocation="None" 
					        EnableClientSideDelete="false"
					        OnNeedDataSource="LogsLister_OnNeedDataSource"
					        OnItemDataBound="LogsLister_OnItemDataBound"
					        DataKeyNames="RunNumber"  
					        DisplayPropertiesList="UserId,Status,Start,End,MembersUpdated,Errors,Details" 
					        DisplayPropertiesTitleOverride="User,Status,Start,End,Members Updated,Errors,Details"

					        RefreshButtonText="Refresh"
					        RefreshButtonLocation="TopRight"
					        RefreshButtonType="Link"
					        ReloadOnRefresh="True"
					
		                    AllowRowSelecting="False"
		                    SelectMode="False"
		                    SelectMultipleEnabled="False"
		                    AllowGridRowSelectStyle="False"

					        PageSize="20"
					        PagingEnabled="True"
					        /> 
			        </asiweb:PanelTemplateControl2>
		        </telerik:RadPageView>
	        </telerik:RadMultiPage>
        </asiweb:PanelTemplateControl2>
    </telerik:RadAjaxPanel>
</asp:Content>
