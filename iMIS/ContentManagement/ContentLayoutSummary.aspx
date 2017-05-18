<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_ContentLayoutSummary" Title="Layout Summary" Codebehind="ContentLayoutSummary.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" runat="server">
    <style type="text/css">
    #layout {
        border: 1px solid #424242; 
        padding: 2px 2px 2px 2px;
    }
    #layout p {
        text-align: center; 
        color: white; 
        background-color: gray;          
        min-height: 1em; 
        max-height: 2em;
    }
    #layout {
        width: 9em; 
        position: fixed;
        top: 6px;
        right: 6px;            
    }
    /* Adjusts the display of the Bootstrap grid columns and rows only when they are shown in the layout preview within the ContentLayoutSummary */
    div[id*="SummaryDefaultPanel"] #layout div[class^="col"] {
        padding-left: 1px;
        padding-right: 1px;
    }
    div[id*="SummaryDefaultPanel"] #layout .row {
        margin-left: 0;
        margin-right: 0;
    }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">  
    <asiweb:PanelTemplateControl ID="SummaryDefaultPanel" runat="server" Collapsible="false" FieldSet="true" ShowHeader="false" BorderStyle="none">
        
        <div class="row">
            <div class="col-xs-9">
                <asp:Literal id="DocumentName" Runat="server" Visible="False"/>
        
                <asp:label id="DocumentTypeCode" Runat="server" AssociatedControlID="AlternateName"/>     
                <asp:label id="AlternateName" Runat="server"/>   
                (<asp:label id="DocumentStatusCode" Runat="server"/>)     
                <br/>             
                <asp:label id="UpdatedByUserLabel" Runat="server" AssociatedControlID="UpdatedByUser">Updated by:</asp:label>
                <asp:label id="UpdatedByUser" Runat="server"/> <asp:label id="Label1" Runat="server"> on </asp:label> <asp:label id="UpdatedOn" Runat="server"/>            
                <br/>            
                <asp:label id="DescriptionLabel" Runat="server" AssociatedControlID="Description">Description:</asp:label>
                <asp:label id="Description" Runat="server"/>
            </div>
        
            <div id="layout" class="col-xs-3 no-mqs" style="clear:both;">           
                <asp:Literal ID="Preview" runat="server" Visible="true"/>
            </div>

        </div>

    </asiweb:PanelTemplateControl>
</asp:Content>