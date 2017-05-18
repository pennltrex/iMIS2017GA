<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_Groups_GroupsList" Codebehind="GroupsList.ascx.cs" %>
<asiweb:Lister2 runat="server" AjaxEnabled="true"
    ID="GroupsLister"
    DataSourceDocumentPath="$/Common/Queries/Utility/GroupList"
    TargetUrl="~/AsiCommon/Controls/Shared/Groups/SetupGroups.aspx"
    TargetUrlKeyParameterName="iUniformKey" 
    UseUniformKey="true"
    SelectMode="true" 
    Title=""
    MinimumQueryRepeatTime="400"
    AllowNaturalSort="false" />
<%-- 
Note, these are Hidden fields (as opposed to values in Viewstate because 
they are sometimes needed by Lister2 before viewstate gets populated
--%>
<asp:HiddenField runat="server" ID="SystemEntityKeyHidden" />
<asp:HiddenField runat="server" ID="GroupTypeKeyHidden" />
<asp:HiddenField runat="server" ID="SelectFromListerDocumentPath" />
			