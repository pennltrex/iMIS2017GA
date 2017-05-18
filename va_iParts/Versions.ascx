<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_Versions" Codebehind="Versions.ascx.cs" %>
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
        List of Versions </h3>
    <table style="width: 100%" border="0">
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td style="text-align: right" class="style1">
                <asp:Button ID="btnBack" runat="server" Text="Back to List of Cultures" OnClick="btnBackClick" />&nbsp;
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
                <asp:Label ID="lblActiveVersionTitle" runat="server" Text="Active Version: " Font-Bold="true" />
            </td>
            <td>
                <asp:Label ID="lblActiveVersion" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ListView ID="lvVersions" runat="server" OnItemDataBound="lvVersionsOnItemDataBound"
                    OnItemEditing="lvVersionsEditing" OnItemUpdating="lvVersionsUpdating" OnItemCanceling="lvVersionsCanceling"
                    OnItemInserting="lvVersionsInserting" OnItemCreated="lvVersionsItemCreated" DataKeyNames="VersionKey"
                    OnItemDeleting="lvVersionsDeleting" OnItemCommand="lvVersionsCommand">
                    <LayoutTemplate>
                        <div class="AltRow">
                            <table class="main" border="1 solid black" cellpadding="3" cellspacing="0" style="width: 100%;
                                text-align: center;">
                                <tr>
                                    <td colspan="6" style="text-align: right">
                                        <asp:Button ID="btnAddNew" runat="server" Text="New Version" OnClick="btnAddNewClick"
                                            Font-Underline="True" />
                                    </td>
                                </tr>
                                <tr bgcolor="#EBEBEB">
                                    <th style="text-align: left; width: 25%;">
                                        <asp:Label ID="lblNameTitle" runat="server" Text="Name" />
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblPhrasesTitle" runat="server" Text="Phrases" />
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblActiveTitle" runat="server" Text="Active" />
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblUpdatedTitle" runat="server" Text="Updated" />
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblUpdatedByTitle" runat="server" Text="Updated By" />
                                    </th>
                                    <th style="text-align: center;">
                                        <asp:Label ID="lblActionsTitle" runat="server" Text="Actions" />
                                    </th>
                                </tr>
                                <tr id="ItemPlaceHolder" runat="server" />
                            </table>
                        </div>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <table class="main" border="1 solid black" cellpadding="3" cellspacing="0" style="width: 100%;
                                text-align: center;">
                            <tr>
                                <td colspan="6" style="text-align: right">
                                    <asp:Button ID="btnAddNew" runat="server" Text="New Version" OnClick="btnAddNewClick"
                                        Font-Underline="True" />
                                </td>
                            </tr>
                            <tr bgcolor="#EBEBEB">
                                <th style="text-align: left; width: 25%;">
                                    <asp:Label ID="lblNameTitle" runat="server" Text="Name" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblPhrasesTitle" runat="server" Text="Phrases" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblActiveTitle" runat="server" Text="Active" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblUpdatedTitle" runat="server" Text="Updated" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblUpdatedByTitle" runat="server" Text="Updated By" />
                                </th>
                                <th style="text-align: center;">
                                    <asp:Label ID="lblActionsTitle" runat="server" Text="Actions" />
                                </th>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    Empty List
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="text-align: left;">
                                <asp:Label ID="lblName" runat="server" Text='<%# (string)Eval("Name") %>' />
                            </td>
                            <td style="text-align: center;">
                                <asp:Label ID="lblPhrases" runat="server" Text='<%# (int)Eval("Phrases") %>' />
                            </td>
                            <td style="text-align: left;">
                                <asp:Label ID="lblActive" runat="server" Text='<%# (bool)Eval("ActiveVersion")? "Active" : "Inactive" %>' />&nbsp;
                                <asp:LinkButton ID="lbtnActivate" runat="server" Text='<%# (bool)Eval("ActiveVersion")? "Deactivate" : "Activate" %>' CommandName="ActivateCommand" CommandArgument='<%# (Guid)Eval("VersionKey") %>' />
                                <br />
                                <asp:Label ID="lblActivated" runat="server" Text='<%# GetActivationDate((DateTime)Eval("ActiveVersionLoaded")) %>' Font-Size="9px" Font-Italic="true" />
                            </td>
                            <td style="text-align: center;">
                                <asp:Label ID="lblUpdated" runat="server" Text='<%# ((DateTime)Eval("Updated")).ToString("MMM dd,yyyy") %>' />
                            </td>
                            <td style="text-align: center;">
                                <asp:Label ID="lblUpdatedBy" runat="server" Text='<%# (string)Eval("UpdatedBy") %>' />
                            </td>
                            <td style="text-align: left;">
                                <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" CommandName="Edit" />&nbsp;
                                <asp:LinkButton ID="lbtnPhraseEdit" runat="server" Text="Phrases" CommandName="PhraseEdit"
                                    CommandArgument='<%# Bind("VersionKey") %>' />&nbsp;
                                <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" CommandName="Delete" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: White">
                            <td colspan="6">
                                <table class="nomain" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center;
                                    border: 1px solid black;">
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblVersionKeyTitle" runat="server" Text="Version Key" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:Label ID="lblVersionKey" runat="server" Text='<%# Bind("VersionKey") %>' />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblNameTitle" runat="server" Text="Name" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' />
                                        </td>
                                        <td rowspan="3" style="vertical-align: top; text-align: center">
                                            <asp:LinkButton ID="lbtnUpdate" runat="server" Text="Update" CommandName="Update" />&nbsp;&nbsp;
                                            <asp:LinkButton ID="lbtnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblDescriptionTitle" runat="server" Text="Description" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'
                                                TextMode="MultiLine" Rows="3" Columns="30" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblNotesTitle" runat="server" Text="Note" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Note") %>' TextMode="MultiLine"
                                                Rows="3" Columns="30" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblStatusTitle" runat="server" Text="Status" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:HiddenField ID="hfStatusID" runat="server" Value='<%# Bind("StatusID") %>' />
                                            <asp:DropDownList ID="ddlStatuses" runat="server" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblCulture" runat="server" Text="Culture" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:HiddenField ID="hfCulture" runat="server" Value='<%# Bind("CultureID") %>' />
                                            <asp:DropDownList ID="ddlCulture" runat="server" Enabled="false" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <tr style="background-color: White">
                            <td colspan="6">
                                <table class="nomain" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center;
                                    border: 1px solid black;">
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblVersionKeyTitle" runat="server" Text="Version Key" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:Label ID="lblVersionKey" runat="server" Text="<New>" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblNameTitle" runat="server" Text="Name" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtName" runat="server" Text="" />
                                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="<br />Name field is blank" ValidationGroup="InsertValidation" ForeColor="Red" />
                                        </td>
                                        <th rowspan="4" style="vertical-align: top; text-align: center">
                                            <asp:LinkButton ID="lbtnSave" runat="server" Text="Save" CommandName="Insert" ValidationGroup="InsertValidation" />&nbsp;&nbsp;
                                            <asp:LinkButton ID="lbtnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblDescriptionTitle" runat="server" Text="Description" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtDescription" runat="server" Text="" TextMode="MultiLine" Rows="3"
                                                Columns="30" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblNotesTitle" runat="server" Text="Note" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:TextBox ID="txtNotes" runat="server" Text="" TextMode="MultiLine" Rows="3" Columns="30" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblStatusTitle" runat="server" Text="Status" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:DropDownList ID="ddlStatuses" runat="server" />
                                        </td>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblCulture" runat="server" Text="Culture" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left">
                                            <asp:DropDownList ID="ddlCulture" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top; text-align: right">
                                            <asp:Label ID="lblPhrases" runat="server" Text="Phrases" />
                                        </th>
                                        <td style="vertical-align: top; text-align: left" colspan="3">
                                            <table style="width:100%">
                                                <tr>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblPhrases" runat="server" RepeatDirection="Vertical" OnSelectedIndexChanged="rblPhrasesSelectedIndexChanged" AutoPostBack="true">
                                                            <asp:ListItem Value="1" Text="Copy from live version" Selected="True" />
                                                            <asp:ListItem Value="2" Text="Copy from other version" />
                                                       </asp:RadioButtonList> 
                                                    </td>
                                                </tr>
                                            </table>
                                            <div id="dvVersionsList" runat="server" visible="false">
                                                <asp:DropDownList ID="ddlVersions" runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                         </tr>
                    </InsertItemTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>
</div>
