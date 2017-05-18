<%@ Control Language="C#"  ClassName="BlockTaggedListTCTAtomPanel" Inherits="Asi.Web.UI.AtomPanelBase" %>
<%@ Register TagPrefix="AtomPainter" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<%@ Implements Interface="System.Web.UI.INamingContainer" %>

<script language="C#" runat="server">
override public Guid AtomPanelKey
{
	get{ return new Guid("2e3438f1-4e96-4bfb-8036-f0eeb5e13100"); }
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
<asp:placeholder runat="server" id="ShareThisTaggedListItem"></asp:placeholder>
<p><span class="PublishDate">Posted on <asiweb:businesslabel runat="server" boundpropertyname="PublicationDate" displayvalue="true">[Date of publication]</asiweb:businesslabel></span><br />
<asiweb:businesslabel runat="server" displayvalue="true" boundpropertyname="Description">[Description/Summary]</asiweb:businesslabel></p>
</div><asp:PlaceHolder id="PlaceHolder_editlink" runat="server"></asp:PlaceHolder>