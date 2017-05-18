<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MediaContentDisplay.ascx.cs" Inherits="Asi.Web.iParts.Media.MediaContent.MediaContentDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<!-- TODO: Remove this label, and add your own UI elements. -->
<asiweb:StyledLabel ID="ExampleCurrentUser" runat="server"></asiweb:StyledLabel>

<style>
    @media screen and (min-width: 786px) {
        .customAlign {
            float: right !important;
        }
    }

    @media screen and (max-width: 785px) {
        .customAlign {
            float: left !important;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            position: relative;
        }
    }

    .hideControll {
        display: none !important;
    }

    label.error {
        padding: 7px 14px !important;
        color: #ff0000 !important;
        font-weight: 100;
    }

    input.error, select.error {
        float: left !important;
    }

    .clearfix {
        clear: both;
    }
</style>


<asp:Panel runat="server" ID="ContentPanel" CssClass="StandardPanel" BorderStyle="None">

    <div runat="server" visible="false" id="DivLabelErrorMessage">
        <asp:Label ID="LabelErrorMessage" runat="server" CssClass="Error"></asp:Label>
    </div>

    <%--<asp:Panel runat="server" ID="Panel1" CssClass="StandardPanel" BorderStyle="None" >--%>
    <asp:Panel runat="server" ID="FormPanel" CssClass="StandardPanel" BorderStyle="None">
        <%--<form method="post" enctype="multipart/form-data" id="formMediaContent" name="formMediaContent" class="formMediaContent">--%>
        <div id="ValidateData">
            <div class="col-md-8 col-sm-7">
                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelMediaCustomerId" class="Required" for="MediaCustomerId">Media Customer Id</label>
                        </div>
                        <div class="PanelFieldValue">
                            <input type="text" name="MediaCustomerId" id="MediaCustomerId" data-rule-required="true" data-msg-required="Required" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelSponsorName" class="Required" for="SponsorName">Sponsor Name</label>
                        </div>
                        <div class="PanelFieldValue">
                            <input type="text" name="SponsorName" id="SponsorName" data-rule-required="true" data-msg-required="Required" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelStatus" class="Required" for="Status">Status</label>
                        </div>
                        <div class="PanelFieldValue">
                            <select id="Status" name="Status" data-rule-required="true" data-msg-required="Required">
                                <option value="" selected="selected">(None)</option>
                                <option value="Submitted">Submitted</option>
                                <option value="In Progress">In Progress</option>
                                <option value="Cancelled">Cancelled</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelImpressionLimit" class="Required" for="ImpressionLimit">Impression Limit</label>
                        </div>
                        <div class="PanelFieldValue">
                            <input type="text" name="ImpressionLimit" id="ImpressionLimit" data-rule-required="true" data-msg-required="Required" data-rule-number="true" data-msg-number=" Enter Only Number" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelContentType" class="Required" for="MediaContentType">Content Types</label>
                        </div>
                        <div class="PanelFieldValue">
                            <select id="MediaContentType" name="MediaContentType" data-rule-required="true" data-msg-required="Required">
                                <option value="" selected="selected">(None)</option>
                                <option value="Banner">Banner</option>
                                <option value="Skyscraper">Skyscraper</option>
                                <option value="Vertical">Vertical</option>
                                <option value="Rectangle">Rectangle</option>
                                <option value="Square">Square</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelContentSize" class="Required" for="MediaContentSize">Content Size</label>
                        </div>
                        <div class="PanelFieldValue">
                            <input type="text" name="MediaContentSize" id="MediaContentSize" data-rule-required="true" data-msg-required="Required" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelActualURL" class="Required" for="ActualURL">Actual URL</label>
                        </div>
                        <div class="PanelFieldValue">
                            <input type="text" name="ActualURL" id="ActualURL" data-rule-required="true" data-msg-required="Required" data-rule-url="true" data-msg-url=" Invalid URL" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelappDisplayFirstDate" class="Required" for="DisplayFirstDate">Display First Date</label>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:businesscalendar2 id="DisplayFirstDate" clientidmode="Static" runat="server" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelappDisplayLastDate" class="Required" for="DisplayLastDate">Display Last Date</label>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:businesscalendar2 id="DisplayLastDate" clientidmode="Static" runat="server" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="PanelField Left">
                        <div style="display: inline;">
                            <label id="StyledLabelFile" class="Required" for="MediaContentUpload">Select File to Upload Meadia Content</label>
                        </div>
                        <div class="PanelFieldValue">
                            <input id="MediaContentUpload" name="MediaContentUpload" type="file" data-rule-required="true" data-msg-required="Required" onchange="readURL(this, 'ImagePreviewMediaContent');" accept=".png,.jpg,.jpeg" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="customAlign">
                <div>
                    <asiweb:styledlabel runat="server" id="LabelPreview" text='Preview' associatedcontrolid="ImagePreviewMediaContent"></asiweb:styledlabel>
                </div>
                <div>
                    <asiweb:businessstyledimage id="ImagePreviewMediaContent" runat="server" clientidmode="Static" style="width: 250px" />
                </div>
            </div>
            <div class="clerrfix"></div>

            <div class="PanelField CommandBar"></div>
            <div class="PanelField CommandBar"></div>
            <div>
                <div class="PanelField CommandBar">
                    <div style="display: inline;">
                        <asiweb:styledbutton id="ButtonUpload" text="Upload" runat="server" cssclass="PrimaryButton TextButton TextButtonWithImage Save" onclientclick="return AddMediaContent();" />
                        <asiweb:styledbutton id="ButtonCancel" text="Cancel" runat="server" cssclass="TextButton TextButtonWithImage Cancel" onclientclick="return CancelMediaContent();" />
                    </div>
                </div>
            </div>
        </div>
        <%--  </form>--%>
    </asp:Panel>
