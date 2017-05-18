This set of RadEditor controls is meant to be used when the RadEditor instance is exposed to public users. The changes are:

- SetImageProperties.ascx: Remove the div containing the 'ImageSrc' label and button, so that public users cannot access image folder structure
- FileBrowser.ascx: Set "RadFileExplorer1" Height="410px"
- InsertImage.ascx: changed [imagesrc] to 'Image URL'
- LinkManager.ascx: Set "DocumentManagerCaller" to Visible="false"