<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_GenerateSourceCode_FromSegments" Codebehind="FromSegments.ascx.cs" %>
<script type="text/javascript">
function ToggleAll(checkbox)
{
    var table = document.getElementById("<%#SelectedSegmentJobGrid.ClientID%>");
    var checked = checkbox.checked;
    var rows = table.rows;
    for(var i=0;i<rows.length;i++)
    {
       rows[i].cells[0].childNodes[0].checked = checked;
    }
}
</script>

<asp:Panel runat="server" ID="SelectDefinitionsPanel">

    <asiweb:PanelTemplateControl ID="SelectSegmentationPanel" runat="server" TemplateTitle="Select Segmentation Definitions" Collapsible="false">
    
        <div id="SelectedSegments" style="width:95%;">
                         
            <asiweb:BusinessDataGrid id="SelectedSegmentJobGrid" runat="server" DataSource="<%#SelectedSegmentationDefs%>" AutoGenerateColumns="False">  
                <Columns>
                    <asp:TemplateColumn>
                        <headerTemplate><input type="checkbox" id="SelectAll" onclick="ToggleAll(this);" title="Check / Uncheck all Segmentation Jobs" /></headerTemplate>
			            <ItemTemplate><asp:CheckBox Runat="server" ID="SegmentDefSelected" /></ItemTemplate>
                    </asp:TemplateColumn>
                    <asiweb:StyledTemplateColumn HeaderText="Job Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="JobLabel" />               
                        </ItemTemplate>
                    </asiweb:StyledTemplateColumn>
                    <asiweb:StyledBoundColumn DataField="Name" HeaderText="Seg. Def. Name" />
                    <asiweb:StyledBoundColumn DataField="Description" HeaderText="Description" />
                </Columns>               
            </asiweb:BusinessDataGrid>
            
        </div>
    
    </asiweb:PanelTemplateControl>

    <div style="height:8px"></div> 

    <asiweb:PanelTemplateControl ID="PanelAvailibleSegments" runat="server" TemplateTitle="Available Populated Segmentation Jobs" Collapsible="false">
    
        <div id="AvailibleSegments">
            <asiResultsViewer:QueryResultGrid id="AvailibleSegmentsGrid" QueryPath="$/SegmentManagement/DefaultSystem/Queries/JobList" Runat="server" SelectItemBehavior="RaiseEvent" />
        </div>

        <asiweb:StyledButton runat="server" ID="CreateSourceCodesButton" Text="Create Source Codes" />
    
    </asiweb:PanelTemplateControl>

</asp:Panel>

<asp:Panel runat="server" ID="NameNewSourceCodesPanel" Visible="False">

    <div class="mdTitle">Name New Source Codes</div>
    <asp:Repeater runat="Server" ID="NameSourceCodesRepeater" DataSource="<%#CheckedSegmentationDefs%>" >
        <HeaderTemplate>
            <table class="Grid">
                <thead>
                    <tr class="GridHeader">
                    <th>Seg. Def. Name</th>
                    <th>Source Code</th>
                    </tr>
                </thead>
            <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="GridRow">
                <td>
                    <%#Eval("Name")%>
                </td>
                <td><asiweb:BusinessTextBox runat="server" ID="SourceCodeName" /></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
         <tr class="GridAlternateRow">
                <td>
                    <%#Eval("Name")%>
                </td>
                <td><asiweb:BusinessTextBox runat="server" ID="SourceCodeName" /></td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate></tbody></table></FooterTemplate>
    </asp:Repeater>
    
</asp:Panel>