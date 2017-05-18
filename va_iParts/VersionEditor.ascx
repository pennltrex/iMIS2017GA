<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="Controls_VersionEditor" Codebehind="VersionEditor.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<style type="text/css">
    .modalBackground
    {
        background-color: Gray;
        filter: alpha(opacity=80);
        opacity: 0.8;
    }
    .modalPopup
    {
        background-color: #ffffdd;
        border-width: 1px;
        -moz-border-radius: 5px;
        border-style: solid;
        border-color: Gray;
        min-width: 500px;
        max-height: 650px;
        overflow: auto;
    }
    .ScrollableWindow
    {
        max-height: 400px;
        overflow: auto;
    }
</style>
<%--<asp:ScriptManager runat="server">
</asp:ScriptManager>--%>
<script type="text/javascript">

    function fnClickOK(sender, e) {
        __doPostBack(sender, e);
    }

    function htmlEncode(str) {
        // This must be done in a proper order to achive desired results.
        str = this.replaceAll(str, "&", "&amp;");
        str = this.replaceAll(str, "<", "&lt;");
        str = this.replaceAll(str, ">", "&gt;");

        return str;
    }

    function GetEncoded(txt1, txt2) {
        var text1 = document.getElementById(txt1);
        if (text1 != null) {
            text1.value = htmlEncode(text1.value);
        }
        var text2 = document.getElementById(txt2);
        if (text2 != null) {
            text2.value = htmlEncode(text2.value);
        }
    }


    //    function uploadError(sender, args) {
    //        document.getElementById('lblStatus').innerText = args.get_fileName(),
    //	"<span style='color:red;'>" + args.get_errorMessage() + "</span>";
    //    }

    //    function StartUpload(sender, args) {
    //        document.getElementById('lblStatus').innerText = 'Uploading Started.';
    //    }

    //    function UploadComplete(sender, args) {
    //        var filename = args.get_fileName();
    //        var contentType = args.get_contentType();
    //        var text = "Size of " + filename + " is " + args.get_length() + " bytes";
    //        if (contentType.length > 0) {
    //            text += " and content type is '" + contentType + "'.";
    //        }
    //        document.getElementById('lblStatus').innerText = text;
    //    }

</script>
<style type="text/css">
    thead
    {
        font-weight: bold;
    }
    
    /* Table hover style */
    .main tr th
    {
        background-color: #dadada;
        font-weight: bold;
    }
    
    /* Table odd rows style */
    .main tr:nth-child(odd)
    {
        background-color: #ffffff;
    }
    
    /* Table even rows style */
    .main tr:nth-child(even)
    {
        background-color: #efefef;
    }
    
    /* Table hover style */
    .main tr:hover
    {
        background-color: #dadada;
    }
    
    
    .nomain tr th
    {
        background-color: #dadada;
        font-weight: bold;
    }
    
    /* Table odd rows style */
    .nomain tr:nth-child(odd)
    {
        background-color: white;
    }
    
    /* Table even rows style */
    .nomain tr:nth-child(even)
    {
        background-color: white;
    }
    
    /* Table hover style */
    .nomain tr:hover
    {
        background-color: white;
    }
    .NotResizable
    {
        resize: none;
    }
    .style1
    {
        height: 34px;
    }
    div .MainForm
    {
        background: url("/imismain10/images/section_bg.png") repeat scroll 0 0;
        border: 1px solid #F4F4F4;
        box-shadow: 0 0 10px #C4C4C4;
        margin: 10px auto 10px;
        overflow: hidden;
        padding: 15px 15px 25px 15px;
        width: 900px;
    }
