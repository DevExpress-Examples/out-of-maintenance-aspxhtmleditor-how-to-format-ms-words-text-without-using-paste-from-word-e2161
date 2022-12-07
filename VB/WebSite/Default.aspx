<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
        var process = 1;
        var text = "";
        var res = null;
        
        function OnHtmlChanged(s, e) {
            if (process == 2) {
                process = 3;
                text = s.GetHtml();
                if (text == "")
                    text = "&nbsp;"
                res = {
                    html: text,
                    stripFontFamily: false
                };
                s.SetHtml("&nbsp;");
                s.ExecuteCommand(ASPxClientCommandConsts.PASTEFROMWORD_COMMAND, res);
            }
        }

        function OnCommandExecuted(s, e) {
            if (e.commandName == ASPxClientCommandConsts.KBPASTE_COMMAND) {
                process = 2;
                return;
            }
            if (e.commandName == ASPxClientCommandConsts.PASTEFROMWORD_COMMAND) {
                process = 3;
                s.ExecuteCommand(ASPxClientCommandConsts.PASTEHTML_COMMAND, "&nbsp;");
                return;
            }
            if (e.commandName == ASPxClientCommandConsts.PASTEHTML_COMMAND) {
                process = 1;
            }
        }
    </script>
</head>
<body>
	<form id="form1" runat="server">
	<div>

		<dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" ClientInstanceName="HtmlEditor" runat="server">
			<ClientSideEvents HtmlChanged="OnHtmlChanged" CommandExecuted="OnCommandExecuted" />
		</dx:ASPxHtmlEditor>

	</div>
	</form>
</body>
</html>