<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.BusinessFileUpload" Codebehind="BusinessFileUpload.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="javascript">
    //<![CDATA[
    ///Function to toggle submit button status. This JS is fired by Fileupload when file is selected or on page load    	
    function ToggleUploadButton(radUpload, eventargs)
    {
        var uploadButton = document.getElementById("<%#UploadButton.ClientID%>");
	    if(uploadButton!=null)
             uploadButton.disabled = true;
    
        if (eventargs!=null && uploadButton!=null)
        {
            uploadButton.disabled = false;

        }
    }
    
    
    // This Event fired by Telerik when File Upload added to the Telerik control (this event is always fired)
    function OnClientAdded(radUpload, eventargs)
    {
        setTimeout("ToggleUploadButton(null,null)",250);
    }
    
      //[pmb] 08April2010 - removed browser fix javascript as it seemed to be causing more problems than it fixed
    
      //See: http://demos.telerik.com/aspnet-ajax/ajax/examples/common/fileupload/defaultcs.aspx
      /*
        RadAjax controls allow you to force specific controls to make postback requests instead of AJAX ones even when they are wrapped inside
        a RadAjaxPanel or ajaxified by a RadAjaxManager controls. That is especially useful for file uploads as due to the specifics of
        Internet forms, files are uploaded only during postback requests.
      */
    function OnRequestStart(target, arguments) 
    {
        //arguments.get_eventTarget() returns the name with $ seperators, ClientID returns the name with
        // underscore (_) seperators
        if (arguments.get_eventTarget() == "<%#UploadButton.ClientID%>".replace(/_/g, "$")) 
        {
              arguments.set_enableAjax(false);
        }
    }


// This is to prevent postbacks when something other than the Uload button is clicked - e.g. Log Off
function onClientSubmitting(progressManager, args)
{

  var eventTarget = document.getElementById('__EVENTTARGET');


 if (eventTarget.value != '<%# UploadButton.UniqueID %>')
 {
   //Clear the file inputs
   var upload = $find('<%# radUploadControl.ClientID %>');
   var fileInputs = upload.getFileInputs();
   for (var i=0; i<fileInputs.length; i++)
   {
     upload.clearFileInputAt(i);
   }
 }


}

    //]]>
</script>


    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server"  ClientEvents-OnRequestStart="OnRequestStart">
        <telerik:RadProgressManager id="RadProgress_Control" runat="server"  OnClientSubmitting ="onClientSubmitting"/>
        <telerik:RadProgressArea id="radProgress_Area" runat="server" DisplayCancelButton="true" ProgressIndicators="TotalProgressBar,CurrentFileName,TimeElapsed,TimeEstimated" />

        <telerik:RadUpload
            ID="radUploadControl" runat="server" OnFileExists="FileExists"
            MaxFileInputsCount="1"  
            OverwriteExistingFiles="false" OnClientFileSelected="ToggleUploadButton" 
            OnClientAdded="OnClientAdded"
            style="padding-top: 0px; padding-bottom:0px;font-size:small!Important; margin-top:0px;width:auto!Important; float:left;"  OnValidatingFile="radUploadControl_ValidatingFile"
            ReadOnlyFileInputs="true"  />
        <asi:StyledButton id="UploadButton" Runat=Server Text=<%#ButtonText%> />
    </telerik:RadAjaxPanel>

