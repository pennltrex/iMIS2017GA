<%@ Import namespace="Asi.ProcessManager.Actions"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ProcessManager.ActionItemCollectionEdit" Codebehind="ActionItemCollectionEdit.ascx.cs" %>

<style type="text/css">
    .modalBackground {
        background-color:Gray;
        filter:alpha(opacity=70);
        opacity:0.7;
    }
</style>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop"  
    MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" >
    <Tabs>
        <telerik:RadTab Text='<%# Asi.ResourceManager.GetWord("Tasks") %>' Enabled='<%# TaskActionItemIncluded %>' PageViewID="TasksPage" Visible='<%# !IsCertificationProcess %>' />
        <telerik:RadTab Text='<%# Asi.ResourceManager.GetWord("Notes") %>' Enabled='<%# NoteActionItemIncluded %>' PageViewID="NotesPage" Visible='<%# !IsCertificationProcess %>' />
        <telerik:RadTab Text='<%# Asi.ResourceManager.GetPhrase("EmailNotifications", "Email Notifications") %>' Enabled='<%# EmailActionItemIncluded %>' PageViewID="EmailPage" />
    </Tabs>
</telerik:RadTabStrip> 

<telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
    CssClass="ContentTabbedDisplay AddPadding">

    <telerik:RadPageView runat="server" ID="TasksPage">
        <ContentTemplate>
            <asp:LinkButton ID="btnAddTask" Text='<%# Asi.ResourceManager.GetPhrase("AddTask", "Add Task") %>' CommandArgument='<%# typeof(TaskAction).Name %>' OnClick="btnAddActionItem_Click" runat="server" />
            <asp:Repeater ID="TaskActionRepeater" runat="server">
                <HeaderTemplate><table class="Grid">
                <tr>
                    <th class="text-hide">Action</th>
                    <th>Subject</th>
                    <th>Description</th>
                </tr></HeaderTemplate>
                <ItemTemplate>
                <tr>
                    <td><asp:LinkButton ID="lbtTaskAction" Text='<%# Asi.ResourceManager.GetWord("select") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' OnClick="lbtTaskAction_Click" runat="server" /></td>
                    <td><%# ((TaskAction)Container.DataItem).TaskSubject%></td>
                    <td><%# ((TaskAction)Container.DataItem).Description%></td>
                </tr></ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
        </ContentTemplate>                
    </telerik:RadPageView>

    <telerik:RadPageView runat="server" ID="NotesPage">
        <ContentTemplate>
            <asp:LinkButton ID="btnAddNote" Text='<%# Asi.ResourceManager.GetPhrase("AddNote", "Add Note") %>' CommandArgument='<%# typeof(NoteAction).Name %>' OnClick="btnAddActionItem_Click" runat="server" />
            <asp:Repeater ID="NoteActionRepeater" runat="server">
                <HeaderTemplate><table class="Grid">
                <tr>
                    <th class="text-hide">Action</th>
                    <th>Subject</th>
                    <th>Description</th>
                </tr></HeaderTemplate>
                <ItemTemplate>
                <tr>
                    <td><asp:LinkButton ID="lbNoteAction" Text='<%# Asi.ResourceManager.GetWord("select") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' OnClick="lbtNoteAction_Click" runat="server" /></td>
                    <td><%# ((NoteAction)Container.DataItem).NoteSubject%></td>
                    <td><%# ((NoteAction)Container.DataItem).NoteBody%></td>
                </tr></ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
        </ContentTemplate>     
    </telerik:RadPageView>

    <telerik:RadPageView runat="server" ID="EmailPage">
        <ContentTemplate>
            <asp:LinkButton ID="btnAddEmail" Text='<%# Asi.ResourceManager.GetPhrase("AddEmail", "Add Email") %>' CommandArgument='<%# typeof(EmailAction).Name %>' OnClick="btnAddActionItem_Click" runat="server" />
            <asp:Repeater ID="EmailActionRepeater" runat="server">
                <HeaderTemplate><table class="Grid">
                <tr>
                    <th class="text-hide">Action</th>
                    <th>Subject</th>
                    <th>Description</th>
                </tr></HeaderTemplate>
                <ItemTemplate>
                <tr>
                    <td><asp:LinkButton ID="lbEmailAction" Text='<%# Asi.ResourceManager.GetWord("select") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' OnClick="lbtEmailAction_Click" runat="server" /></td>
                    <td><%# ((EmailAction)Container.DataItem).ProcessEngineName%></td>
                    <td><%# ((EmailAction)Container.DataItem).Description%></td>
                </tr></ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
        </ContentTemplate>
    </telerik:RadPageView>

</telerik:RadMultiPage>