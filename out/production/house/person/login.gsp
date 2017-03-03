
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome To HouseMates</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
<br/>
<g:form controller="person" action="authenticate">
    <label>First Name: </label>
    <g:textField name="firstName"/><br/>
    <label>Last Name: </label>
    <g:textField name="lastName"/><br/>
    <label>Sub_Id: </label>
    <g:textField name="sub_id"/><br/>
    <g:actionSubmit value="authenticate"/>
</g:form>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>This page simulates Login or Sign-Up Page</h1>

        <p>
            Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display
            whatever content you may choose. Below is a list of controllers that are currently deployed in
            this application, click on each to execute its default action:
        </p>

        <div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div>
    </section>
</div>

</body>
</html>
