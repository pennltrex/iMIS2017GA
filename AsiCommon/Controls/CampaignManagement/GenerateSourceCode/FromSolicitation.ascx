<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_GenerateSourceCode_FromSolicitation" Codebehind="FromSolicitation.ascx.cs" %>

<asiweb:ParameterList ID="ParameterList1" runat="server">
    <asiweb:Parameter name="SolicitationKey" Type="CurrentContext" Value="SubjectUniformKey" operation="Equal" id="AtomPanel_ParameterList_1_Parameter_0" runat="server" />
</asiweb:ParameterList>
     
<asp:Panel runat="server" ID="SelectSolicitationsPanel">

    <asiweb:PanelTemplateControl ID="SelectSolicitationsPanel1" runat="server" TemplateTitle="Current Solicitations" Collapsible="false">

        <div id="CurrentSolicitations" style="width:95%;">

            <asiweb:BusinessDataGrid runat="server" ID="SelectedSolicitationsGrid" DataSource="<%#SelectedSolicitations%>" AutoGenerateColumns="False">
            <Columns>
                         
                <asiweb:StyledBoundColumn DataField="Name" HeaderText="Name" />
                <asiweb:StyledBoundColumn DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:d}" />
                <asiweb:StyledBoundColumn DataField="EndDate" HeaderText="End Date" DataFormatString="{0:d}" />
                <asiweb:StyledBoundColumn DataField="SolicitationStatusCode" HeaderText="Status" />
                <asiweb:SmartColumn BoundBusinessPropertyName="CreatedByUserKey" BusinessObjectName="Solicitation" />
                                                          
                <asiweb:StyledTemplateColumn>
                    <ItemTemplate>          
                        <asp:LinkButton ID="lnkRemove" runat="server" CommandName="Delete" Text="remove" ToolTip="Remove this item" CommandArgument='<%#Eval("SolicitationKey")%>' />           
                    </ItemTemplate>
                </asiweb:StyledTemplateColumn>
            </Columns>
            </asiweb:BusinessDataGrid>

        </div>
        
    </asiweb:PanelTemplateControl> 
    
    <div style="height:8px"></div>  

    <asiweb:PanelTemplateControl ID="PanelAvailibleSolicitations" runat="server" TemplateTitle="Available Solicitations" Collapsible="false"> 

        <div id="AvailibleSolicitations">
            <asiResultsViewer:QueryResultGrid runat="server" SelectItemBehavior="RaiseEvent" DeleteEnabled="False" SelectEnabled="True"  
            QueryPath="$/CampaignManagement/DefaultSystem/Queries/SolicitationList" ID="AvailibleSolicitationsGrid" />    
        </div>

        <asiweb:StyledButton Text="Create Source Codes" runat="server" ID="CreateSourceCodesButton" />
        
    </asiweb:PanelTemplateControl>  

</asp:Panel>

<asp:Panel runat="Server" ID="NameSourceCodesPanel" Visible="false">

    <div class="mdTitle">Name New Source Codes</div>
    <asp:Repeater runat="server" ID="NameSourceCodesRepeater" DataSource="<%#SelectedSourceCodes%>">
        <HeaderTemplate>
            <table class="Grid">
                <thead>
                    <tr class="GridHeader">
                        <th scope="Col"><%#Asi.ResourceManager.GetPhrase("CampaignManagment.OriginalSourceCodeFromSolicitationHeader","Original")%></th>
                        <th scope="Col"><%#Asi.ResourceManager.GetPhrase("CampaignManagment.NewSourceCodeFromSolicitationHeader", "New")%></th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="GridRow">
                <td><%#Eval("Code")%></td>
                <td>
                    <asiweb:BusinessTextBox runat="server" ID="NewSourceCodeCode" />
                    <asp:HiddenField runat="server" ID="OriginalSourceCodeKey" Value='<%#Eval("SourceCodeKey")%>' />
                    <asp:RequiredFieldValidator runat="server" id="NameValidator" ControlToValidate="NewSourceCodeCode" ErrorMessage="Each source code must have a unique, and non-blank code" />              
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="GridAlternateRow">
                <td><%#Eval("Code")%></td>
                <td>
                    <asiweb:BusinessTextBox runat="server" ID="NewSourceCodeCode" />
                    <asp:HiddenField runat="server" ID="OriginalSourceCodeKey" Value='<%#Eval("SourceCodeKey")%>' />
                    <asp:RequiredFieldValidator runat="server" id="NameValidator" ControlToValidate="NewSourceCodeCode" ErrorMessage="Each source code must have a unique, and non-blank code" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </tbody></table>
        </FooterTemplate>
    </asp:Repeater>
    
</asp:Panel>