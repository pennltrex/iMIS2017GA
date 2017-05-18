<%@ Page Language="C#" AutoEventWireup="true" Inherits="iMIS_ContentManagement_PublishServerError" Codebehind="PublishServerError.aspx.cs" %>

<asp:Content id="Content1" runat="server" ContentPlaceHolderId="TemplateBody">
    <asiweb:PanelTemplateControl ID="PanelControl" runat="server" BorderStyle="None" Collapsible="false">   
        <asiweb:Lister2 runat="server" ID="PublishServerErrorGrid"  
                SelectMultipleEnabled ="true" 
                ColumnReorderingEnabled = "false"
                ExportButtonLocation="None" 
                DeleteColumnLocation="None" 
                SelectColumnLocation="Beginning"
                AddButtonEnabled ="false"
                RefreshButtonLocation="None" 
                PagingEnabled="true" 
                GroupingEnabled="false" 
                SortingEnabled="true"   
                DataKeyNames="PublishMessageLogKey"           
                LinkProperty="PublishRequestDetailKey"
                PageSize="20" 
                DataSourceSelectHidden ="true" 
                DisplayPropertiesList="MessageDateTime,MessageText,Location,PublishRequestDetailKey"
                DisplayPropertiesTitleOverride="Date/Time,Error Details,Location,Content"
                Width="100%" Height="95%"
                >        
        </asiweb:Lister2>
    </asiweb:PanelTemplateControl>   
</asp:Content>