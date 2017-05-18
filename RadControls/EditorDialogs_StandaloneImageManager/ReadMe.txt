This set of RadEditor controls is meant to be used when the RadEditor instance is exposed to public users. The changes are:

- FileBrowser.ascx: Add style="display: none;" to button ID="InsertButton" (should be line 50)
- ImageManager.ascx: Add style="display: none;" to 'propertiesPage' RadPageView and to the 'Properties' RadTab
- LinkManager.ascx: Set "DocumentManagerCaller" to Visible="false"