<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelCollectionEditorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelCollectionEditorConfigEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl2 ID="contactUserDefinedPanelsEdit" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
       
    <div id="availableWindowsErrorDiv" style="padding-left:160px;float:left;width:600px;" visible="false" runat="server">
        <asp:Label ID="availableWindowsError" runat="server" CssClass="Error" Visible="false"/>
    </div>
              
    <div class="AutoWidth">
        <asiweb:SmartControl ID="addAllWindows" runat="server" BoundPropertyName="AddAllWindows" DisplayCaption="true" AutoPostBack="true"
        DataSaveUponStateChange="false" />       
    </div>
    
    <div id="collapsedByDefaultDiv" style="padding-left:25px;padding-bottom:10px;width:500px;" runat="server"> 
    
        <asiweb:MultiSelectControl2 id="windowSelector" Height="200px" Width="250px" AllowReorder="true" runat="server" />
        
        <asp:Label ID="selectedWindowsError" runat="server" CssClass="Error" Visible="false"></asp:Label>
        
    </div>

    <div class="AutoWidth">
        <div id="MultiInstancePropertiesDiv" runat="server" class="ShowFieldset" >
                <label><%=ResourceManager.GetPhrase("MultiInstancePanelOptions", "Multi-Instance Panel Options") %></label>
                <asiweb:SmartControl ID="ScrollingGridEnabled" runat="server" BoundPropertyName="ScrollingGridEnabled" DisplayCaption="true" PositionCaption="Right"
                    AutoPostBack="true" DataSaveUponStateChange="false" style="padding-left:30px"/>
                <div id="gridSizeDiv" runat="server" style="padding-left:30px">
                    <asiweb:SmartControl ID="ScrollingGridWidth" runat="server" BoundPropertyName="ScrollingGridWidth" DisplayCaption="True" 
                        DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" style="padding-left:20px"/>
                    <asiweb:SmartControl ID="ScrollingGridHeight" runat="server" BoundPropertyName="ScrollingGridHeight" DisplayCaption="True" 
                        DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" style="padding-left:20px"/>
                <asiweb:SmartControl ID="ScrollingCellsEnabled" runat="server" BoundPropertyName="ScrollingCellsEnabled" DisplayCaption="true" PositionCaption="Right"
                    AutoPostBack="false" DataSaveUponStateChange="false" />
                <asiweb:SmartControl ID="allowDelete" runat="server" BoundPropertyName="AllowDelete" DisplayCaption="true" PositionCaption="Right" 
                    DataSaveUponStateChange="false" />
                </div>
     </div>
    </div> 
                    
    <div class="AutoWidth">
        <asiweb:SmartControl ID="allowEdit" runat="server" BoundPropertyName="AllowEdit" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" 
        DataSaveUponStateChange="false" />
        <div id="editAllowedPropertiesDiv" runat="server" style="padding-left:20px">
           <div id="defaultEditDiv" runat="server"> 
                <asiweb:SmartControl ID="defaultEdit" runat="server" BoundPropertyName="DefaultEditMode" DisplayCaption="true" PositionCaption="Right"
                AutoPostBack="True" DataSaveUponStateChange="false" />
                <asiweb:SmartControl ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" DisplayCaption="true" PositionCaption="Left" 
                AutoPostBack="False" DataSaveUponStateChange="false" MinValue="0" /> 
           </div>
           <asiweb:SmartControl ID="editWindowWidth" runat="server" BoundPropertyName="EditWindowWidth" DisplayCaption="True" 
            DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
            <asiweb:SmartControl ID="editWindowHeight" runat="server" BoundPropertyName="EditWindowHeight" DisplayCaption="True"
            DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
        </div>
    </div>
             
</asiweb:PanelTemplateControl2>