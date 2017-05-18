<%@ Control Language="C#"  ClassName="MobileTCTAtomPanel" Inherits="Asi.Web.UI.AtomPanelBase" %>
<%@ Register TagPrefix="AtomPainter" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<%@ Implements Interface="System.Web.UI.INamingContainer" %>

<script language="C#" runat="server">
override public Guid AtomPanelKey
{
	get{ return new Guid("23d41105-782f-40d5-a7f3-471b59689b1e"); }
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
<asp:Panel runat="server" visible="false" id="Panel_NoData">No Data Available</asp:Panel><ul>
    <li>
    <h4><asiweb:businesshyperlink id="BusinessHyperLink1" ignorechildren="true" navigateautomatically="true" runat="server" boundpropertyname="ContentTitle"><a>[Title]</a></asiweb:businesshyperlink>&nbsp;<asiweb:atompanelifblock id="AtomPanelIfBlock1" runat="server" testdatatype="System.Boolean" testcomparetype="IsTrue" testcomparevalue1="$(panel.IsMemberOnly)"><asiweb:atompanelifbody runat="server"><span class="MembersOnlyContent">&nbsp;</span></asiweb:atompanelifbody></asiweb:atompanelifblock><asiweb:atompanelifblock id="AtomPanelIfBlock2" runat="server" testdatatype="System.Boolean" testcomparetype="IsTrue" testcomparevalue1="$(panel.IsImportant)"><asiweb:atompanelifbody runat="server"><span class="ImportantContent">&nbsp;</span></asiweb:atompanelifbody></asiweb:atompanelifblock></h4>
    <asp:placeholder runat="server" id="ShareThisTaggedListItem"></asp:placeholder>
    <asiweb:businesslabel runat="server" boundpropertyname="Description" displayvalue="true">[Description/Summary]</asiweb:businesslabel> </li>
</ul><asp:PlaceHolder id="PlaceHolder_editlink" runat="server"></asp:PlaceHolder>