<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SolicitationsList" Codebehind="SolicitationsList.ascx.cs" %>
<%@Register TagName="SolicitationListItem" TagPrefix="asiweb" Src="~/asicommon/controls/campaignmanagement/solicitationlistitem.ascx" %>

<script type="text/javascript">
    var collapsedImageSrc = '<%#Asi.Web.Utilities.GetIconPath(Asi.Web.Utilities.IconStyle.Expand)%>';
    var expandedImageSrc = '<%#Asi.Web.Utilities.GetIconPath(Asi.Web.Utilities.IconStyle.Collapse)%>';
    var appealsShown = false;
    var sourceCodesShown = false;
    var solicitationsShown = true;
    var imageHtml = "<img src='{0}' border='0' />";
    function ToggleAllSourceCodes()
    {
        var AppealsTable = document.getElementById("AppealsTable");
        for(var i = 0; i<AppealsTable.rows.length;i++)
        {
            var itemRow = AppealsTable.rows[i];
            for (var j = 0; j < itemRow.cells[0].childNodes.length; j++) 
            {
                var child = itemRow.cells[0].childNodes[j];
                if (child.id == "sourcecoderow" && child.value == "1") 
                {
                    if (sourceCodesShown)
                        itemRow.style.display = "none";
                    else
                        itemRow.style.display = "table-row";
                }   
            }
        }
      
        var SourceCodeHeader = document.getElementById("SourceCodeHeader");
        if(sourceCodesShown)       
           SourceCodeHeader.style.display = "none";                 
        else       
            SourceCodeHeader.style.display = "table-row";
                 
        sourceCodesShown = !sourceCodesShown;
    
    }
    function ToggleAllSolicitations()
    {
        var AppealsTable = document.getElementById("AppealsTable");
        var SolicitationsHeader = document.getElementById("SolicitationsHeader");
        for(var i = 0; i<AppealsTable.rows.length;i++)
        {
            var itemRow = AppealsTable.rows[i];
            for (var j = 0; j < itemRow.cells[0].childNodes.length; j++) 
            {
                var child = itemRow.cells[0].childNodes[j];
                if (child.id == "solicitationrow" && child.value == "1") 
                {
                    if (solicitationsShown) 
                    {
                        itemRow.style.display = "none";
                        SolicitationsHeader.style.display = "none";
                    }
                    else 
                    {
                        itemRow.style.display = "table-row";
                        SolicitationsHeader.style.display = "table-row";
                    }
                }
            }
        }
        solicitationsShown=!solicitationsShown;
    }
    function ToggleAllAppeals()
    {
        var AppealsTable = document.getElementById("AppealsTable");
        for(var i = 0; i<AppealsTable.rows.length;i++)
        {
            var itemRow = AppealsTable.rows[i];
            for (var j = 0; j < itemRow.cells[0].childNodes.length; j++) 
            {
                var child = itemRow.cells[0].childNodes[j];
                if (child.id == "appealrow" && child.value == "1") 
                {
                    if (appealsShown)
                        itemRow.style.display = "none";
                    else
                        itemRow.style.display = "table-row";
                }      
            }
        }
        appealsShown = !appealsShown;
    }
    function ToggleSourceCodes(solicitationkey)
    {
        var AppealsTable = document.getElementById("AppealsTable");
        var link = document.getElementById(solicitationkey + "Link");
        var collapsed = document.getElementById(solicitationkey+"Collapsed");
        var isCollaped = collapsed.value == "1" ? true : false;
        // get all the rows
        for(var i = 0; i<AppealsTable.rows.length;i++)
        {
            var itemRow = AppealsTable.rows[i];
            for (var j = 0; j < itemRow.cells[0].childNodes.length; j++) 
            {
                var child = itemRow.cells[0].childNodes[j];
                if (child.id == "solicitationkey" && child.value == solicitationkey) 
                {
                    if (isCollaped) 
                    {
                        itemRow.style.display = "table-row";
                        collapsed.value = 0;
                        link.innerHTML = imageHtml.replace("{0}", expandedImageSrc);
                        link.title = "<%#GetTranslatedPhrase("Hide Source Codes for this Solicitation")%>";
                        // Show the Header
                        sourceCodesShown = true;
                        var SourceCodeHeader = document.getElementById("SourceCodeHeader");
                        SourceCodeHeader.style.display = "table-row";                       
                    }
                    else 
                    {
                        itemRow.style.display = "none";
                        collapsed.value = 1;
                        link.innerHTML = imageHtml.replace("{0}", collapsedImageSrc);
                        link.title = "<%#GetTranslatedPhrase("Show Source Codes for this Solicitation")%>";   
                        // are any source code rows shown? 
                    }
                }
            }
        }     
     }
   
    function ToggleSolicitations(appealKey)
    {
        var AppealsTable = document.getElementById("AppealsTable");
        var appealLink = document.getElementById(appealKey + "Link");
        var collapsed = document.getElementById(appealKey + "Collapsed");
        var isCollaped = collapsed.value == "1" ? true : false;
        appealLink.style.border = "0";
        // hack 
        // for some reason, you can't send the link as this...
        // setting innerHTML doesn't work then, so we'll just get it by id
        // get all the rows
        for(var i = 0; i<AppealsTable.rows.length;i++)
        {
            var itemRow = AppealsTable.rows[i];
            for (var j = 0; j < itemRow.cells[0].childNodes.length; j++) 
            {
                var child = itemRow.cells[0].childNodes[j];
                if (child.id == "appealkey" && child.value == appealKey) 
                {
                    if (isCollaped) 
                    {
                        itemRow.style.display = "table-row";
                        collapsed.value = 0;
                        appealLink.innerHTML = imageHtml.replace("{0}", expandedImageSrc);
                        appealLink.title = "<%#GetTranslatedPhrase("Hide Solicitations for this Appeal")%>";                       
                    }
                    else 
                    {
                        itemRow.style.display = "none";
                        collapsed.value = 1;
                        appealLink.innerHTML = imageHtml.replace("{0}", collapsedImageSrc);
                        appealLink.title = "<%#GetTranslatedPhrase("Show Solicitations for this Appeal")%>";
                    }
                }
            }
        }              
    }
