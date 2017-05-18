<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="CommunicationCreatorDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Communications.CommunicationCreator.CommunicationCreatorDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<%@ Register Src="CommunicationCreatorAdditionalDataSources.ascx" TagPrefix="uc1" TagName="CommunicationCreatorAdditionalDatasources" %>
<%@ Register Src="CommunicationCreatorDatasource.ascx" TagPrefix="uc2" TagName="CommunicationCreatorDatasource" %>
<%@ Register Src="CommunicationCreatorComposer.ascx" TagPrefix="uc3" TagName="CommunicationCreatorComposer" %>


<%-- 
We declare an instance of each of the child control, and we just hide/show the one we want.
We have a button on this page that allows us to switch between composer and datasource mode.
We can't easily write code to just load the relevant control because we first have to wait for the button event handler to run.
Events fire after Page.OnLoad has run, at which point its a bit too late to be loading and adding controls.
You can load and add controls after OnLoad (i.e. in OnPreRender) but it means you can't have any controls in them
with server side events because those events won't get wired up. Annoying page lifecycle stuff.
Essentially events fire directly after Page.OnLoad and if the controls haven't been created by then, they ain't gonna fire.
http://msdn.microsoft.com/en-us/library/ms178472.aspx
A way around this would be to have a hidden field on the page that contains a value telling us what mode to switch to.
Javascript would set this hidden field with the new mode, then do a postback.
We could then load the value of that hidden field in OnLoad and load the relevant control.
The downside of this is that it makes it harder to run any validation code server side for the control we are moving away from.
For now i'm leaving both controls in place.
--%>
<div runat="server" id="DivAdditionalDataSources">
    <uc1:CommunicationCreatorAdditionalDatasources runat="server" ID="CommunicationCreatorAdditionalDataSources" />
</div>
<div runat="server" id="DivComposer">
    <uc3:CommunicationCreatorComposer runat="server" ID="CommunicationCreatorComposer" />
</div>
<div runat="server" id="DivDatasource">
    <uc2:CommunicationCreatorDatasource runat="server" ID="CommunicationCreatorDatasource" />
</div>
<br />
