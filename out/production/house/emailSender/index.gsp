<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Email Sender</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <div id="content" role="main">
        <section class="row colset-2-its">
            <g:if test="${flash.message}">
                <div class="message" role="alert">
                    ${flash.message}
                </div>
            </g:if>
            <h2>Email Sender Form</h2>
            <g:form controller="emailSender" action="send">
                <div class="fieldcontain">
                    <g:textField name="address" placeholder="roommates-email@email.com" required="" />
                </div>
                <div class="fieldcontain">
                    <g:textField name="subject" placeholder="Your Subject" required="" />
                </div>
                <div class="fieldcontain">
                    <g:textArea name="body" rows="5" cols="100" placeholder="Your message" required="" >
                        ${email} </g:textArea>
                </div>
                <fieldset>
                    <g:submitButton name="send" value="Send" />
                </fieldset>
            </g:form>
        </section>
    </div>
    <div>

    </div>
    <div>
        <h4>If you have entered all your HouseMates, please click finish and login to your new House!</h4>
        <a href="http://localhost:8080">FINISHED</a>
    </div>
</body>
</html>