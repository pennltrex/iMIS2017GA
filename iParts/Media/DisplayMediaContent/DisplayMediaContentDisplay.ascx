<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DisplayMediaContentDisplay.ascx.cs" Inherits="Asi.Web.iParts.Media.DisplayMediaContent.DisplayMediaContentDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<!-- TODO: Remove this label, and add your own UI elements. -->
<%--<asiweb:StyledLabel ID="ExampleCurrentUser" runat="server"></asiweb:StyledLabel>--%>


<style>
    .img-responsive {
        height: auto;
        max-width: 100%;
    }

    .img-thumbnail {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 4px;
        display: inline-block;
        height: auto;
        line-height: 1.42857;
        max-width: 100%;
        width: 300px;
        padding: 4px;
    }

    .btnRefresh {
        height: 29px;
        width: 28px;
        padding: 0;
        font-weight: bold;
    }
</style>

<!-- TODO: Remove this label, and add your own UI elements. -->

<asiweb:StyledLabel ID="ExampleCurrentUser" runat="server" Style="display: none"></asiweb:StyledLabel>
<h2>Display Media Content</h2>

<div data-ng-app="MediaContentControllerApp" data-ng-controller="MediaContentController" style="width: 300px;">
    <a href="javascript:" data-ng-click="getMeadiContentUrl()">
        <img alt="Meadia Content" class="img-responsive img-thumbnail MeadiaContentData" data-ng-src="{{MediaContentSrc}}">
    </a>

    <div class="imageBoxPad">
        <button type="button" class="btnRefresh" data-ng-click="getMeadiContent()" style="float: left;">
            <img src="http://simpleicon.com/wp-content/uploads/refresh-64x64.png" alt="Refresh" />
        </button>
        <h4 style="float: left; padding-top: 3px; font-weight: 600">&nbsp; Sponsor by {{MediaContentSponsor}}</h4>
    </div>
    <input type="hidden" value="" data-ng-model="MeadiContentId" />
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
<script>
    var mainApp = angular.module("MediaContentControllerApp", []);

    mainApp.controller('MediaContentController', function ($scope, $http) {

        var strBaseURL = "http://localhost:56899/api/";

        $scope.getMeadiContent = function () {
            $http.get(strBaseURL + "MediaContent").success(function (response, status) {
                if (status == 200) {
                    $scope.MediaContentSrc = response.MediaContent;
                    $scope.MediaContentSrcMeadiContentId = response.MediaContentId;
                    $scope.MediaContentSponsor = response.SponsorName;
                }
            });
        }

        //$scope.getMeadiContentUrl = function () {
        //    var data = { "MediaContentId": $scope.MediaContentSrcMeadiContentId };
        //    $http.post(
        //       strBaseURL + "MediaContent",
        //       JSON.stringify(data),
        //       {
        //           headers: { 'Content-Type': 'application/json' }
        //       }
        //   ).success(function (response, status) {
        //       if (status == 200) {
        //           var win = window.open(response, '_blank');
        //           win.focus();
        //       }
        //   });
        //}
        $scope.getMeadiContentUrl = function () {
            var data = { "MediaContentId": $scope.MediaContentSrcMeadiContentId };
            $http.post(
               strBaseURL + "MediaContent?MediaContentId="+ $scope.MediaContentSrcMeadiContentId 
               //JSON.stringify(data),
               //{
               //    headers: { 'Content-Type': 'application/json' }
               //}
           ).success(function (response, status) {
               if (status == 200) {
                   var win = window.open(response, '_blank');
                   win.focus();
               }
           });
        }

        $scope.getMeadiContent();

    });
</script>