</style>
<div class="MainForm">
    <h3>
        Version Editor</h3>
    <table style="width: 100%" border="0">
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td style="text-align: right" class="style1">
                <asp:Button ID="btnBack" runat="server" Text="Back to Versions List" OnClick="btnBackClick" />&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lblCultureTitle" runat="server" Text="Culture: " Font-Bold="true" />
            </td>
            <td>
                <asp:Label ID="lblCulture" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lblVersionTitle" runat="server" Text="Version: " Font-Bold="true" />
            </td>
            <td>
                <asp:Label ID="lblVersion" runat="server" />
            </td>
        </tr>

        <tr>
            <td style="width: 20%">
                <asp:Label ID="lblPhrasesTitle" runat="server" Text="Phrases: " Font-Bold="true" />
            </td>
            <td>
                <asp:Label ID="lblPhrases" runat="server" />&nbsp;&nbsp;
                <asp:Label ID="lblLivePhrases" runat="server" />&nbsp;&nbsp;
                <asp:LinkButton ID="lbtnRefreshList" runat="server" Text="Update from Live Version" OnClick="lbtnRefreshListClick" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <ajax:TabContainer runat="server"  ActiveTabIndex="1">
                    <ajax:TabPanel runat="server"  HeaderText="Filter" ID="tpFilter" Width="100%"
                        Enabled="true" ScrollBars="Auto" OnDemandMode="Once">
                        <ContentTemplate>
                            <table style="width:100%; border: 1px solid black; border-spacing: 6px; border-collapse: separate ">
                                <tr>
                                    <td style="width: 35%; border: 1px solid black; padding: 4px;">
                                         <asp:RadioButtonList ID="rblShow" runat="server" OnSelectedIndexChanged="rblShowSelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="0" Text="Show All" Selected="True" />
                                            <asp:ListItem Value="1" Text="Show Only New" />
                                        </asp:RadioButtonList>
                                    </td>
                                    <td style="border: 1px solid black; padding: 4px;">    
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtSearchBox" runat="server" Columns="50" />&nbsp;&nbsp;
                                                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                                </td>
                                            </tr>
                                            <tr id="trSearchCriteria" runat="server" visible="False">
                                                <td>
                                                    <asp:Label ID="lblSearchCriteria" runat="server" />&nbsp;&nbsp;
                                                    <asp:LinkButton ID="lbtnRemoveSearchCriteria" runat="server" Text="Remove" OnClick="lbtnRemoveSearchCriteria_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                               </tr>
                            </table>
                        </ContentTemplate>
                    </ajax:TabPanel>
                    <ajax:TabPanel runat="server" HeaderText="Import/Export" ID="tpExport" 
                        Enabled="true" ScrollBars="Auto" OnDemandMode="Once">
                        <ContentTemplate>
                            <table style="width:100%; border: 1px solid black; margin: 2px; padding: 2px;">
                                <tr>
                                    <td>
                                        <asp:Button ID="lbtnExportExcel" runat="server" Text="Export Phrases to Excel" OnClick="lbtnExportExcel_Click" />&nbsp;
                                        <asp:Button ID="lbtnImportExcel" runat="server" Text="Import Phrases from Excel" OnClick="lbtnImportExcelClick" />
                                    </td>
                               </tr>    
                            </table>
                        </ContentTemplate>
                    </ajax:TabPanel>
                    
                </ajax:TabContainer>
                
                
            </td>
        </tr>
        
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblList" runat="server" Text="List of phrases for this version:" Font-Bold="true" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
               
            </td>
        </tr>

        <%--<tr>
            <td colspan="2" style="text-align: right;">
                <asp:Button ID="btnNew" runat="server" Text="New Translation" OnClick="btnNewClick" />
            </td>
        </tr>--%>
        <tr>
            <td style="text-align: left">
                <asp:LinkButton ID="lbtnPrevious" runat="server" Text="Previous" OnClick="lbtnPreviousClick" />&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lbtnNext" runat="server" Text="Next" OnClick="lbtnNextClick"  />
            </td>
            <td style="text-align: right">
                <asp:Label ID="lblTotalRows" runat="server" Font-Bold="true" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ListView ID="lvVersionPhrases" runat="server"
                    DataKeyNames="PhraseKey" 
                    OnItemDataBound="lvVersionPhrasesOnItemDataBound" 
                    OnItemEditing="lvVersionPhrasesEditing" OnItemUpdating="lvVersionPhrasesUpdating"
                    OnItemCanceling="lvVersionPhrasesCanceling" OnItemInserting="lvVersionPhrasesInserting"
                    OnItemCreated="lvVersionPhrasesItemCreated" OnItemDeleting="lvVersionPhrasesDeleting">
                    <LayoutTemplate>
                        <div class="AltRow">
                            <table class="main" style="border: 1px solid black; padding: 3px;width: 100%;
                                text-align: center; border-spacing: 0px;">
                                <tr bgcolor="#EBEBEB">
                                    <th style="text-align: left; width: 33%;">
                                        <asp:Label ID="lblPhraseHeader" runat="server" Text="Phrase" />
                                    </th>
                                    <th style="text-align: left; width: 33%;">
                                        <asp:Label ID="lblPhraseTranslatedHeader" runat="server" Text="&nbsp;" /> <!-- 09/01/2013 removed Translated Phrase -->
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblUpdatedHeader" runat="server" Text="Updated" />
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblUpdatedByHeader" runat="server" Text="Updated By" />
                                    </th>
                                    <th style="text-align: center;"> <!-- 08/30/2013 -->
                                        <asp:Label ID="lblIsPhrase" runat="server" Text="Is Phrase" />
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblActionsHeader" runat="server" Text="Actions" />
                                    </th>
                                </tr>
                                <tr id="ItemPlaceHolder" runat="server" />
                            </table>
                        </div>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <table class="main" border="1 solid black" cellpadding="3" cellspacing="0" style="width: 100%;
                            text-align: center;">
                            <tr bgcolor="#EBEBEB">
                                <th style="text-align: left; width: 35%;">
                                    <asp:Label ID="lblPhraseTitle" runat="server" Text="Phrase" />
                                </th>
                                <th style="text-align: left; width: 35%;">
                                    <asp:Label ID="lblPhraseTranslatedTitle" runat="server" Text="Translated Phrase" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblUpdatedTitle" runat="server" Text="Updated" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblUpdatedByTitle" runat="server" Text="Updated By" />
                                </th>
                                <th style="text-align: center;"> <!-- 08/30/2013 -->
                                    <asp:Label ID="lblIsPhrase" runat="server" Text="Is Phrase" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblActionsTitle" runat="server" Text="Actions" />
                                </th>
                            </tr>
                            <tr>
                                <td colspan="5" style="text-align: left">
                                    Empty List
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="text-align: left;">                                
                                <asp:TextBox ID="txtPhrase" runat="server" Text='<%# GetContent((string)Eval("Phrase"))  %>'
                                    CssClass="NotResizable" Wrap="true" Rows="3" ReadOnly="true" TextMode="MultiLine"
                                    BorderStyle="None" BorderWidth="0" Enabled="false" Columns="30" />
                            </td>
                            <td style="text-align: left;">
                                <br />Translated Phrase:<br />
                                <asp:TextBox ID="txtPhraseTranslated" runat="server" Text='<%#  System.Web.HttpUtility.HtmlDecode(GetContent((string)Eval("TranslatedPhrase"))) %>'
                                    CssClass="NotResizable" Wrap="true" Rows="3" ReadOnly="true" TextMode="MultiLine"
                                    BorderStyle="None" BorderWidth="0" Enabled="false" Columns="30" />
                                
                                <!-- 09/01/2013 added Description and Control Type-->
                                <br />Description:<br />
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%#  System.Web.HttpUtility.HtmlDecode(GetContent((string)Eval("Description"))) %>'
                                    CssClass="NotResizable" Wrap="true" Rows="3" ReadOnly="true" TextMode="MultiLine"
                                    BorderStyle="None" BorderWidth="0" Enabled="false" Columns="30" />
                                <br />Control Type:<br />
                                <asp:TextBox ID="txtControlType" runat="server" Text='<%#  System.Web.HttpUtility.HtmlDecode(GetContent((string)Eval("ControlType"))) %>'
                                    CssClass="NotResizable" Wrap="true" Rows="3" ReadOnly="true" TextMode="MultiLine"
                                    BorderStyle="None" BorderWidth="0" Enabled="false" Columns="30" />
                            </td>
                            <td style="text-align: center; vertical-align:top">
                                <asp:Label ID="lblUpdated" runat="server" Text='<%# ((DateTime)Eval("Updated")).ToString("MMM dd,yyyy hh:mm ") %>' />
                            </td>
                            <td style="text-align: center;vertical-align:top">
                                <asp:Label ID="lblUpdatedBy" runat="server" Text='<%# (string)Eval("UpdatedBy") %>' />
                            </td>
                            <td style="text-align: center;vertical-align:top"> <!-- 08/30/2013 -->
                                <asp:Label ID="lblDoNotLocalize" runat="server" Text='<%# Eval("DoNotLocalize").ToString() %>' />
                            </td>
                            <td style="text-align: left;">
                                <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" CommandName="Edit" />&nbsp;
                                <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" CommandName="Delete" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: White">
                            <td colspan="5">
                                <table class="nomain" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center;
                                    border: 1px solid black;">
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblVersionKeyTitle" runat="server" Text="Phrase Key" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left" colspan="3">
                                            <asp:Label ID="lblVersionKey" runat="server" Text='<%# Bind("PhraseKey") %>' />
                                        </td>
                                        <th rowspan="5" style="vertical-align: top; text-align: center">
                                            <asp:LinkButton ID="lbtnUpdate" runat="server" Text="Update" CommandName="Update" />&nbsp;&nbsp;
                                            <asp:LinkButton ID="lbtnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblPhraseTitle" runat="server" Text="Original Phrase" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtPhrase" runat="server" Text='<%# Bind("Phrase") %>' TextMode="MultiLine"
                                                Rows="6" Columns="30" ReadOnly="true" ValidateRequestMode="Disabled" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblTranslatedPhraseTitle" runat="server" Text="Translated Phrase" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtTranslatedPhrase" runat="server" Text='<%# System.Web.HttpUtility.HtmlDecode((string)Eval("TranslatedPhrase")) %>'
                                                TextMode="MultiLine" Rows="6" Columns="30" ValidateRequestMode="Disabled" />
                                        </td>
                                    </tr>
                                    <tr> <!-- 09/01/2013 add control type and description -->
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblControlType" runat="server" Text="Control Type" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtControlType" runat="server" Text='<%# Eval("Description").ToString() %>' TextMode="MultiLine" Rows="2" Columns="30" ReadOnly="true" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblDescription" runat="server" Text="Description" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# System.Web.HttpUtility.HtmlDecode((string)Eval("Description")) %>'
                                                TextMode="MultiLine" Rows="6" Columns="30" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblStatusHeader" runat="server" Text="Status" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:HiddenField ID="hfStatusID" runat="server" Value='<%# Bind("StatusID") %>' />
                                            <asp:DropDownList ID="ddlStatuses" runat="server" />
                                        </td>
                                        <th>&nbsp;</th>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblUpdatedByHeader" runat="server" Text="Updated By" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:Label ID="lblUpdatedBy" runat="server" Text='<%# Eval("UpdatedBy") %>' />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblUpdatedHeader" runat="server" Text="Updated On" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:Label ID="lblUpdated" runat="server" Text='<%# Eval("Updated") %>' />
                                        </td>
                                    </tr>
                                    <tr> <!-- 08/30/2013 - added -->
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="Label1" runat="server" Text="Is Phrase" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:CheckBox ID="chkDoNotLocalize" runat="server" Checked='<%# (bool)Eval("DoNotLocalize")%>' />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">&nbsp</th>
                                        <td style="vertical-align: top; text-align: left">&nbsp</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <%--<InsertItemTemplate>
                        <tr style="background-color: White">
                            <td colspan="7">
                                <table class="nomain" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center;
                                    border: 1px solid black;">
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="Label1" runat="server" Text="Version Key" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left" colspan="3">
                                            <asp:Label ID="Label2" runat="server" Text="<New>" />
                                        </td>
                                        <th rowspan="3" style="vertical-align: top; text-align: center">
                                            <asp:LinkButton ID="lbtnSave" runat="server" Text="Save" CommandName="Insert" />&nbsp;&nbsp;
                                            <asp:LinkButton ID="lbtnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblPhraseTitle" runat="server" Text="Original Phrase" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtPhrase" runat="server" TextMode="MultiLine" Rows="6" Columns="30" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblTranslatedPhraseTitle" runat="server" Text="Translated Phrase" />
                                        </th>
                                        <th style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtTranslatedPhrase" runat="server" TextMode="MultiLine" Rows="6"
                                                Columns="30" />
                                        </th>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </InsertItemTemplate>--%>
                </asp:ListView>
            </td>
        </tr>
    </table>
