<%@ Control Language="C#"  ClassName="TestFormatTCTAtomPanel" Inherits="Asi.Web.UI.AtomPanelBase" %>
<%@ Register TagPrefix="AtomPainter" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<%@ Implements Interface="System.Web.UI.INamingContainer" %>

<script language="C#" runat="server">
override public Guid AtomPanelKey
{
	get{ return new Guid("c270eab0-4d65-4d6a-ace9-5bab44a42ed6"); }
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
<asp:Panel runat="server" visible="false" id="Panel_NoData">No Data Available</asp:Panel><asiweb:businesslabel runat="server" boundpropertyname="ContentTitle" displayvalue="false">Title</asiweb:businesslabel> <br />
<asiweb:businesslabel runat="server" boundpropertyname="ContentHtml" displayvalue="false">Html</asiweb:businesslabel> <br />
<asiweb:businesslabel runat="server" boundpropertyname="ContentHtml" displayvalue="true">[Html]</asiweb:businesslabel>
<asiweb:atompanelifblock id="asiweb_AtomPanelIfBlock1" runat="server" testcomparevalue1="$(panel.IsMemberOnly)" testcomparetype="IsTrue" testdatatype="System.Boolean"><asiweb:atompanelifbody runat="server"><span class="MembersOnlyContent">&nbsp;</span></asiweb:atompanelifbody></asiweb:atompanelifblock>  <asiweb:atompanelifblock id="asiweb_AtomPanelIfBlock2" runat="server" testcomparevalue1="$(panel.IsImportant)" testcomparetype="IsTrue" testdatatype="System.Boolean"><asiweb:atompanelifbody runat="server"><span class="ImportantContent">&nbsp;</span></asiweb:atompanelifbody></asiweb:atompanelifblock><asp:PlaceHolder id="PlaceHolder_editlink" runat="server"></asp:PlaceHolder>