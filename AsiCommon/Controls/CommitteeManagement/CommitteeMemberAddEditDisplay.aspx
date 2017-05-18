<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommitteeMemberAddEditDisplay.aspx.cs" Inherits="Asi.Web.UI.Common.CommitteeManagement.CommitteeMemberAddEditDisplay" %>
<%@ Import Namespace="Asi" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">

    <script type="text/javascript">
        function RebindPanel() {
            GetRadWindow().BrowserWindow.location.reload(true);
            
        }
    </script>   
    
<asiweb:PanelTemplateControl2 runat="server" Collapsible="False" ID="CommitteeMemberPanel">

    <div runat="server"  id="DivLabelErrorMessage">
        <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
    </div>
    
    <asiweb:BusinessDropDownList runat="server" TranslateOnlyCaptionAndToolTip="True" ID="CommitteeMemberTypeDropDownList" IncludeNullItem="False" OnSelectedIndexChanged="CommitteeMemberTypeDropDownList_OnSelectedIndexChanged" RenderPanelField="True" DisplayCaption="True" Caption="Type"/>
    
    <div class="PanelField Left">
           <asp:Label runat="server" ID="LabelPosition" Text="Position" AssociatedControlID="CommitteePositionDropDownList" CssClass="Label Required"></asp:Label>
           <div class="PanelFieldValue">
               <asiweb:BusinessDropDownList runat="server" TranslateOnlyCaptionAndToolTip="True" ID="CommitteePositionDropDownList" IncludeNullItem="False" OnSelectedIndexChanged="Role_SelectedIndexChanged" />
               <asiweb:AsiRequiredFieldValidator runat="server" ControlToValidate="CommitteePositionDropDownList"></asiweb:AsiRequiredFieldValidator>
           </div>
      </div>
    
    <asiweb:BusinessCalendar2 runat="server" ID="CalendarStartDate" RenderPanelField="true" DisplayCaption="true" UseSqlDateTimeMinValue="true" Caption="Term Start" />
    
    <asiweb:BusinessCalendar2 runat="server" ID="CalendarEndDate" RenderPanelField="true" DisplayCaption="true" UseSqlDateTimeMinValue="true" Caption="Term End" />

</asiweb:PanelTemplateControl2> 
</asp:Content>


