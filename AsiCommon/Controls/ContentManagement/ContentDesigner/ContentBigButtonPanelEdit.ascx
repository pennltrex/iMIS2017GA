<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentBigButtonPanelEdit" Codebehind="ContentBigButtonPanelEdit.ascx.cs" %>

<style type="text/css">.rgEditForm{ padding: 10px!important;}</style>
<asiweb:PanelTemplateControl ID="BigButtonFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
     
    <telerik:RadDialogOpener runat="server" id="DialogOpener1" />
    
    <div style="display:none">
        <asiweb:SmartControl ID="ExistingLegacyBorder" runat="server" 
            BoundPropertyName="ExistingLegacyBorder" DisplayCaption="False" HIControlType="Hidden" />  
    </div>  
    
    <div id="ImageManagerDiv" style="white-space:nowrap;display:inline-block;">                       
        <asiweb:SmartControl ID="ImageUrlInput" runat="server" OnClientChange="EnableDisableEdit()" OnClientBlur="EnableDisableEdit()" 
            BoundPropertyName="ImageUrl" DisplayCaption="true" TextBoxWidth="315px" PositionCaption="Left" />            
        <span style="line-height:2.1em;"><a href="#" onclick="LaunchImageManager()"><%#GetTranslatedPhrase("select") %></a></span>                                 
    </div>
  
    <div class="SubItems"> 
        <asiweb:SmartControl ID="AltText" runat="server" 
            BoundPropertyName="AltText" DisplayCaption="true" /> 
    </div>  
   
    <div class="AutoWidth">
        <asiweb:SmartControl ID="ActionMode" runat="server" BoundPropertyName="ActionMode" DisplayCaption="true" PositionCaption="Top"
            AutoPostBack="true" />
    </div>  
    
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="UsePopupControl" runat="server" BoundPropertyName="UsePopup" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>     
             
    <asiweb:SmartControl ID="NavigationIdentifierInput" runat="server" 
        BoundPropertyName="NavigationIdentifier" DisplayCaption="true" AutoPostBack="true" />
        
    <div class="SubItems">             
        <div class="AutoWidth">
            <asiweb:SmartControl ID="IncludeParentLevelItemControl" runat="server" BoundPropertyName="IncludeParentLevelItem" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        </div>              
        <asiweb:SmartControl ID="ChildLevelsToDisplayInput" runat="server" 
            BoundPropertyName="ChildLevelsToDisplay" DisplayCaption="true" />                                        
    </div>
    
    <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
                          
    <div class="PanelField Left">
        <a name="GridTop"></a>  
        <asiweb:BusinessLabel runat="server" ID="RadGridLabel" AssociatedControlID="RadGrid1" PositionCaption="Top"/>
            
        <div style="margin:3px;">
                                 
            <div style="clear: both;"></div>
                                 
            <telerik:RadGrid ID="RadGrid1" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" runat="server" ShowStatusBar="True"
                AllowMultiRowSelection="False" PageSize="10" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"   
                AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter" OnItemCommand="RadGrid1ItemCommand" 
                >
                <PagerStyle Mode="NextPrevNumericAndAdvanced"/>                                             
                <MasterTableView AllowSorting="True" EditMode="EditForms" CommandItemDisplay="Top" InsertItemDisplay="Top" InsertItemPageIndexAction="ShowItemOnLastPage" >
                    <Columns>                      
                        <telerik:GridTemplateColumn UniqueName="ColumnLinkText" HeaderText="Link Text" EditFormHeaderTextFormat="Link Text" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <div style="text-overflow: ellipsis;overflow:hidden;width:165px;"> 
                                    <asiweb:BusinessLabel id="LinkTextLabel" runat="server"/>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="padding-bottom: 5px !important;">
                                    <asiweb:BusinessTextBox ID="LinkTextBox" runat="server"/>
                                </div>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        
                        <telerik:GridTemplateColumn UniqueName="ColumnLinkTarget" HeaderText="Link Target" EditFormHeaderTextFormat="<label>Link Target</label>" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <div style="text-overflow: ellipsis;overflow:hidden;width:250px;">                                           
                                    <asiweb:BusinessLabel id="LinkTargetLabel" runat="server"/> 
                                </div>                                                            
                            </ItemTemplate>
                            <EditItemTemplate>         
                                <div runat="server" ID="documentSelector" style="padding-bottom: 5px !important;" class="InputXLargeWrapper">
                                    <asiweb:BusinessDocumentBrowserControl ID="LinkTargetBox" runat="server" Required="True" RootFolder="@/" Caption="URL or Content Record" />
                                </div>                                
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        
                        <telerik:GridTemplateColumn HeaderText="URL Parameter" EditFormHeaderTextFormat="URL Parameter" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                            <ItemTemplate>                                   
                                <asiweb:BusinessLabel id="ActionParameterLabel" runat="server"/>                               
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="padding-bottom: 5px !important;" class="InputXLargeWrapper">                                                                       
                                    <asiweb:BusinessTextBox ID="ActionParameterTextBox" placeholder="e.g., ContactKey=@SelectedUser" runat="server" />
                                </div>                                                            
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        
                        <telerik:GridTemplateColumn HeaderText="OBO" EditFormHeaderTextFormat="Use On Behalf Of" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                            <ItemTemplate>                                   
                                <asiweb:BusinessCheckbox Enabled="False" id="OBOLabel" runat="server" ToolTip="Indicates whether the item works On Behalf Of" />                              
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="padding-bottom: 5px !important;">  
                                    <asiweb:BusinessCheckBox ID="OBOCheckBox" runat="server"/>
                                </div>                                                           
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                                              
                        <telerik:GridEditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Save" UniqueName="EditColumn" ItemStyle-Width="50px"></telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn ButtonType="LinkButton" Text="Delete" CommandName="Delete" UniqueName="DeleteColumn" ItemStyle-Width="50px"></telerik:GridButtonColumn>                       
                    </Columns>
                    
                    <NoRecordsTemplate>
                        <div style="padding: 5px !important;">
                            <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" Text="(None)"/>
                        </div>
                    </NoRecordsTemplate>
                    <CommandItemTemplate>
                        <div style="text-align:right;">
                            <asiweb:StyledButton ID="InsertButton" runat="server" CommandName="InitInsert" Text="Add" CausesValidation="true" ToolTip="Add new" OnClientClick="location.hash='#EndOfGrid';" />
                        </div>
                    </CommandItemTemplate>
                    <ExpandCollapseColumn Visible="False">
                        <HeaderStyle Width="50px"/>
                    </ExpandCollapseColumn>
                    <RowIndicatorColumn Visible="False">
                        <HeaderStyle Width="50px"/>
                    </RowIndicatorColumn>                    
                    <EditFormSettings>                                                    
                        <FormTableItemStyle Wrap="False" />
                        <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" Width="100%" />
                        <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="5" Width="100%" />
                        <FormTableAlternatingItemStyle Wrap="False"/>                                         
                        <EditColumn UniqueName="EditCommandColumn1" UpdateText="Save" CancelText="Cancel" InsertText="Save" ButtonType="PushButton" />                                                          
                    </EditFormSettings>                                                                                           
                </MasterTableView>
                
            </telerik:RadGrid> 
                                       			
        </div>
                   
    </div>  
    
    <script type="text/javascript">
        //<![CDATA[
        function LaunchImageManager() {
            $find("<%#DialogOpener1.ClientID%>").open('ImageManager', { CssClasses: [] }); return false;
        }

        function ImageManagerFunction(sender, args) {
            //If no file selected
            if (!args) {
                return false;
            }
            var webRoot = gWebRoot;
            var selectedItem = args.get_value();
            var txt = document.getElementById("<%#ImageUrlInput.ClientID%>_TextField");
            //Image manager gets handled differently for IE
            if ($telerik.isIE) {
                var path = selectedItem[0].outerHTML.replace('<img src="', '').replace('">', '').toLowerCase(); //this is the selected IMG tag element
                if (path.toLowerCase().indexOf("http") == -1) {
                    txt.value = path.replace(webRoot, '~');
                } else {
                    txt.value = path;
                }
                //Desktop sometimes need more cleanup
                if (txt.value.toLowerCase().indexOf('<img src="') > -1)
                    txt.value = txt.value.replace('<img src="', '').replace('">', '');
            } else {
                var path = args.value[0].getAttribute("src", 2).toLowerCase();
                if (path.toLowerCase().indexOf("http") == -1) {
                    txt.value = path.replace(webRoot, '~');
                } else {
                    txt.value = path;
                }
            }
            EnableDisableEdit();
            return true;
        }

        EnableDisableEdit();
        function EnableDisableEdit() {
            var imageUrlField = $get("<%#ImageUrlInput.ClientID%>_TextField");
            var altText = $get("<%#AltText.ClientID%>");
            var altTextField = $get("<%#AltText.ClientID%>_TextField");
            if (imageUrlField != null && imageUrlField.value.length > 0) {
                altText.removeAttribute("disabled", 0);
                altTextField.removeAttribute("disabled", 0);
            } else {
                altText.setAttribute("disabled", false);
                altTextField.setAttribute("disabled", false);
                altTextField.value = '';
            }
        }        
    //]]>
    </script> 
            
</asiweb:PanelTemplateControl>