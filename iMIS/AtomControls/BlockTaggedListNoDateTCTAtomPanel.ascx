<%@ Control Language="C#"  ClassName="BlockTaggedListNoDateTCTAtomPanel" Inherits="Asi.Web.UI.AtomPanelBase" %>
<%@ Register TagPrefix="AtomPainter" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<%@ Implements Interface="System.Web.UI.INamingContainer" %>

<script language="C#" runat="server">
override public Guid AtomPanelKey
{
	get{ return new Guid("76dc2a14-eb87-4f4a-adbb-36218ad27518"); }
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
<asp:Panel runat="server" visible="false" id="Panel_NoData">No Data Available</asp:Panel><div class="BlockTLItem">
<h4><asiweb:businesshyperlink id="BusinessHyperLink1" boundpropertyname="ContentTitle" runat="server" navigateautomatically="true" ignorechildren="true"><a>[Title]</a></asiweb:businesshyperlink></h4>
<p>
<asiweb:businesslabel runat="server" displayvalue="true" boundpropertyname="Description">[Description/Summary]</asiweb:businesslabel></p>
</div><asp:PlaceHolder id="PlaceHolder_editlink" runat="server"></asp:PlaceHolder>