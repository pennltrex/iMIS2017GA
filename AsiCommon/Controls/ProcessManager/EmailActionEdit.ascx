<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ProcessManager.EmailActionEdit" Codebehind="EmailActionEdit.ascx.cs" %>

<script type="text/javascript">
        
    function CloseWindowAndReturnValue(result)
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        oWindow.result = result;
        oWindow.Close();
    }

</script>

<div class="CommandBar">      
    <asiweb:StyledButton ID="btnDeleteTask" OnClick="btnDelete_Click" runat="server" />
    <asiweb:StyledButton ID="btnContinueTask" OnClick="btnContinue_Click" runat="server" />        
</div>
  
<asp:UpdatePanel ID="upnlEmailAction" UpdateMode="Conditional" runat="server">
    <ContentTemplate>
        <input type="hidden" id="ProcessKey" runat="server" />
        <asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" 
            ShowHeader="false" BorderStyle="None">
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="10em" ValueWidth="14em" Width="90%">
                <div class="PanelField Left">
                    <asp:Label ID="lblProcessName" runat="server" AssociatedControlID="upnlEmailProcess" CssClass="Required" />
                    <div class="PanelTableValue">
                        <asp:UpdatePanel ID="upnlEmailProcess" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asiweb:BusinessTextBox id="txtProcessName" runat="server" Enabled="false" />&nbsp;
                                <asiweb:StyledButton id="btnProcessNameLookup" Text="..." runat="server" AutoPostBack="false" />&nbsp;
                                <asiweb:StyledButton id="btnProcessNameClear" Text="X" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="PanelField Left">
                    <asp:Label ID="lblDescription" runat="server" AssociatedControlID="txtDescription" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox id="txtDescription" runat="server" textmode="MultiLine" />
                    </div>
                </div>
                <div class="PanelField Left">
                    <asp:Label ID="lblAssignees" runat="server" AssociatedControlID="ddlAssignees" CssClass="Required"/>
                    <div class="PanelTableValue">
                        <asiweb:MultiSelectControl id="ddlAssignees" runat="server" />
                    </div>
                </div>
            </asiweb:PanelTemplateColumn>
        </asiweb:PanelTemplateControl>
    </ContentTemplate>
</asp:UpdatePanel>