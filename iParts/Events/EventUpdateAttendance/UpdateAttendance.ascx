<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateAttendance.ascx.cs" Inherits="Asi.Web.iParts.Events.EventUpdateAttendance.UpdateAttendance" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Import Namespace="Asi" %>
<asiweb:PanelTemplateControl2 ID="UpdateAttendancePanel" runat="server" ShowHeader="True" Collapsible="False" FieldSet="true" ShowBorder="False">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="AddPaddingVertical">
                <div>
                    <asiweb:StyledLabel runat="server" ID="SubtitleLineLabel1" />
                </div>
                <div>
                    <asiweb:StyledLabel runat="server" ID="SubtitleLineLabel2" Visible="False" />
                </div>
            </div>
            <asp:Panel runat="server" ID="FindPanel" CssClass="Panel" DefaultButton="FindButton">
                <div class="PanelField">
                    <div class="PanelFieldLabel">
                        <asiweb:StyledLabel runat="server" ID="FunctionLabel" AssociatedControlID="FunctionDropDownList"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList runat="server" ID="FunctionDropDownList" />
                    </div>
                </div>
                <div class="PanelField">
                    <div class="PanelFieldLabel">
                        <asiweb:StyledLabel runat="server" ID="LabelLastName" AssociatedControlID="LastNameTextBox" />
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox MaxLength="50" runat="server" ID="LastNameTextBox" />
                    </div>
                </div>
                <div class="PanelField">
                    <div class="PanelFieldLabel">
                        <asiweb:StyledLabel runat="server" ID="FirstNameLabel" AssociatedControlID="FirstNameTextBox" />
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox MaxLength="50" runat="server" ID="FirstNameTextBox" />
                    </div>
                </div>
                <div class="PanelField">
                    <asiweb:StyledButton runat="server" ID="FindButton" Text="Find" OnClick="FindButtonOnClick" CssClass="TextButton" />
                </div>
            </asp:Panel>
            <div class="CommandButtonBar AddPaddingVertical">
                <asiweb:StyledButton runat="server" ID="MarkAllAttendedButton" Text="Mark All Attended" OnClick="MarkAllAttendedButtonClick" CssClass="TextButton" Visible="False" />
                <asiweb:StyledButton runat="server" ID="MarkAllAbsentButton" Text="Mark All Absent" OnClick="MarkAllAbsentButtonOnClick" CssClass="TextButton" Visible="False" />
            </div>
            <div>
                <telerik:RadAjaxLoadingPanel runat="server" ID="RegistrantsAjaxLoadingPanel" SkinID="AjaxLoadingPanel" BackgroundPosition="Center"
                     BackgroundTransparency="30" IsSticky="false" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"/>
                <telerik:RadAjaxPanel runat="server" ID="RegistrantsAjaxPanel" LoadingPanelID="RegistrantsAjaxLoadingPanel">
                    <asiweb:BusinessDataGrid2 runat="server" ID="RegistrantsGrid" 
                        OnNeedDataSource="RegistrantsGrid_NeedDataSource" 
                        OnItemDataBound="RegistrantsGrid_OnItemDataBound"
                        OnPageIndexChanged="RegistrantsGrid_OnPageIndexChanged"
                        AllowSorting="False" 
                        AutoGenerateColumns="false"
                        AllowPaging="true" PageSize="20" 
                        AllowMultiRowEdit="True" 
                        AllowMultiRowSelection="True"
                        CssClass="FullWidth ScrollHorizontal" EnableShowAllButton="False">
                        <MasterTableView 
                            AutoGenerateColumns="false" 
                            EnableNoRecordsTemplate="true" 
                            EditMode="InPlace"
                            DataKeyNames="EventFunctionAttendanceId">
                            <Columns>
                                <telerik:GridBoundColumn DataField="EventFunctionAttendanceId" UniqueName="EventFunctionAttendanceId" ReadOnly="true" Display="false" HeaderText="Attendance ID" />
                                <telerik:GridBoundColumn DataField="FunctionUnits" UniqueName="FunctionUnits" ReadOnly="true" Display="false" HeaderText="Function Units" />
                                <telerik:GridBoundColumn DataField="CreditUnitsEarned" UniqueName="OriginalCreditUnits" ReadOnly="true" Display="false" HeaderText="Credit Units Earned" />
                                <telerik:GridTemplateColumn HeaderText="Attended" UniqueName="Attended">
                                    <ItemTemplate>
                                        <div class="AlignCenter">
                                            <asp:CheckBox runat="server" ID="AttendedCheckBox" Enabled="true" />
                                            <asp:Label runat="server" ID="AttendedLabel" Text="The registrant attended the function" CssClass="hidden" AssociatedControlID="AttendedCheckBox"></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="RegistrantFullName" UniqueName="RegistrantFullName" HeaderText="Registrant" ReadOnly="true" />
                                <telerik:GridBoundColumn DataField="FunctionName" UniqueName="FunctionName" HeaderText="Function" ReadOnly="true" />
                                 <telerik:GridTemplateColumn DataField="CreditUnitsEarned" UniqueName="CreditUnits" HeaderText="Units">
                                    <ItemTemplate>
                                       <asiweb:StyledLabel ID="UnitsLabel" runat="server" Text='<%#string.Format("{0:f2}", Eval("CreditUnitsEarned"))%>' AssociatedControlID="UnitsTextBox" CssClass="ResetFont text-left" />
                                        <asiweb:BusinessTextBox ID="UnitsTextBox" runat="server" Text='<%#string.Format("{0:f2}", Eval("CreditUnitsEarned"))%>' MaxLength="6"/> 
							               <asp:RegularExpressionValidator runat="server" ID="UnitsToAwardValidator" ControlToValidate="UnitsTextBox" Display="Dynamic" SetFocusOnError="True"  ValidationExpression='<%#@"^[0-9]{1,3}(?:\" + System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.NumberDecimalSeparator + "[0-9]{1,2})?$"%>'
							               	ErrorMessage='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.UpdateAttendance.UnitToAwardWith2DecimalPlaces", 
							               	"Must be between 0 and 999.99 with 2 decimal places.") %>'/>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </asiweb:BusinessDataGrid2>
                </telerik:RadAjaxPanel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asiweb:PanelTemplateControl2>
