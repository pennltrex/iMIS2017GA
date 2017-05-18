<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ProcessManager.TaskActionEdit" Codebehind="TaskActionEdit.ascx.cs" %>

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

<asp:UpdatePanel ID="upnlTaskAction" UpdateMode="Conditional" runat="server">
    <ContentTemplate>
        <asiweb:PanelTemplateControl runat="server" Collapsed="false" FieldSet="true" Collapsible="false" 
            ShowHeader="false" BorderStyle="None">
            <asiweb:PanelTemplateColumn runat="server" LabelWidth="10em" ValueWidth="14em">
                <div class="PanelField Left">
                    <asp:Label ID="lblSubject" runat="server" AssociatedControlID="txtSubject" CssClass="Required" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox id="txtSubject" runat="server" />
                    </div>
                </div>
                <div class="PanelField Left">
                    <asp:Label ID="lblDescription" runat="server" AssociatedControlID="txtDescription" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox id="txtDescription" runat="server" textmode="MultiLine" />
                    </div>
                </div>
                <div class="PanelField Left">
                    <asp:Label ID="lblComment" runat="server" AssociatedControlID="txtComment" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox id="txtComment" runat="server" textmode="MultiLine" />
                    </div>
                </div>
                <div class="PanelField Left">
                    <asp:Label ID="lblDaysAllowed" runat="server" AssociatedControlID="txtDaysAllowed" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox id="txtDaysAllowed" runat="server" />&nbsp;
                        <asp:rangevalidator id="DaysValidator" runat="server" type="Integer" minimumvalue="0" maximumvalue="99999999"
                        errormessage="RangeValidator" controltovalidate="txtDaysAllowed"/>
                    </div>
                </div>
                <div class="PanelField Left">
                    <asp:Label ID="lblPriority" runat="server" AssociatedControlID="ddlPriority" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList id="ddlPriority" runat="server" />
                    </div>
                </div>
                <div class="PanelField Left">
                    <asp:Label ID="lblAssignedTo" runat="server" AssociatedControlID="ddlAssignedGroup" CssClass="Required"/>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList Runat="server" ID="ddlAssignedGroup" />
                    </div>
                </div>
            </asiweb:PanelTemplateColumn>
        </asiweb:PanelTemplateControl>
    </ContentTemplate>
</asp:UpdatePanel>