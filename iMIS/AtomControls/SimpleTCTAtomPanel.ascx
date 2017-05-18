<%@ Control Language="C#"  ClassName="SimpleTCTAtomPanel" Inherits="Asi.Web.UI.AtomPanelBase" %>
<%@ Register TagPrefix="AtomPainter" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<%@ Implements Interface="System.Web.UI.INamingContainer" %>

<script language="C#" runat="server">
override public Guid AtomPanelKey
{
	get{ return new Guid("59ccbe46-6583-4abd-a444-f5b8dd3433ff"); }
}
protected override void OnInit(EventArgs e) 
{ 
	base.OnInit(e);
}
protected override void CreateChildControls() 
{ 
	base.CreateChildControls();
}
</script>
<asp:Panel runat="server" visible="false" id="Panel_NoData">No Data Available</asp:Panel><table>
    <tbody>
        <tr>
            <td colspan="2">&nbsp;<asiweb:businesshyperlink id="BusinessHyperLink1" boundpropertyname="ContentTitle" runat="server" navigateautomatically="true" ignorechildren="true"><a>[Title]</a></asiweb:businesshyperlink><asp:placeholder runat="server" id="ShareThisTaggedListItem"></asp:placeholder> <asiweb:atompanelifblock id="AtomPanelIfBlock1" runat="server" testcomparevalue1="$(panel.PublicationDate)" testcomparetype="NotEmpty" testdatatype="System.DateTime"><span class="IfBlockStart">{</span><asiweb:atompanelifbody runat="server">(<asiweb:businesslabel boundpropertyname="PublicationDate" runat="server" displayvalue="true">[Date of Publication]</asiweb:businesslabel>)</asiweb:atompanelifbody><span class="IfBlockEnd">}</span></asiweb:atompanelifblock>&nbsp;<asiweb:atompanelifblock id="AtomPanelIfBlock2" runat="server" testcomparevalue1="$(panel.IsMemberOnly)" testcomparetype="IsTrue" testdatatype="System.Boolean"><asiweb:atompanelifbody runat="server"><span class="MembersOnlyContent">&nbsp;</span></asiweb:atompanelifbody></asiweb:atompanelifblock><asiweb:atompanelifblock id="AtomPanelIfBlock3" runat="server" testcomparevalue1="$(panel.IsImportant)" testcomparetype="IsTrue" testdatatype="System.Boolean"><asiweb:atompanelifbody runat="server"><span class="ImportantContent">&nbsp;</span></asiweb:atompanelifbody></asiweb:atompanelifblock></td>
        </tr>
        <tr>
            <td style="width: 20px;">&nbsp;</td>
            <td>&nbsp;<asiweb:businesslabel boundpropertyname="Description" runat="server" displayvalue="true">[Description/Summary]</asiweb:businesslabel> </td>
        </tr>
    </tbody>
</table><asp:PlaceHolder id="PlaceHolder_editlink" runat="server"></asp:PlaceHolder>