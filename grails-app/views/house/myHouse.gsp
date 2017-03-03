<!DOCTYPE html>
<html>
<asset:stylesheet src="style.css"/>
<head>
    <title>HouseMates</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/theme3.css"/>
</head>
<body>
<!--code for top right corner, user name, logout and add person -->
<div id="topblock">
    <div class="inner" id="add"><g:form controller="EmailSender" action="index">
        <g:submitButton name="addRoommate" controller="EmailSender" action="index" value="Add Person" />
    </g:form></div>
    <div class="inner"><h2 id="title">HouseMates</h2></div>
    <div class="inner" id="logout"><g:form controller="PersonHouse" action="logout">
        <g:submitButton name="logout" controller="PersonHouse" action="logout" value="Log Out" />
    </g:form></div>
</div>
<br/>
<div><h3 id="welcome">Welcome Home, ${user}!</h3></div>
<div>
    <h3 id="calender">BIG BOX GOES HERE</h3>
    <p>Google Calendar API Quickstart</p>
    <div id="caleandar">
    </div>
    <p>Google Calendar API Quickstart</p>
    <!--Add buttons to initiate auth sequence and sign out-->
    <pre id="content"></pre>
    <script type="text/javascript" src="js/caleandar.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script async defer src="https://apis.google.com/js/api.js"
            onload="this.onload=function(){};handleClientLoad()"
            onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
    <!-- returns the users roommates -->
    <h4 id="leaderboard">${user}'s HouseMates</h4>
    <g:each in="${persons}" var="item">
        <g:each in="${item}" var="subItem">
            <p>Name: ${subItem[0]}</p>
            <p>Email: ${subItem[1]}</p>
        </g:each>
    </g:each>
</body>
</html>
