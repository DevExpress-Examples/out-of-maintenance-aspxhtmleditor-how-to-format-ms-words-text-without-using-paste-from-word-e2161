# ASPxHtmlEditor - How to format MS Word's  text without using 'Paste From Word'


<p>This example demonstrates how to format html content when an end-user pastes text that has been copied from Ms Word text. </p><p>There is an ASPxHtmlEditor on the form. We've handled the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxHtmlEditorScriptsASPxClientHtmlEditor_HtmlChangedtopic">HtmlChanged</a> client-side event to know when a text has been changed and <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxHtmlEditorScriptsASPxClientHtmlEditor_CommandExecutedtopic">CommandExecuted</a> event to know when a text needs to be pasted.  In addition, a "process" local variable is maintained, to indicate different stages of these operations, and avoid infinite loops.</p><p>1. When a command is performed, we're using the CommandExecuted event handler to check that this is a "KBPASTE_COMMAND" command (preparation for paste).<br />
2. At this stage, we can't get the Html contents from the ASPxHtmlEditor, so we set the "process" variable equal to "2".<br />
3. When the text is pasted to the ASPxHtmlEditor, its HtmlChanged event is raised.  We can get this text and format an appropriate command parameter simulating the "Paste from word" feature.<br />
4. Because the SetHtml method raises the HtmlChanged event again, we set the "process" variable to another value: "3".<br />
5. The PASTEFROMWORD_COMMAND command requires a parameter of the following type:</p>

```js
<newline/>
 res = {<newline/>
       html: text,<newline/>
       stripFontFamily: false<newline/>
 };<newline/>

```

<p>We fill it with an appropriate data, and use for the ASPxClientCommandConsts.PASTEFROMWORD_COMMAND command.</p><p>Note: FF doesn't allow to paste an empty symbol as the ASPxHtmlEditor content. Therefore, it's necessary to replace empty symbol to the "&nbsp;" element.</p><p><strong>See Also:</strong><br />
<a href="http://demos.devexpress.com/ASPxHTMLEditorDemos/Features/ClientSideAPI.aspx">ASPxHTMLEditorDemos: Client-Side Functionality</a></p>

<br/>