</script>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Campaign Structure" Collapsible="false">

    <div class="CommandBar" style="padding-bottom:0.6em;">
        <asiweb:StyledButton runat="server" AutoPostBack="false" OnClientClick="ToggleAllAppeals()" Text="Show / Hide Appeals" />
        <asiweb:StyledButton runat="server" AutoPostBack="false" OnClientClick="ToggleAllSolicitations()" Text="Show / Hide Solicitations" />
        <asiweb:StyledButton runat="server" AutoPostBack="false" OnClientClick="ToggleAllSourceCodes()" Text="Show / Hide Source Codes" />
    </div>

    <asp:Repeater runat="server" DataSource="<%#GetAppeals()%>" ID="AppealsRepeater">
        <HeaderTemplate>
            <table id="AppealsTable" class="ExpGrid" style="border:0;width:100%">
                <tr class="ExpGridHeader" id="SolicitationsHeader">
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th nowrap><%#GetTranslatedPhrase("Name")%></th>
                    <th nowrap><%#GetTranslatedPhrase("Total Revenue")%></th>
                    <th nowrap><%#GetTranslatedPhrase("Target Revenue")%></th>
                    <th nowrap><%#GetTranslatedPhrase("Overhead Cost")%></th>
                    <th nowrap><%#GetTranslatedPhrase("ROI %")%></th>
                    <th nowrap><%#GetTranslatedPhrase("Start Date")%></th>
                    <th nowrap><%#GetTranslatedPhrase("End Date")%></th>
                    <th nowrap><%#GetTranslatedPhrase("Status")%></th>
                 </tr>
              
                <tr id="SourceCodeHeader" class="ExpGridHeaderSourceCode" style="display:none;">
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <!--
                    <td colspan="8" style="border-right: #999999 thin solid;border-left: #999999 thin solid;">
                    <table class="PanelTableSub" width="100%">
                    <tr class="PanelTableSubHeader">
                    -->                              
                    <td nowrap><%#GetTranslatedPhrase("Code")%></td>
                    <td colspan="2"><%#GetTranslatedPhrase("Segments")%></td>
                    <td nowrap><%#GetTranslatedPhrase("1st Resp")%></td>
                    <td nowrap><%#GetTranslatedPhrase("Last Drop")%></td>
                    <td nowrap><%#GetTranslatedPhrase("Type")%></td>
                    <td nowrap><%#GetTranslatedPhrase("Member Type")%></td>                                
                    <td nowrap><%#GetTranslatedPhrase("Status")%></td>
                </tr>              
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="ExpGridRow1" style="display:none;">
                <td>
                    <input type="hidden" id="appealrow" value="1" />
                    <input type="hidden" id="<%#Eval("AppealKey","{0}Collapsed")%>" value="1" />
                    <a href='<%#Eval("AppealKey","javascript:ToggleSolicitations(\"{0}\");")%>' id='<%#Eval("AppealKey","{0}Link")%>' title='<%#GetTranslatedPhrase("Hide Solicitations for this Appeal")%>' >
                       <script type="text/javascript">document.write(imageHtml.replace("{0}",appealsShown?collapsedImageSrc:expandedImageSrc));</script>
                    </a>
                </td>              
                <td colspan="9">
                    <asp:Panel runat="server" ID="CampaignContainer"></asp:Panel>
                </td>
            </tr>
            <asp:Repeater runat="server" ID="SolicitationsRepeater">
                <ItemTemplate>
                    <asiweb:SolicitationListItem runat="server" ID="SolicitationListItem" />
                </ItemTemplate>        
            </asp:Repeater>
        </ItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        </asp:Repeater>
    
</asiweb:PanelTemplateControl2>