</div>
<div>
    <%--<ajax:ModalPopupExtender ID="mpext" runat="server" BackgroundCssClass="modalBackground"
        TargetControlID="btnPopup" PopupControlID="pnlPopup" OkControlID="btnOk" CancelControlID="btnNo">
    </ajax:ModalPopupExtender>
    <asp:Button ID="btnPopup" runat="server" Text="Download" Style="display: none;" />
    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none;"
        DefaultButton="btnOk">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ibtnGetPhrase" />
                <asp:PostBackTrigger ControlID="btnOk" />
            </Triggers>
            <ContentTemplate>
                <table style="width: 100%; padding: 3px; border-spacing: 2px;">
                    <tr class="topHandle">
                        <td align="left" runat="server" id="tdCaption">
                            <asp:Label ID="lblCaption" runat="server" Text="Insert New Translation" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; vertical-align: middle">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;">
                            <asp:Label ID="lblOriginalPhrases" runat="server" Text="Original Phrases, not translated in this version:"></asp:Label><br />
                            <asp:Label ID="lblOriginalPhrasesComment" runat="server" Text="Please select the phrase you want to translated and click on the button bellow" Font-Italic="true" Font-Size="Smaller"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lbxPhrases" runat="server" Width="650px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <asp:ImageButton ID="ibtnGetPhrase" runat="server" ImageUrl="~/Images/down_arr_25x25.png"
                                BorderWidth="1px" OnClick="ibntGetPhraseClick" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblPhraseTitle" runat="server" Text="Original Phrase" /><br />
                            <asp:HiddenField ID="hfPhraseId" runat="server" />
                            <asp:TextBox ID="txtPhrase" runat="server" TextMode="MultiLine" Rows="6" Columns="60"
                                ReadOnly="true" CausesValidation="false" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblTranslatedPhraseTitle" runat="server" Text="Translated Phrase" /><br />
                            <asp:TextBox ID="txtTranslatedPhrase" runat="server" TextMode="MultiLine" Rows="6"
                                Columns="60" />
                        </td>
                        <tr>
                            <td style="text-align: center;">
                                <asp:Button ID="btnOk" runat="server" Text="Save" OnClick="btnOk_Click" />&nbsp;
                                <asp:Button ID="btnNo" runat="server" Text="Cancel" OnClick="btnNo_Click" />
                            </td>
                        </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>--%>
    <ajax:ModalPopupExtender ID="mpext2" runat="server" BackgroundCssClass="modalBackground"
        TargetControlID="btnPopup2" PopupControlID="pnlPopup2" OkControlID="btnClose"
        CancelControlID="btnClose">
    </ajax:ModalPopupExtender>
    <asp:Button ID="btnPopup2" runat="server" Text="Download" Style="display: none;" />
    <asp:Panel ID="pnlPopup2" runat="server" CssClass="modalPopup" DefaultButton="btnClose"
        Style="display: none;">
        <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>--%>
        <table style="width: 100%">
            <tr class="topHandle">
                <td align="left" runat="server" id="td1">
                    <asp:Label ID="lblWindowTitle" runat="server" Text="Importing translated phrases from Excel file"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbllFileUploadTitle" runat="server" Text="Select Excel File"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="fuFileUpload" runat="server" />
                    <%--<ajax:AsyncFileUpload Width="400px" runat="server" ID="fuFileUpload"    />--%>
                    <br />
                    <asp:Button ID="btnImportPhrases" runat="server" Text="Start Importing" OnClick="btnImportPhrasesClick" /><br />
                    <asp:Label ID="lblStatus" runat="server" Style="font-family: Arial; font-size: small;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; vertical-align: middle">
                    <div class="ScrollableWindow">
                        <asp:Label ID="lblReport" runat="server"></asp:Label>
                        <asp:ListView ID="lvReport" runat="server">
                            <LayoutTemplate>
                                <table class="main" border="1 solid black" cellpadding="3" cellspacing="0" style="width: 100%;
                                    text-align: center;">
                                    <tr bgcolor="#EBEBEB">
                                        <th style="text-align: left; width: 25%;">
                                            <asp:Label ID="lblPhraseKeyTitle" runat="server" Text="Key" />
                                        </th>
                                        <th style="text-align: center;">
                                            <asp:Label ID="lblCultureTitle" runat="server" Text="Phrase" />
                                        </th>
                                        <th style="text-align: center;">
                                            <asp:Label ID="lblActiveTitle" runat="server" Text="Translated Phrase" />
                                        </th>
                                        <th style="text-align: center;"> <!-- 08/30/2013 - added -->
                                            <asp:Label ID="lblDoNotLocalize" runat="server" Text="Do Not Translate" />                                        
                                        </th>
                                        <th style="text-align: center;">
                                            <asp:Label ID="lblStatusTitle" runat="server" Text="Upload Status" />
                                        </th>
                                    </tr>
                                    <tr id="ItemPlaceHolder" runat="server" />
                                </table>
                            </LayoutTemplate>
                            <EmptyDataTemplate>
                                <asp:Label ID="lblEmptyMessage" runat="server" Text="No results" />
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="lblPhraseId" runat="server" Text='<%# ((Guid)Eval("PhraseKey")).ToString()  %>' />
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtPhrase" runat="server" Text='<%# GetContent((string)Eval("Phrase"))  %>'
                                            CssClass="NotResizable" Wrap="true" Rows="3" ReadOnly="true" TextMode="MultiLine"
                                            BorderStyle="None" BorderWidth="0" Enabled="false" Columns="25" />
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:TextBox ID="txtPhraseTranslated" runat="server" Text='<%#  GetContent((string)Eval("TranslatedPhrase")) %>'
                                            CssClass="NotResizable" Wrap="true" Rows="3" ReadOnly="true" TextMode="MultiLine"
                                            BorderStyle="None" BorderWidth="0" Enabled="false" Columns="25" />
                                    </td>
                                    <td style="text-align: center;"> <!-- 08/30/2013 - added -->
                                        <asp:Label ID="txtDoNotLocalize" runat="server" Text='<%# Eval("DoNotLocalize") %>' />
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:Label ID="txtStatusTitle" runat="server" Text='<%# GetResultText((int)Eval("UploadResult")) %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align: center;">
                    <%--<asp:Button ID="btnImportOK" runat="server" Text="OK" OnClick="btnImportOKClick" />--%>
                    <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
                </td>
            </tr>
        </table>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </asp:Panel>
</div>


<%--<asp:ObjectDataSource ID="odsPhrases" runat="server" SelectMethod="GetVersionPhrases"  
        SelectCountMethod="GetVersionPhrasesTotal" EnablePaging="true" 
        MaximumRowsParameterName="pageSize"
        StartRowIndexParameterName="startRowIndex" 
        TypeName="VersionPhrase">
        <SelectParameters>
            <asp:Parameter Name="startRowIndex" Type="Int32" />
            <asp:Parameter Name="pageSize" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
<asp:LinqDataSource ID="ldsPhrases" runat="server" OnSelecting="ldsPhrases_Selecting">
</asp:LinqDataSource> --%>
