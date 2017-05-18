<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProgramOrganizerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Events.ProgramOrganizerDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl2 runat="server" ID="ProgramOptionsPanel" ShowBorder="False" Collapsible="False">
    <div runat="server" id="DivPanelListerWrapper" Visible="False"></div>

    <div runat="server" id="MainContentContainer" translate="yes">
        <telerik:RadGrid AllowMultiRowEdit="True" AllowMultiRowSelection="False" AllowPaging="False" AllowSorting="false" EnableAriaSupport="True"
            AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="False" CssClass="Grid" 
            EnableLinqExpressions="False" FooterStyle-CssClass="GridFooter" GridLines="None" HeaderStyle-CssClass="GridHeader" 
            ID="RadGrid1" ItemStyle-CssClass="GridRow" runat="server" ShowStatusBar="false" ShowGroupPanel="false" >
              
            <MasterTableView AllowMultiColumnSorting="false" ClientDataKeyNames="EventFunctionId" CommandItemDisplay="None" 
                DataKeyNames="EventFunctionId" EditMode="InPlace" ShowHeader="true" GroupLoadMode="Client">
                
                <GroupHeaderTemplate>
                    <asiweb:BusinessLabel id="GroupDateLabel" runat="server" />  
                </GroupHeaderTemplate>
                                
                <Columns>
                               
                    <telerik:GridTemplateColumn UniqueName="StartDateTime" Groupable="True" HeaderText="Date" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="StartDateTime" SortExpression="StartDateTime" AllowFiltering="True">
                        <HeaderStyle CssClass="text-hide"></HeaderStyle>
                        <ItemTemplate>
                            <div style="display:none;">
                                <asiweb:BusinessLabel id="DateLabel" runat="server"/>
                            </div>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn UniqueName="NameColumn" HeaderText="Name" ItemStyle-Wrap="true" HeaderStyle-Wrap="false" DataField="Name" SortExpression="Name" AllowFiltering="True">
                        <ItemTemplate>
                            <div style="min-width:250px;">
                                <asiweb:BusinessLabel id="NameLabel" runat="server"/>
                            </div>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="DisplayOptionsColumn" HeaderText="Display options for this program option" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="DisplayOptions" SortExpression="DisplayOptions" >
                        <ItemTemplate>
                            <asiweb:StyledLabel runat="server" ID="displayOptionsLabel" CssClass="screen-reader-text"></asiweb:StyledLabel>
                            <asiweb:BusinessDropDownList runat="server" ID="DisplayOptionsSelect" Width="265px" ShowNullItem="false" />                     
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="IsAutoEnrollColumn" HeaderText="Register by default?" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="IsAutoEnroll" SortExpression="IsAutoEnroll" >
                        <ItemTemplate>
                            <div style="display:table;text-align:center;width:100px;">
                                <div style="display:table-cell;vertical-align:middle;">                                               
                                    <asiweb:BusinessCheckBox ID="IsAutoEnrollCheckBox" runat="server" />
                                </div>
                            </div>                              
                        </ItemTemplate>
                    </telerik:GridTemplateColumn> 
                            
                </Columns> 
                     
                <NoRecordsTemplate>
                    <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" Text="(None)"></asiweb:BusinessLabel>
                </NoRecordsTemplate> 

                <EditFormSettings>
                    <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                    <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" Width="100%" />
                    <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="0" Width="75%" />
                    <FormTableAlternatingItemStyle Wrap="False"></FormTableAlternatingItemStyle>
                    <FormStyle Width="100%"></FormStyle>
                    <EditColumn UniqueName="EditCommandColumn1" UpdateText="Save" CancelText="Cancel" InsertText="Save" ButtonType="PushButton">
                    </EditColumn>
                </EditFormSettings> 
                                
            </MasterTableView>

            <ClientSettings AllowGroupExpandCollapse="true">
                <Selecting AllowRowSelect="false" /> 
                <ClientEvents OnRowClick="RowSelected" OnGridCreated="GridCreated" OnCommand="GridCommand"></ClientEvents>                                     
            </ClientSettings>
        
            <GroupingSettings ShowUnGroupButton="false"></GroupingSettings>

        </telerik:RadGrid>
    </div>
</asiweb:PanelTemplateControl2>