<%@ Page Language="C#"  AutoEventWireup="true" Inherits="ASI_Controls" Title="ASI Controls Demo/Test Page." Codebehind="ASI_Controls.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Content id="AS_Controls" ContentPlaceHolderID="TemplateBody" runat="Server">
<style type="text/css">
    .PanelField
    {
        background-color: #99CCFF;
    }
    .PanelFieldValue
    {
        background-color: #CCCAAA;
    }
    .StyledButton
    {
    	color: Green;
    	}
</style>

    <h1>Demo/Test Page for ASI Controls</h1>
    <div style="width:700px">
        To easify Visual Testing this page overrides PanelField and PanelFieldValue classes with following background colors:<br />
        PanelField:<span style="color:#99CCFF;"> #99CCFF</span><br />
        PanelFieldValue: <span style="color:#CCCAAA;"> #CCCAAA</span><br />        
        StyledButton Color: <span style="color:green;">GREEN</span><br />        
        <br />
        
        
        <%--ASI - StyledButton--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl10" runat="server" Text="asiweb:StyledBUtton" FieldSet="true" Collapsed="false" >
        StyledButton, Default Behaviour<br />
            <asiweb:StyledButton ID="ASIbtn" runat="server" Text="Test Button" ToolTip="Some Tooltip Text Goes Here"></asiweb:StyledButton><br />
        StyledButton, CSSClass=StyledButton<br />
            <asiweb:StyledButton ID="StyledButton1" runat="server" Text="Test Button" ToolTip="Some Tooltip Text Goes Here" CssClass="StyledButton"></asiweb:StyledButton><br />
        </asiweb:PanelTemplateControl>
        <br />
        
        <%--ASI - Styled Hyperlink--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl7" runat="server" Text="asiweb:StyledHyperlink" FieldSet="true" Collapsed="false" >
        Simple Link, RenderPanelField - False <br />
            <asiweb:StyledHyperlink ID="StyledHyperlink1" runat="server" Text="Link to Google" NavigateUrl="http://www.google.com" RenderPanelField="false" ToolTip="Some Tooltip Text Goes Here"></asiweb:StyledHyperlink><br />
        Simple Link, RenderPanelField - False (IconStyle=Edit).<br />
            <asiweb:StyledHyperlink ID="StyledHyperlink3" IconStyle="Edit" runat="server" Text="Link to Google" NavigateUrl="http://www.google.com" RenderPanelField="false" ToolTip="Some Tooltip Text Goes Here"></asiweb:StyledHyperlink><br />
        Simple Link, RenderPanelField - True.
            <asiweb:StyledHyperlink ID="HyperLink1" runat="server" Text="Link to Google" NavigateUrl="http://www.google.com" ToolTip="Some Tooltip Text Goes Here" RenderPanelField="true"></asiweb:StyledHyperlink><br />
        Simple Link, RenderPanelField - True (IconStyle=Edit).
            <asiweb:StyledHyperlink ID="StyledHyperlink2" IconStyle="Edit" runat="server" Text="Link to Google" RenderPanelField="true" NavigateUrl="http://www.google.com" ToolTip="Some Tooltip Text Goes Here"></asiweb:StyledHyperlink><br />
        </asiweb:PanelTemplateControl>
        <br />
        <%--ASI - Styled Hyperlink as part of SmartControl --%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl7a" runat="server" Text="asiweb:StyledHyperlink as part of SmartControl (BO - WebSite)" FieldSet="true" Collapsed="false" >
            Notes:<br />
            <ul>
                <li>The surf-to-edit button is the StyledHyperlink control.</li>
                <li>The surf-to-edit control is a special case 'icon', so the PanelFieldValue class is not applied to the StyledHyperlink in this case.</li>
            </ul>
            <div style="clear: both;" >URL as Editable Field. Caption on the Left with SurftoEdit Button</div>
            <asiweb:SmartControl ID="SmartControl38" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="EditableField"  PositionCaption="Left" SurfToEditContentCode="Contacts"></asiweb:SmartControl>

            <div style="clear: both;" >URL as Editable Field. Caption on the Right with SurftoEdit Button</div>
            <asiweb:SmartControl ID="SmartControl39" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="EditableField"  PositionCaption="Right" SurfToEditContentCode="Contacts"></asiweb:SmartControl>

            <div style="clear: both;" >URL as Editable Field. Caption on the Bottom with SurftoEdit Button</div>
            <asiweb:SmartControl ID="SmartControl37" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="EditableField"  PositionCaption="Bottom" SurfToEditContentCode="Contacts"></asiweb:SmartControl>

            <div style="clear: both;" >URL as Editable Field. Caption on the Top with SurftoEdit Button</div>
            <asiweb:SmartControl ID="SmartControl40" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="EditableField"  PositionCaption="Top" SurfToEditContentCode="Contacts"></asiweb:SmartControl>
        </asiweb:PanelTemplateControl>
        <br />
        <%--ASI - Business Hyperlink--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl8" runat="server" Text="asiweb:BusinessHyperLink (BO - WebSite)" FieldSet="true" Collapsed="false" >
            RenderPanelField - False, Theming is DISABLED. Link Type: EmailAddress<br />
            <asiweb:BusinessHyperLink ID="BusinessHyperLink1" runat="server"  RenderPanelField="false"   BoundPropertyName="DefaultSectionURL"  LinkType="EmailAddress"></asiweb:BusinessHyperLink><br />
            RenderPanelField - False, Theming is DISABLED. Link Type: Web Link<br />
            <asiweb:BusinessHyperLink ID="BusinessHyperLink2" runat="server"  RenderPanelField="false"   BoundPropertyName="WebsiteRootURL"  LinkType="WebAddress"></asiweb:BusinessHyperLink><br />
            RenderPanelField - True, Link Type: Web Link<br />
            <asiweb:BusinessHyperLink ID="BusinessHyperLink3" runat="server"  BoundPropertyName="WebsiteRootURL"  LinkType="WebAddress" RenderPanelField="true"></asiweb:BusinessHyperLink><br />
            RenderPanelField - True, Link Type: Email Address<br />
            <asiweb:BusinessHyperLink ID="BusinessHyperLink4" runat="server"  BoundPropertyName="DefaultSectionURL"  LinkType="EmailAddress" RenderPanelField="true"></asiweb:BusinessHyperLink><br />
        </asiweb:PanelTemplateControl>
        <br />
        <%--ASI - Business Hyperlink as part of Smart Control --%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl9" runat="server" Text="asiweb:BusinessHyperLink as part of SmartControl (BO - WebSite)" FieldSet="true" Collapsed="false">
            <div style="clear: both;" >URL as Read Only Field</div>
            <asiweb:SmartControl ID="SmartControl31" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>' DisplayType="ReadOnlyField"   ></asiweb:SmartControl>
            
            <div style="clear: both;" >URL as Place Holder</div>
            <asiweb:SmartControl ID="SmartControl32" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>' DisplayType="PlaceHolder" RenderPanelField="false"  ></asiweb:SmartControl>

            <div style="clear: both;" >URL as Read Only Field. Caption on the Left</div>
            <asiweb:SmartControl ID="SmartControl33" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="ReadOnlyField" ></asiweb:SmartControl>

            <div style="clear: both;" >URL as Read Only Field. Caption on the Right</div>
            <asiweb:SmartControl ID="SmartControl34" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="ReadOnlyField"  PositionCaption="Right"></asiweb:SmartControl>
            
            <div style="clear: both;" >URL as Read Only Field. Caption on the Top</div>
            <asiweb:SmartControl ID="SmartControl35" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="ReadOnlyField"  PositionCaption="Top"></asiweb:SmartControl>
        
            <div style="clear: both;" >URL as Read Only Field. Caption on the Bottom</div>
            <asiweb:SmartControl ID="SmartControl36" runat="server" EnableTheming="false" BoundPropertyName="WebsiteRootURL"  BoundAtom='<%# WebSite %>'   DisplayCaption="true" DisplayType="ReadOnlyField"  PositionCaption="Bottom"></asiweb:SmartControl>


        </asiweb:PanelTemplateControl>
        <br />
         <%--ASI Business CheckBox--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" Text="asiweb:BusinessCheckBox" FieldSet="true" Collapsed="true">
            <em>with the Checked and Enabled properties set to true and a label specified in the Text property.</em>
            <hr />
             <div style="clear: both;" >Checkbox1 has TextAlign=Right</div>
            <asiweb:BusinessCheckBox id="businesscheckbox" Checked="true" Enabled="true" Text="Checkbox 1"  runat="server" TextAlign="Right"  />
             <div style="clear: both;" >Checkbox2 has TextAlign=Left</div>
            <asiweb:BusinessCheckBox id="businesscheckbox2" Checked="true" Enabled="true" Text="Checkbox 2"  runat="server" TextAlign="Left" />
        </asiweb:PanelTemplateControl>
        <br />
        <%--    ASI Styled Label--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl2" runat="server" Text="asiweb:StyledLabel" FieldSet="true" Collapsed="true">
             <div style="clear: both;" >RenderPanelField: False</div>
            <asiweb:StyledLabel Text="ASI Styled Label. RenderPanelField=False" ID="StyledLabel1" RenderPanelField="false" runat="server"  /><br />
             <div style="clear: both;" >RenderPanelField: True, DisplayCaption: false (default)</div>
            <asiweb:StyledLabel Text="ASI Styled Label. RenderPanelField=True" ID="StyledLabel2" RenderPanelField="true" runat="server" />
            
            RenderPanelField: True, Caption on the left (default)<br />
            <asiweb:StyledLabel Text="ASI Styled Label. RenderPanelField=True" ID="StyledLabel3" RenderPanelField="true" runat="server" DisplayCaption="true" Caption="Test Caption" />
            RenderPanelField: True, Caption on the right (overridden)<br />
            <asiweb:StyledLabel Text="ASI Styled Label. RenderPanelField=True" ID="StyledLabel4" RenderPanelField="true" runat="server" DisplayCaption="true" Caption="Test Caption" PositionCaption="Right" />
            RenderPanelField: True, Caption on the top (overridden)<br />
            <asiweb:StyledLabel Text="ASI Styled Label. RenderPanelField=True" ID="StyledLabel5" RenderPanelField="true" runat="server" DisplayCaption="true" Caption="Test Caption" PositionCaption="Top" />
            RenderPanelField: True, Caption on the bottom (overridden)<br />
            <asiweb:StyledLabel Text="ASI Styled Label. RenderPanelField=True" ID="StyledLabel6" RenderPanelField="true" runat="server" DisplayCaption="true" Caption="Test Caption" PositionCaption="Bottom" />
        </asiweb:PanelTemplateControl>
        <br />
        <%--ASI BusinessLabel--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl3" runat="server" Text="asiweb:BusinessLabel (BO - PublishServer)" FieldSet="true" Collapsed="true">
             RenderPanelField: False<br />
             <asiweb:BusinessLabel BusinessObjectName="PublishServer" BoundPropertyName="Code" runat="server"
                 ID="BusinessLabel1" RenderPanelField="false" DisplayValue="true" /><br />
             
             RenderPanelField: True, DisplayCaption: false (default)<br />
             <asiweb:BusinessLabel BusinessObjectName="PublishServer" BoundPropertyName="Code"  runat="server" 
                ID="BusinessLabel2" DisplayValue="true" RenderPanelField="true" />
             
             RenderPanelField: True, Caption on the left (default), display default caption<br />
             <asiweb:BusinessLabel BusinessObjectName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessLabel3" DisplayCaption="true" DisplayValue="true" />
             
             RenderPanelField: True, Caption on the left, Caption overridden<br />
             <asiweb:BusinessLabel BusinessObjectName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessLabel4" DisplayCaption="true" Caption="Test Caption" DisplayValue="true" />
             
             RenderPanelField: True, Caption on the right, Caption overridden<br />
             <asiweb:BusinessLabel BusinessObjectName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessLabel5" DisplayCaption="true" Caption="Test Caption" DisplayValue="true" PositionCaption="Right" />
             
             RenderPanelField: True, Caption on the top, Caption overridden<br />
             <asiweb:BusinessLabel BusinessObjectName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessLabel6" DisplayCaption="true" Caption="Test Caption" DisplayValue="true" PositionCaption="Top" />
             
             RenderPanelField: True, Caption on the bottom, Caption overridden<br />
             <asiweb:BusinessLabel BusinessObjectName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessLabel7" DisplayCaption="true" Caption="Test Caption" DisplayValue="true" PositionCaption="Bottom" />
        </asiweb:PanelTemplateControl>
        <br />
        <%-- ASI Business Label as Part of Smart Control (BO - PublishServer) --%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl4" runat="server" Text="asiweb:BusinessLabel as part of Smart Control (BO - PublishServer)" FieldSet="true" Collapsed="true">
            <div style="clear: both;" >Display Type: Caption</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="Caption"  runat="server" ID="SmartControl1" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: Editable Field with Caption. Position: Left</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl2" DisplayCaption="true" PositionCaption="Left" BoundAtom='<%# PublishingServer %>' />

            <div style="clear: both;" >Display Type: Editable Field with Caption. Position: Right</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl3" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: Editable Field with Caption. Position: Top</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl5" DisplayCaption="true" PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: Editable Field with Caption. Position: Bottom</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl4" DisplayCaption="true" PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: Read Only Field with Caption. Position: Left</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="ReadOnlyField"  runat="server" ID="SmartControl6" DisplayCaption="true" PositionCaption="Left" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: Read Only Field with Caption. Position: Right</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="ReadOnlyField"  runat="server" ID="SmartControl7" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: Read Only Field with Caption. Position: Top</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="ReadOnlyField"  runat="server" ID="SmartControl8" DisplayCaption="true" PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: Read Only Field with Caption. Position: Bottom</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="ReadOnlyField"  runat="server" ID="SmartControl9" DisplayCaption="true" PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />
        </asiweb:PanelTemplateControl>   
        <br />
        <%--ASI BusinessTextBox--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl5" runat="server" Text="asiweb:BusinessTextBox (BO - PublishServer)" FieldSet="true" Collapsed="true">
            <div style="clear: both;" >RenderPanelField: False</div>
            <asiweb:BusinessTextBox  AtomComponentName="PublishServer" BoundPropertyName="Code" RenderPanelField="false" runat="server" ID="BusinessTextBox1"  /><br />
            
            <div style="clear: both;" >RenderPanelField: True, No Caption</div>
            <asiweb:BusinessTextBox AtomComponentName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" ID="BusinessTextBox2"/>
            
            <div style="clear: both;" >RenderPanelField: True, Caption on the left (default)</div>
            <asiweb:BusinessTextBox AtomComponentName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessTextBox3" DisplayCaption="true" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >RenderPanelField: True, Caption on the right</div>
            <asiweb:BusinessTextBox AtomComponentName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessTextBox4" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >RenderPanelField: True, Caption on the top</div>
            <asiweb:BusinessTextBox AtomComponentName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessTextBox5" DisplayCaption="true" PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >RenderPanelField: True, Caption on the bottom</div>
            <asiweb:BusinessTextBox AtomComponentName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessTextBox6" DisplayCaption="true" PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />  
            
            <div style="clear: both;" >RenderPanelField: True, Caption on the left, overridden caption</div>
            <asiweb:BusinessTextBox AtomComponentName="PublishServer" BoundPropertyName="Code" RenderPanelField="true" runat="server" 
                ID="BusinessTextBox7" DisplayCaption="true" BoundAtom='<%# PublishingServer %>' Caption="Overriddent caption" />          
        </asiweb:PanelTemplateControl>    
        <br />
        <%--ASI BusinessTextBox as Part of Smart Control--%>
        <asiweb:PanelTemplateControl ID="PanelTemplateControl6" runat="server" Text="asiweb:BusinessTextBox as part of Smart Control (BO - PublishServer)" FieldSet="true" Collapsed="true">
            <div style="clear: both;" >Display Type: EditableField. No Caption</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl10" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Caption on the Left (default)</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl11" DisplayCaption="true" PositionCaption="Left" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Caption on the Right</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl12" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Caption on the Top</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl13" DisplayCaption="true" PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Caption on the Bottom</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl14" DisplayCaption="true" PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: PlaceHolder. Caption on the Left</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="PlaceHolder"  runat="server" ID="SmartControl15" DisplayCaption="true" PositionCaption="Left" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: PlaceHolder. Caption on the Right</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="PlaceHolder"  runat="server" ID="SmartControl16" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: PlaceHolder. Caption on the Top</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="PlaceHolder"  runat="server" ID="SmartControl17" DisplayCaption="true" PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: PlaceHolder. Caption on the Bottom</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="PlaceHolder"  runat="server" ID="SmartControl18" DisplayCaption="true" PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditOnce. Caption on the Left</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditOnce"  runat="server" ID="SmartControl19" DisplayCaption="true" PositionCaption="Left" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditOnce. Caption on the Right</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditOnce"  runat="server" ID="SmartControl20" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditOnce. Caption on the Top</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditOnce"  runat="server" ID="SmartControl21" DisplayCaption="true" PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditOnce. Caption on the Bottom</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditOnce"  runat="server" ID="SmartControl22" DisplayCaption="true" PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Required with Caption on the Left</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl23" DisplayCaption="true" PositionCaption="Left" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Required with Caption on the Right</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl24" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />            
            
            <div style="clear: both;" >Display Type: EditableField. Required with Caption on the Top</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl25" DisplayCaption="true" PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />          
            
            <div style="clear: both;" >Display Type: EditableField. Required with Caption on the Bottom</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl26" DisplayCaption="true" PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />            
            
            <div style="clear: both;" >Display Type: EditableField. Required. Info Icon.Caption on the: Left</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl27" DisplayCaption="true" PositionCaption="Left" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Required. Info Icon.Caption on the: Right</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl28" DisplayCaption="true" PositionCaption="Right" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Required. Info Icon.Caption on the: Top</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl29" DisplayCaption="true"  PositionCaption="Top" BoundAtom='<%# PublishingServer %>' />
            
            <div style="clear: both;" >Display Type: EditableField. Required. Info Icon.Caption on the: Bottom</div>
            <asiweb:SmartControl   AtomComponentName="PublishServer" BoundPropertyName="Code" DisplayType="EditableField"  runat="server" ID="SmartControl30" DisplayCaption="true"  PositionCaption="Bottom" BoundAtom='<%# PublishingServer %>' />
        </asiweb:PanelTemplateControl>    
       
    </div>
</asp:Content>
