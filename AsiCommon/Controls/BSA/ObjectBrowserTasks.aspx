<%@ Page Language="C#" Inherits="Asi.Web.UI.Common.BSA.ObjectBrowserTasks" MasterPageFile="~/Templates/MasterPages/Empty.master" Codebehind="ObjectBrowserTasks.aspx.cs" %>
<%@ Import Namespace="System.Globalization" %>

<asp:Content id="HeadContent" runat="server" ContentPlaceHolderID="TemplateHead">
    <style>
    .Messages1,.Messages2 {
       font-size: .9em;
       padding-bottom: 5px;
    }    
    .Errors1,.Errors2 {
       font-size: .9em;
       padding-bottom: 5px;
       color: #ff0000;
    }    
    </style>     
    <asp:Panel id="DownloadScriptPanel" runat="server">
        <script type="text/javascript">
            <asp:Literal id="ExecuteTaskResultScript" runat="server" />
        </script>
    </asp:Panel>
</asp:Content>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">   
  
    <div class="ShowFieldset" style="margin:5px;">
        
        <fieldset>
            
            <legend><asp:label id="OperationLabel" runat="server" /></legend>  
          
            <div id="ResultsDiv" runat="server">
                
                <div style="width:100%;">
                    
                    <fieldset style="padding-right:3px;padding-left:3px;padding-top:3px;padding-bottom:3px;">
            
                        <legend><asp:label id="MessagesLabel" runat="server">Messages</asp:label></legend> 
                 
                        <asp:Panel id="MessagesPanel" BackColor="white" runat="server" BorderWidth="0" style="overflow:auto;" Height="140px">
                            <asp:Repeater id="MessagesRepeater" runat="server" OnItemDataBound="MessagesRepeater_ItemDataBound">
	                            <ItemTemplate>
	                                <asp:label id="Message1" Width="100%" runat="server" CssClass="Messages1"/>
	                                <br />
	                            </ItemTemplate>
	                            <AlternatingItemTemplate>
	                                <asp:label id="Message2" Width="100%" runat="server" CssClass="Messages2"/>
	                                <br />
	                            </AlternatingItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                                       
                    </fieldset>

                </div>
                <div style="width:100%;">
                    
                    <fieldset style="padding-right:0px;padding-left:3px;padding-top:3px;padding-bottom:3px;">
            
                        <legend><asp:label id="ErrorsLabel" runat="server">Errors</asp:label></legend> 
                                   
                        <asp:Panel id="ErrorsPanel" BackColor="white" runat="server" BorderWidth="0" style="overflow:auto;" Height="110px">
                            <asp:Repeater id="ErrorsRepeater" runat="server" OnItemDataBound="MessagesRepeater_ItemDataBound">
	                            <ItemTemplate>
	                                <asp:label id="ErrorMessage1" Width="100%" CssClass="Errors1" runat="server"></asp:label>
	                                <br />
	                            </ItemTemplate>
	                            <AlternatingItemTemplate>
	                                <asp:label id="ErrorMessage2" Width="100%" CssClass="Errors2" runat="server"></asp:label>
	                                <br />
	                            </AlternatingItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>                   

                    </fieldset>

                </div>
            </div>        
            <div id="RecurseDiv" runat="server" Visible="false">
        
                <asp:CheckBox id="RecurseCheckBox" runat="server" Checked="true" />
                <asp:label id="RecurseLabel" runat="server" AssociatedControlID="RecurseCheckBox"/>
       
            </div>
            <div id="PublishTypeDiv" runat="server" Visible="false">

                <asp:RadioButtonList id="PublishTypeList" runat="server" OnSelectedIndexChanged="PublishTypeList_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Text="Publish Working Items Only" Value="PublishWorking"/>
                    <asp:ListItem Selected="False" Text="Publish All Items" Value="Publish"/>
                    <asp:ListItem Selected="False" Text="Publish Working Items, Regenerate Published Items" Value="Regenerate"/>
                </asp:RadioButtonList>
        
            </div>

            <div id="CloseOptionDiv" runat="server" Visible="false">
                
                <br/>   
                <asp:label id="PublishTypeLabel" runat="server" AssociatedControlID="PublishTypeList"/>                              
                <div class="SubItems">       
                    <asp:CheckBox id="CloseOption" runat="server" OnCheckedChanged="CloseOption_CheckedChanged" />
                    <asp:label id="CloseOptionLabel" runat="server" AssociatedControlID="CloseOption"/>
                </div>  
                   
            </div>

            <iframe id="DownloadIFrame" width="0" height="0" frameborder="0"></iframe>

            <asp:Button id="ExecuteTaskButton" runat="server" OnClick="ExecuteTaskButton_Click" style="display:none;"/>

            <script type="text/javascript">
            if (<%= ShouldExecuteTask.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>)
                addLoadEvent(ExecuteTask);
        
            function ExecuteTask(e){
                InitiateControlEventWithArgument('<%= ExecuteTaskButton.ClientID %>', <%= Asi.Web.UI.MasterPageBase.WindowArgumentClientScript %>);
                wait();
            }
            </script>
        
        </fieldset>
    
    </div>

</asp:Content>