<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Roles" Collapsible="false">

    <asp:placeholder id="phTaskBar" runat="server"></asp:placeholder>

    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

    <div style="clear:both; width:100%">
        <asiweb:Lister2 id="RoleList" 
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/Common/Queries/SecurityAdministration/RoleList"
        DeleteColumnLocation="None"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="NewWindowEachLink"
        AddTargetUrl="~/AsiCommon/Controls/Shared/SecurityAdmin/Role.aspx?TemplateType=D"
        TargetUrl="~/AsiCommon/Controls/Shared/SecurityAdmin/Role.aspx?TemplateType=D"
        LinkTargetBehavior="NewWindowEachLink"
        EditColumnLocation="None"
        SelectColumnLocation="None"
        LinkProperty="Name"  
        UseUniformKey="true"       
        EnableClientSideDelete="false"      
        AddButtonText="Add a role"
        ExportButtonLocation="TopRight"       
        LinkTargetHeight="400px"
        LinkTargetWidth="600px"                                                    
        />
    </div>  

</asiweb:PanelTemplateControl2>
