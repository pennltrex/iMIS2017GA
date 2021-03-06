﻿Partial Class LoginStatusRedirect
    Inherits System.Web.UI.Page
    'Inherits Asi.Web.UI.DisplayPageBase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'The URL string variables this script uses
        Dim quickVerificationKeyName As String = "QKEY"     'A random string (quick key) generated by a third party that we reflect back. Third party can use this to verify sign in request was in fact initiated by the third party, and not a hacker.
        Dim imisIdName As String = "ID"                     'iMIS ID
        Dim signinUrlVariableName As String = "LURL"        'Login URL Key name - the URL of the iMIS sign in page
        Dim returnUrlVariableName As String = "RETURL"      'Return URL Key name - the third party URL where browser should be redirected if browser is signed in

        'Get the values for the URL string variables that we care about
        Dim quickVerificationKeyValue As String = Request.QueryString(quickVerificationKeyName)
        Dim signinUrlVariableValue As String = Request.QueryString(signinUrlVariableName)
        Dim returnUrlVariableValue As String = Request.QueryString(returnUrlVariableName)

        'Get a local variable ready in case we need to assemble a redirection URL
        Dim constructedRedirectUrl As String = ""

        'Check to see that they both exist
        If signinUrlVariableValue <> "" And returnUrlVariableValue <> "" Then
            'Is the person logged in?
            If Asi.ContentManagerNet.SessionState.IsLoggedIn = True Then
                If Asi.ContentManagerNet.SessionState.User Is Nothing Then
                    'SessionState thinks it is logged in, but we don't have access to the iMIS ID. Try a reset.
                    'MsgBox("1") 'For debugging
                    'Kill the cookie
                    Response.Cookies("cfmemberid").Expires = Asi.AppTime.Now.AddDays(-1)
                    Response.Cookies("cfid").Expires = Asi.AppTime.Now.AddDays(-1)
                    'Redirect back to third party server requesting the sign in status to start process over. quickKey is needed so third party services (like GoLightly) know that more action is required.
                    constructedRedirectUrl = returnUrlVariableValue & "?" & quickVerificationKeyName & "=" & quickVerificationKeyValue
                    constructedRedirectUrl = Replace(constructedRedirectUrl, vbLf, "")
                    Response.Redirect(constructedRedirectUrl)
                Else
                    'SessionState is logged in and we can get the iMIS ID
                    'MsgBox("2") 'For debugging
                    Dim stringBuilder As New System.Text.StringBuilder()
                    stringBuilder.Append(returnUrlVariableValue)
                    stringBuilder.Append("?").Append(imisIdName).Append("=").Append(Asi.ContentManagerNet.SessionState.User.ContactId)
                    If quickVerificationKeyValue <> "" Then
                        stringBuilder.Append("&").Append(quickVerificationKeyName).Append("=").Append(quickVerificationKeyValue)
                    End If
                    constructedRedirectUrl = stringBuilder.ToString()
                    constructedRedirectUrl = Replace(constructedRedirectUrl, vbLf, "")
                    Response.Redirect(constructedRedirectUrl)
                End If
            Else
                'Not signed in. Redirect to the sign in page
                'MsgBox("3") 'For debugging
                signinUrlVariableValue = Replace(signinUrlVariableValue, vbLf, "")
                Response.Redirect(signinUrlVariableValue)
            End If
        Else
            'We don't have sufficient variables to proceed
            'MsgBox("4") 'For debugging
            Dim stringBuilder As New System.Text.StringBuilder()
            stringBuilder.Append("<h2>Required Variables</h2>")
            stringBuilder.Append("This 'LoginStatusRedirect.aspx' page requires the following variables to run.").Append("<br \>")
            stringBuilder.Append("&nbsp;<br \>")
            stringBuilder.Append("<strong>LURL</strong>: ").Append(signinUrlVariableValue).Append("<br \>")
            stringBuilder.Append("If this browser is not signed in, redirect the browser to this (full) web page address. Usually, this is a login page.").Append("<br \>")
            stringBuilder.Append("&nbsp;<br \>")
            stringBuilder.Append("<strong>RETURL</strong>: ").Append(returnUrlVariableValue).Append("<br \>")
            stringBuilder.Append("If this browser is signed in, redirect the browser to this (full) web page address.").Append("<br \>")
            stringBuilder.Append("&nbsp;<br \>")

            stringBuilder.Append("<h2>Optional Variable</h2>")
            stringBuilder.Append("<strong>QKEY</strong>: ").Append(quickVerificationKeyValue).Append("<br \>")
            stringBuilder.Append("If a value for this variable is received, it will be added to the redirected url.").Append("<br \>")
            stringBuilder.Append("&nbsp;<br \>")
            VariablesMissingLabel.Text = stringBuilder.ToString()
        End If

    End Sub

End Class
