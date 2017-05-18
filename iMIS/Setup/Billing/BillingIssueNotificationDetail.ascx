<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillingIssueNotificationDetail.ascx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillingIssueNotificationDetail" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">    
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="40em" translate="yes">
        <asiweb:StyledLabel runat="server" ID="message"/>      
        <div class="PanelField Left">
            
            <div class="AddPaddingHorizontal PanelField Left">
                <asiweb:StyledLabel CssClass="Label Required" runat="server" id="SendOptionsLabel"></asiweb:StyledLabel>
                <div class="PanelFieldValue">
	                <asiweb:BusinessRadioButtonList ID="SendOptionsButtonList" runat="server" CssClass="AutoWidth" RepeatDirection="Horizontal" OnSelectedIndexChanged="SendOptionsButtonList_OnSelectedIndexChanged" AutoPostBack="True">
	                    <asp:ListItem Text="Email" Value="0" Selected="True"/>
                        <asp:ListItem Text="Print" Value="1" Enabled="True"/>
                    </asiweb:BusinessRadioButtonList>
                    <asiweb:StyledLabel runat="server" ID="SendOptionsMessage" class="Info" RenderPanelField="True"/> 
	            </div>
            </div>
            
            <div class="AddPaddingHorizontal PanelField Left">
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel CssClass="Label Required" runat="server" id="NotificationsToSendLabel"></asiweb:StyledLabel>    
                </div>
                <div class="PanelFieldValue">
                    
	                <div class="CheckBoxList">
                        <asiweb:BusinessCheckBox ID="InitalNoticeCheckBox" runat="server" RenderPanelField="True" DisplayCaption="True" />
                        <asiweb:BusinessCheckBox ID="FirstReminderCheckBox" runat="server" RenderPanelField="True" DisplayCaption="True" />
                        <asiweb:BusinessCheckBox ID="SecondReminderCheckBox" runat="server" RenderPanelField="True" DisplayCaption="True" />
                    </div>
	            </div>
            </div>
            
            <div class="AddPaddingHorizontal PanelField Left">
                <asiweb:StyledLabel CssClass="Label Required" runat="server" id="BillingCycleMultiLabel"></asiweb:StyledLabel>
                <div class="PanelFieldValue">
                    <asiweb:MultiSelectControl2 ID="BillingCycleMultiSelect" runat="server"/>
                </div>
            </div>

            <div class="AddPaddingHorizontal PanelField Left">
                <asiweb:StyledLabel CssClass="Label Required" runat="server" id="EffectiveDateLabel"></asiweb:StyledLabel>
                <div class="PanelFieldValue">
                    <asiweb:BusinessCalendar2 runat="server" ID="EffectiveDateCalendar" RenderPanelField="False" DisplayCaption="False" UseSqlDateTimeMinValue="true" />    
                    <asiweb:StyledLabel runat="server" ID="EffectiveDateMessage" CssClass="Info" RenderPanelField="True"/> 
                </div>
            </div>
            
        </div>   
        
        <div class="ShowFieldset" style="width:875px;">
            <fieldset>
                <legend>
		            <span id="OtherOptionsLegendLabel" runat="server" class="SectionLabel"></span> 
		        </legend>             
                  
                <asiweb:BusinessCheckBox DisplayCaption="True" id="OnlyBillContactsIncludedInQueryCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" 
                    AutoPostBack="True" Checked="False" OnCheckedChanged="OnlyBillContactsIncludedInQueryCheckBox_OnCheckedChanged" />  
                
                <div id="OnlyBillContactsInQueryControlPanel" class="PanelField" runat="server">
                    <div class="SubItems" ID="QueryPathControl" runat="server">
                        <asiweb:StyledLabel runat="server" ID="LinkTargetLabel" CssClass="AutoWidth" AssociatedControlID="PathToQueryTextBox" PositionCaption="Left" />
                        <div class="PanelFieldValue InputMediumWrapper">   
                                        
                            <asiweb:BusinessDocumentBrowserControl ID="PathToQueryTextBox" OnDataChanged="PathToQueryTextBox_OnDataChanged" AutoPostBack="True" runat="server" 
                                DocumentHierarchyPath="$/Common/Queries/Billing" DisplayCaption="False" RenderPanelField="False" RootFolder="$" AllowUpwardNavigation="False" ShowAddress="False" 
                                DocumentTypesAllowed="IQD"/>
                            <asp:CustomValidator runat="server" id="PathToQueryCustomValidator" Display="Dynamic" 
                                 ErrorMessage="The selected query does not contain a contact ID column." OnServerValidate="PathToQueryCustomValidator_OnServerValidate"/>

                            <div id="EditQueryPanel" class="PanelField" runat="server">
                                <asp:LinkButton runat="server" ID="EditSourceQueryLinkButton" ></asp:LinkButton>   
                            </div>
                            <div class="PanelField">
                                <asp:LinkButton runat="server" ID="CreateNewQueryLinkButton"></asp:LinkButton>    
                            </div>    
                        </div>   
                    </div>
                </div>
                          
                <asiweb:BusinessCheckBox DisplayCaption="True" id="OnlyBillContactsInChapterCheckBox" PositionCaption="Right" AutoPostBack="True" Checked="False" RenderPanelField="true" 
                    runat="server" OnCheckedChanged="OnlyBillContactsInChapterCheckBox_OnCheckedChanged" />
                
                <div id="OnlyBillContactsToChapterControlPanel" runat="server" class="PanelField">
                    <div class="SubItems">
                        <asiweb:StyledLabel runat="server" ID="ChapterLabel" CssClass="AutoWidth" AssociatedControlID="ChaptersDropdownList" Text="Chapter" PositionCaption="Left" />
                        <div class="PanelFieldValue">
                            <asiweb:BusinessDropDownList runat="server" ID="ChaptersDropdownList" IncludeNullItem="False"/> 
                        </div>
                        
                        <asiweb:StyledLabel runat="server" ID="ChapterMessageLabel" class="Info" RenderPanelField="True"/> 
                    </div>
                </div>

            </fieldset>    
        </div>    
        
        <div class="FloatLeft" style="padding-top:10px;">
            <asp:Button ID="GenerateNotificiationsButton" runat="server" OnClick="GenerateNotificationsButton_OnClick"  
                CssClass="PrimaryButton TextButton"></asp:Button>     
        </div>
    </asiweb:PanelTemplateColumn>    
</asiweb:PanelTemplateControl2>
    
 <script type="text/javascript">
     //<![CDATA[
    //]]>
 </script>