</asp:Panel>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

<script>
    $(document).ready(function () {
        $("#DisplayFirstDate").find('input.riTextBox').prop('readonly', 'readonly');
        $("#DisplayLastDate").find('input.riTextBox').prop('readonly', 'readonly');
        CancelMediaContent();
    });

    function validateMediaContent() {
        var cnt = 0;

        if ($('#MediaCustomerId').valid()) {
            cnt++;
        }
        if ($('#SponsorName').valid()) {
            cnt++;
        }
        if ($('#Status').valid()) {
            cnt++;
        }
        if ($('#ImpressionLimit').valid()) {
            cnt++;
        }
        if ($('#MediaContentSize').valid()) {
            cnt++;
        }
        if ($('#MediaContentType').valid()) {
            cnt++;
        }
        if ($('#ActualURL').valid()) {
            cnt++;
        }
        //if ($("#DisplayFirstDate").find('input.riTextBox').valid()) {
        //    cnt++;
        //}
        //if ($("#DisplayLastDate").find('input.riTextBox').valid()) {
        //    cnt++;
        //}
        if ($('#MediaContentUpload').valid()) {
            cnt++;
        }
        if (cnt == 8)
            return true;
        else
            return false;

    };

    function AddMediaContent() {
        if (validateMediaContent() == false) {
            return false;
        }
        var data = new FormData();
        input = document.getElementById('MediaContentUpload');
        var temp = input.files[0];
        var files = $("#MediaContentUpload").get(0).files;
        if (files != undefined && files.length > 0) {
            data.append("MediaContentUpload", files[0]);
        }

        var other_data = $('form').serializeArray();

        $.each(other_data, function (key, input) {
            data.append(input.name, input.value);
        });
        data.append("DisplayFirstDate", $("#DisplayFirstDate").find('input.riTextBox').prop('value'));
        data.append("DisplayLastDate", $("#DisplayLastDate").find('input.riTextBox').prop('value'));

        var ajaxRequest = $.ajax({
            type: "POST",
            url: "http://localhost:56899/api/MediaContent",
            contentType: false,
            processData: false,
            data: data
        });
        ajaxRequest.done(function (xhr, status, response) {
            if (status != "1") {
                alert("Media Content added successfully.");
                CancelMediaContent();
            }
            return false;
        });
        ajaxRequest.fail(function (xhr, status) {
            alert("Oops, Something is not correct.");
            return false;
        });
        return false;
    }

    function CancelMediaContent() {
        $('#MediaCustomerId').val('');
        $('#SponsorName').val('');
        $('#Status').val('');
        $('#ImpressionLimit').val('');
        $('#MediaContentSize').val('');
        $('#MediaContentType').val('');
        $('#ActualURL').val('');
        $('#MediaContentUpload').val('');
        $("#ImagePreviewMediaContent").attr('src', '/imismain100/Images/ImageLibrary/NoImageAvailable.gif');

        var d = new Date();
        var currentDate = (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear();
        var LastDate = (d.getMonth() + 2) + "/" + d.getDate() + "/" + d.getFullYear();
        $("#DisplayFirstDate").find('input.riTextBox').prop('value', currentDate);
        $("#DisplayLastDate").find('input.riTextBox').prop('value', currentDate);

        return false;
    }

    function readURL(input, id, hdnid) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + id)
                    .attr('src', e.target.result)
                    .width(250);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

