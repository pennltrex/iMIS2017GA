<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Community_CommunityRoster" Codebehind="CommunityRoster.ascx.cs" %>

<script type="text/javascript">

    function CallBackFunction(radWindow) 
    {
        var hiddenResult = document.getElementById('<%# hiddenResult.ClientID %>');
        if (radWindow.result)
        {
            hiddenResult.value = radWindow.result;
            document.forms[0].submit();
        }
    }

</script>

<input type="hidden" id="hiddenResult" runat="server" />
<asiweb:PanelTemplateControl2 ID="CommunityRosterListPanel" runat="server" Collapsed="false" Collapsible="false" Text="Community participants" BorderStyle="None">
   
    <div class="Scroll">
   
        <div class="CommunityItemActionLinks"> 
            <asiweb:StyledButton ID="btnAddContact" runat="server" Text="Add" Visible="false" />
        </div> 

        <asiweb:Lister2 id="RosterListFull" runat="server"
            AjaxEnabled="true"
            SortingEnabled="true"
            PagingEnabled="true"
            PagerMode="Advanced"
            PageSize="20"
            ColumnReorderingEnabled="false"
            EnableClientSideDelete="false"
            EditColumnLocation="None"
            SelectColumnLocation="Beginning"
            DeleteColumnLocation="None"                                      
            AddButtonEnabled="false"
            AddButtonLocation="None"   
            TargetUrlKeyParameterName="ContactKey"
            TargetUrl="~/iCore/Communities/CommunityPreferences.aspx?iUniformKey=REPLACEWITHATOMKEY&RefreshParent=true"
            UseUniformKey="false"
            DataKeyNames="ContactKey"
            LinkTargetBehavior="NewWindowAllShare"
            DataSourceIsRealDataSource="true"
            ExportButtonLocation="TopRight"
            DisplayPropertiesList="FirstName,LastName,Company,DateSubscribedString,CommunityRole,LastPostName,LastPostDateString"
            DisplayPropertiesTitleOverride="First Name,Last Name,Company,Since,Position,Last Post,Last Post Date"
            SelectColumnText="select"
            OnItemDataBound="RosterList_OnItemDataBound"
            LinkProperty="LastPostName"
            LinkPropertyTargetBehavior="SameWindow"
            LinkPropertyTargetUrl="DUMMYURL"
            OnExport="RosterListFull_Export"
        />
        
        <asiweb:Lister2 id="RosterListMini" runat="server"
            AjaxEnabled="true"
            SortingEnabled="true"
            PagingEnabled="true"
            PagerMode="Simple"
            PageSize="20"
            ColumnReorderingEnabled="false"
            EnableClientSideDelete="false"
            EditColumnLocation="None"
            SelectColumnLocation="Beginning"
            DeleteColumnLocation="None"                                      
            AddButtonEnabled="false"
            AddButtonLocation="None"   
            TargetUrlKeyParameterName="ContactKey"
            TargetUrl="~/iCore/Communities/CommunityPreferences.aspx?iUniformKey=REPLACEWITHATOMKEY&RefreshParent=true"
            UseUniformKey="false"
            DataKeyNames="ContactKey"
            LinkTargetBehavior="NewWindowAllShare"
            DataSourceIsRealDataSource="true"
            ExportButtonLocation="TopRight"
            DisplayPropertiesList="FirstName,LastName,Company,CommunityRole"
            DisplayPropertiesTitleOverride="First Name,Last Name,Company,Position"
            SelectColumnText="select"
            OnItemDataBound="RosterList_OnItemDataBound"
            OnExport="RosterListMini_Export"
        />
    
        <div style="display: none;">
            <%-- Lister below is for exporting data --%>
            <asiweb:Lister2 ID="lstRosterExport" runat="server" Title="Community roster"
                AddButtonEnabled="false" DeleteColumnLocation="None" AjaxEnabled="false"
                EditColumnLocation="None" ExportButtonLocation="None" GroupingEnabled="false"
                SelectColumnLocation="None" SortingEnabled="false" PagingEnabled="false" 
                DataSourceIsRealDataSource="true"
            />
        </div>
    </div> 
              
</asiweb:PanelTemplateControl2>
