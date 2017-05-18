<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDataSource.aspx.cs" Inherits="Asi.Web.iParts.Common.Tasks.AddDataSource" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:Content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody">    
    <style>.Indent{padding-left:16px;}</style>
    <asiweb:PanelTemplateControl2 ID="DataSourceTemplateControl" runat="server" Collapsible="false" ShowBorder="false" ShowHeader="false">
        <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" />    
        <asp:UpdatePanel ID="DataSourcePanel" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <div class="PanelFieldValue">
                <asiweb:StyledRadioButton ID="UseExistingSource" runat="server" DisplayCaption="true" PositionCaption="Right" 
                                          RenderPanelField="True" AutoPostBack="true" GroupName="DataSourceType" Checked="false" />
                    </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList ID="ExistingDataSourceSelect" runat="server" ShowNullItem="False" />               
                </div>
                <asiweb:StyledRadioButton ID="UseIqaQuery" runat="server" DisplayCaption="true" PositionCaption="Right" 
                    RenderPanelField="true" AutoPostBack="true" GroupName="DataSourceType" Checked="true"/>
            
                <asiweb:PanelTemplateControl2 ID="IqaQueryPanelTemplateControl" runat="server" Collapsible="false" ShowBorder="false" ShowHeader="false" CssClass="Indent">
                
                    <div class="PanelField Left">
                        <div style="display:inline;">
                            <asiweb:StyledLabel AssociatedControlID="DataSourceNameTextBox" ID="DataSourceNameLabel" runat="server" CssClass="Required" />
                        </div>
                        <div class="PanelFieldValue">                
                            <asiweb:BusinessTextBox CssClass="InputXLarge" ID="DataSourceNameTextBox" Required="true" runat="server" />
                            <asiweb:AsiRequiredFieldValidator ControlToValidate="DataSourceNameTextBox" Display="Dynamic" ID="DataSourceNameTextBoxRfv" runat="server" />
                            <asp:CustomValidator ID="DataSourceNoSpaceValidator" runat="server" ControlToValidate="DataSourceNameTextBox" OnServerValidate="DataSourceNoSpaceServerValidation" ErrorMessage=<%# NoSpaceInDataSource %> Display="Dynamic" />                           
                        </div>
                    </div>

                    <div class="PanelField Left">
                        <div style="display:inline;">
                            <asiweb:StyledLabel AssociatedControlID="QueryTextBox" CssClass="Required" ID="QueryLabel" runat="server" />
                        </div>
                        <div class="PanelFieldValue ">
                            <asiweb:BusinessDocumentBrowserControl ID="QueryTextBox" runat="server" DocumentHierarchyPath="$/Common/Tasks/Queries"
                                RootFolder="$" AllowUpwardNavigation="False" ShowAddress="False" DocumentTypesAllowed="IQD" />                     
                             <asp:LinkButton runat="server" ID="SelectLinkButton"></asp:LinkButton>                                   
                        </div>
                    </div>  
                               
                </asiweb:PanelTemplateControl2>                            
                    
            </ContentTemplate>                  
        </asp:UpdatePanel>

    </asiweb:PanelTemplateControl2>
     
    <script type="text/javascript">
        function ReturnNewTaskId(taskId, selectedIndex) { 
            var oWindow = GetRadWindow(); 
            if (oWindow != null && oWindow.BrowserWindow != null) {
                var url = GetRadWindow().BrowserWindow.location.href;
                if (url.indexOf('TaskDefinitionId') < 0) url = url + '&TaskDefinitionId=' + taskId;
                if (url.indexOf('SelectedIndex') < 0) url = url + '&SelectedIndex=' + selectedIndex;
                else {
                    var re = /SelectedIndex=(\d*)/g;
                    url = url.replace(re, 'SelectedIndex=' + selectedIndex);
                }
                oWindow.IsDirty = true;
                GetRadWindow().BrowserWindow.location.href = url;
            } 
        }     
    </script>
</asp:Content>
