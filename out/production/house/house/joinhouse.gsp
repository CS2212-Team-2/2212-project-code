<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Join House</title>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="724926326266-dhm6bt52ttmrlaessmt8rqp5oc6ueute.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>

<body>
    <h5>Before we get you setp up in your new Home... please login to your google gmail account by clicking the button below</h5>
    <h5>Then click the enter button. On the next page all you'll need to do is enter your house number provided in your Welcom Email</h5>
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <br/>
        <div>
            <br/>
            <h4>If you are "Signed in" into your google account, please click below</h4>
            <g:form name="jftForm" controller="house" action="joinform">
                <g:hiddenField name="googleProfile" value=""/>
                <g:submitButton name="joinform" value="Join"/>
            </g:form>
            <br/>
        </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>
        var subId;
        var email;
        var firstName;
        var lastName;

        function onSignIn(googleUser) {
            // The ID token you need to pass to your backend:
            // Useful data for your client-side scripts:
            var profile = googleUser.getBasicProfile();
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            console.log('Given Name: ' + profile.getGivenName());
            console.log('Family Name: ' + profile.getFamilyName());
            console.log("Image URL: " + profile.getImageUrl());
            console.log("Email: " + profile.getEmail());

            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
            subId = profile.getId();
            email = profile.getEmail();
            firstName = profile.getGivenName();
            lastName = profile.getFamilyName();

        };
        jQuery(function () {
            jQuery("[name='jftForm']").submit(function () {
                jQuery("[name='googleProfile']").val([firstName,lastName,subId,email]);
            });
        })
    </script>
</body>
</html>