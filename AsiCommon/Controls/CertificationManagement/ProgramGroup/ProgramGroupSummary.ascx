<!-- present properties:
ProgramGroupName,ProgramGroupDescription,ProgramGroupStatusCode
-->
<asiweb:PanelTemplateControl ID="TablePanel1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn runat="server" LabelWidth="16em" ValueWidth="50em">
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramGroupName" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramGroupDescription" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramGroupStatusCode" DisplayCaption="true" DisplayType="ReadOnlyField"/>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
