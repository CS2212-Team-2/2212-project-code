<!DOCTYPE html>
<html>
<asset:stylesheet src="style.css"/>
<head>
    <title>HouseMates</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
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
    <h3 id="calender">BIG BOX GOES HERE
    <div>
    <div id="caleandar">


    </div>



    <!--Add buttons to initiate auth sequence and sign out-->
    <button id="authorize-button" style="display: block;">Authorize</button>
    <button id="signout-button" style="display: none;">Sign Out</button>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div class="popup" onclick="myFunction2()">Add an Event/Task
        <span class="popuptext" id="myPopup"><button onclick="myFunction()">Add </button></br>
            Year: <input type="text" id="YearInputEvent" value="YYYY">
            Month: <input type="text" id="MonthInputEvent" value="MM">
            Day: <input type="text" id="DayInputEvent" value="DD">
            Description: <input type="text" id="DescriptionInputEvent" value="Description">
            Summary/Title: <input type="text" id="SummaryInputEvent" value="Summary">
    </div>

    <pre id="content"></pre>



    <script async defer src="https://apis.google.com/js/api.js"
            onload="this.onload=function(){};handleClientLoad()"
            onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>

    <script>
    /*
    Author: Jack Ducasse;
    Version: 0.1.0;
    (◠‿◠✿)
    */

    var Calendar = function(model, options, date){
    // Default Values
    this.Options = {
    Color: '',
    LinkColor: '',
    NavShow: true,
    NavVertical: false,
    NavLocation: '',
    DateTimeShow: true,
    DateTimeFormat: 'mmm, yyyy',
    DatetimeLocation: '',
    EventClick: '',
    EventTargetWholeDay: false,
    DisabledDays: [],
    ModelChange: model
    };
    // Overwriting default values
    for(var key in options){
    this.Options[key] = typeof options[key]=='string'?options[key].toLowerCase():options[key];
    }

    model?this.Model=model:this.Model={};
    this.Today = new Date();

    this.Selected = this.Today
    this.Today.Month = this.Today.getMonth();
    this.Today.Year = this.Today.getFullYear();
    if(date){this.Selected = date}
    this.Selected.Month = this.Selected.getMonth();
    this.Selected.Year = this.Selected.getFullYear();

    this.Selected.Days = new Date(this.Selected.Year, (this.Selected.Month + 1), 0).getDate();
    this.Selected.FirstDay = new Date(this.Selected.Year, (this.Selected.Month), 1).getDay();
    this.Selected.LastDay = new Date(this.Selected.Year, (this.Selected.Month + 1), 0).getDay();

    this.Prev = new Date(this.Selected.Year, (this.Selected.Month - 1), 1);
    if(this.Selected.Month==0){this.Prev = new Date(this.Selected.Year-1, 11, 1);}
    this.Prev.Days = new Date(this.Prev.getFullYear(), (this.Prev.getMonth() + 1), 0).getDate();
    };

    function createCalendar(calendar, element, adjuster){
    if(typeof adjuster !== 'undefined'){
    var newDate = new Date(calendar.Selected.Year, calendar.Selected.Month + adjuster, 1);
    calendar = new Calendar(calendar.Model, calendar.Options, newDate);
    element.innerHTML = '';
    }else{
    for(var key in calendar.Options){
    typeof calendar.Options[key] != 'function' && typeof calendar.Options[key] != 'object' && calendar.Options[key]?element.className += " " + key + "-" + calendar.Options[key]:0;
    }
    }
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

    function AddSidebar(){
    var sidebar = document.createElement('div');
    sidebar.className += 'cld-sidebar';

    var monthList = document.createElement('ul');
    monthList.className += 'cld-monthList';

    for(var i = 0; i < months.length - 3; i++){
    var x = document.createElement('li');
    x.className += 'cld-month';
    var n = i - (4 - calendar.Selected.Month);
    // Account for overflowing month values
    if(n<0){n+=12;}
    else if(n>11){n-=12;}
    // Add Appropriate Class
    if(i==0){
    x.className += ' cld-rwd cld-nav';
    x.addEventListener('click', function(){
    typeof calendar.Options.ModelChange == 'function'?calendar.Model = calendar.Options.ModelChange():calendar.Model = calendar.Options.ModelChange;
    createCalendar(calendar, element, -1);});
    x.innerHTML += '<svg height="15" width="15" viewBox="0 0 100 75" fill="rgba(255,255,255,0.5)"><polyline points="0,75 100,75 50,0"></polyline></svg>';
    }
    else if(i==months.length - 4){
    x.className += ' cld-fwd cld-nav';
    x.addEventListener('click', function(){
    typeof calendar.Options.ModelChange == 'function'?calendar.Model = calendar.Options.ModelChange():calendar.Model = calendar.Options.ModelChange;
    createCalendar(calendar, element, 1);} );
    x.innerHTML += '<svg height="15" width="15" viewBox="0 0 100 75" fill="rgba(255,255,255,0.5)"><polyline points="0,0 100,0 50,75"></polyline></svg>';
    }
    else{
    if(i < 4){x.className += ' cld-pre';}
    else if(i > 4){x.className += ' cld-post';}
    else{x.className += ' cld-curr';}

    //prevent losing var adj value (for whatever reason that is happening)
    (function () {
    var adj = (i-4);
    //x.addEventListener('click', function(){createCalendar(calendar, element, adj);console.log('kk', adj);} );
    x.addEventListener('click', function(){
    typeof calendar.Options.ModelChange == 'function'?calendar.Model = calendar.Options.ModelChange():calendar.Model = calendar.Options.ModelChange;
    createCalendar(calendar, element, adj);} );
    x.setAttribute('style', 'opacity:' + (1 - Math.abs(adj)/4));
    x.innerHTML += months[n].substr(0,3);
    }()); // immediate invocation

    if(n==0){
    var y = document.createElement('li');
    y.className += 'cld-year';
    if(i<5){
    y.innerHTML += calendar.Selected.Year;
    }else{
    y.innerHTML += calendar.Selected.Year + 1;
    }
    monthList.appendChild(y);
    }
    }
    monthList.appendChild(x);
    }
    sidebar.appendChild(monthList);
    if(calendar.Options.NavLocation){
    document.getElementById(calendar.Options.NavLocation).innerHTML = "";
    document.getElementById(calendar.Options.NavLocation).appendChild(sidebar);
    }
    else{element.appendChild(sidebar);}
    }

    var mainSection = document.createElement('div');
    mainSection.className += "cld-main";

    function AddDateTime(){
    var datetime = document.createElement('div');
    datetime.className += "cld-datetime";
    if(calendar.Options.NavShow && !calendar.Options.NavVertical){
    var rwd = document.createElement('div');
    rwd.className += " cld-rwd cld-nav";
    rwd.addEventListener('click', function(){createCalendar(calendar, element, -1);} );
    rwd.innerHTML = '<svg height="15" width="15" viewBox="0 0 75 100" fill="rgba(0,0,0,0.5)"><polyline points="0,50 75,0 75,100"></polyline></svg>';
    datetime.appendChild(rwd);
    }
    var today = document.createElement('div');
    today.className += ' today';
    today.innerHTML = months[calendar.Selected.Month] + ", " + calendar.Selected.Year;
    datetime.appendChild(today);
    if(calendar.Options.NavShow && !calendar.Options.NavVertical){
    var fwd = document.createElement('div');
    fwd.className += " cld-fwd cld-nav";
    fwd.addEventListener('click', function(){createCalendar(calendar, element, 1);} );
    fwd.innerHTML = '<svg height="15" width="15" viewBox="0 0 75 100" fill="rgba(0,0,0,0.5)"><polyline points="0,0 75,50 0,100"></polyline></svg>';
    datetime.appendChild(fwd);
    }
    if(calendar.Options.DatetimeLocation){
    document.getElementById(calendar.Options.DatetimeLocation).innerHTML = "";
    document.getElementById(calendar.Options.DatetimeLocation).appendChild(datetime);
    }
    else{mainSection.appendChild(datetime);}
    }

    function AddLabels(){
    var labels = document.createElement('ul');
    labels.className = 'cld-labels';
    var labelsList = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    for(var i = 0; i < labelsList.length; i++){
    var label = document.createElement('li');
    label.className += "cld-label";
    label.innerHTML = labelsList[i];
    labels.appendChild(label);
    }
    mainSection.appendChild(labels);
    }
    function AddDays(){
    // Create Number Element
    function DayNumber(n){
    var number = document.createElement('p');
    number.className += "cld-number";
    number.innerHTML += n;
    return number;
    }
    var days = document.createElement('ul');
    days.className += "cld-days";
    // Previous Month's Days
    for(var i = 0; i < (calendar.Selected.FirstDay); i++){
    var day = document.createElement('li');
    day.className += "cld-day prevMonth";
    //Disabled Days
    var d = i%7;
    for(var q = 0; q < calendar.Options.DisabledDays.length; q++){
    if(d==calendar.Options.DisabledDays[q]){
    day.className += " disableDay";
    }
    }

    var number = DayNumber((calendar.Prev.Days - calendar.Selected.FirstDay) + (i+1));
    day.appendChild(number);

    days.appendChild(day);
    }
    // Current Month's Days
    for(var i = 0; i < calendar.Selected.Days; i++){
    var day = document.createElement('li');
    day.className += "cld-day currMonth";
    //Disabled Days
    var d = (i + calendar.Selected.FirstDay)%7;
    for(var q = 0; q < calendar.Options.DisabledDays.length; q++){
    if(d==calendar.Options.DisabledDays[q]){
    day.className += " disableDay";
    }
    }
    var number = DayNumber(i+1);
    // Check Date against Event Dates
    for(var n = 0; n < calendar.Model.length; n++){
    var evDate = calendar.Model[n].Date;
    var toDate = new Date(calendar.Selected.Year, calendar.Selected.Month, (i+1));
    if(evDate.getTime() == toDate.getTime()){
    number.className += " eventday";
    var title = document.createElement('span');
    title.className += "cld-title";
    if(typeof calendar.Model[n].Link == 'function' || calendar.Options.EventClick){
    var a = document.createElement('a');
    a.setAttribute('href', '#');
    a.innerHTML += calendar.Model[n].Title;
    if(calendar.Options.EventClick){
    var z = calendar.Model[n].Link;
    if(typeof calendar.Model[n].Link != 'string'){
    a.addEventListener('click', calendar.Options.EventClick.bind.apply(calendar.Options.EventClick, [null].concat(z)) );
    if(calendar.Options.EventTargetWholeDay){
    day.className += " clickable";
    day.addEventListener('click', calendar.Options.EventClick.bind.apply(calendar.Options.EventClick, [null].concat(z)) );
    }
    }else{
    a.addEventListener('click', calendar.Options.EventClick.bind(null, z) );
    if(calendar.Options.EventTargetWholeDay){
    day.className += " clickable";
    day.addEventListener('click', calendar.Options.EventClick.bind(null, z) );
    }
    }
    }else{
    a.addEventListener('click', calendar.Model[n].Link);
    if(calendar.Options.EventTargetWholeDay){
    day.className += " clickable";
    day.addEventListener('click', calendar.Model[n].Link);
    }
    }
    title.appendChild(a);
    }else{
    title.innerHTML += '<a href="' + calendar.Model[n].Link + '">' + calendar.Model[n].Title + '</a>';
    }
    number.appendChild(title);
    }
    }
    day.appendChild(number);
    // If Today..
    if((i+1) == calendar.Today.getDate() && calendar.Selected.Month == calendar.Today.Month && calendar.Selected.Year == calendar.Today.Year){
    day.className += " today";
    }
    days.appendChild(day);
    }
    // Next Month's Days
    // Always same amount of days in calander
    var extraDays = 13;
    if(days.children.length>35){extraDays = 6;}
    else if(days.children.length<29){extraDays = 20;}

    for(var i = 0; i < (extraDays - calendar.Selected.LastDay); i++){
    var day = document.createElement('li');
    day.className += "cld-day nextMonth";
    //Disabled Days
    var d = (i + calendar.Selected.LastDay + 1)%7;
    for(var q = 0; q < calendar.Options.DisabledDays.length; q++){
    if(d==calendar.Options.DisabledDays[q]){
    day.className += " disableDay";
    }
    }

    var number = DayNumber(i+1);
    day.appendChild(number);

    days.appendChild(day);
    }
    mainSection.appendChild(days);
    }
    if(calendar.Options.Color){
    mainSection.innerHTML += '<style>.cld-main{color:' + calendar.Options.Color + ';}</style>';
    }
    if(calendar.Options.LinkColor){
    mainSection.innerHTML += '<style>.cld-title a{color:' + calendar.Options.LinkColor + ';}</style>';
    }
    element.appendChild(mainSection);

    if(calendar.Options.NavShow && calendar.Options.NavVertical){
    AddSidebar();
    }
    if(calendar.Options.DateTimeShow){
    AddDateTime();
    }
    AddLabels();
    AddDays();
    }

    function caleandar(el, data, settings){
    var obj = new Calendar(data, settings);
    createCalendar(obj, el);
    }
    </script>
    <script>
    var anDate;
    var year =[];
    var month = [];
    var day = [];
    var summary = [];
    var desc = [];
    // Client ID and API key from the Developer Console
    var CLIENT_ID = '731832964818-uecs4clv5qsfubet2rbbr1co235pbost.apps.googleusercontent.com';

    // Array of API discovery doc URLs for APIs used by the quickstart
    var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

    // Authorization scopes required by the API; multiple scopes can be
    // included, separated by spaces.
    var SCOPES = "https://www.googleapis.com/auth/calendar";

    var authorizeButton = document.getElementById('authorize-button');
    var signoutButton = document.getElementById('signout-button');


    /**
    *  On load, called to load the auth2 library and API client library.
    */
    function handleClientLoad() {


    gapi.load('client:auth2', initClient);

    }

    /**
    *  Initializes the API client library and sets up sign-in state
    *  listeners.
    */
    function initClient() {

    gapi.client.init({
    discoveryDocs: DISCOVERY_DOCS,
    clientId: CLIENT_ID,
    scope: SCOPES
    }).then(function () {
    // Listen for sign-in state changes.
    gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

    // Handle the initial sign-in state.
    updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
    authorizeButton.onclick = handleAuthClick;
    signoutButton.onclick = handleSignoutClick;
    });
    }

    /**
    *  Called when the signed in status changes, to update the UI
    *  appropriately. After a sign-in, the API is called.
    */
    function updateSigninStatus(isSignedIn) {
    if (isSignedIn) {
    authorizeButton.style.display = 'none';
    signoutButton.style.display = 'block';
    listUpcomingEvents();
    } else {
    authorizeButton.style.display = 'block';
    signoutButton.style.display = 'none';
    }
    }

    /**
    *  Sign in the user upon button click.
    */
    function handleAuthClick(event) {
    gapi.auth2.getAuthInstance().signIn();
    }

    /**
    *  Sign out the user upon button click.
    */
    function handleSignoutClick(event) {
    gapi.auth2.getAuthInstance().signOut();
    }

    /**
    * Append a pre element to the body containing the given message
    * as its text node. Used to display the results of the API call.
    *
    * @param {string} message Text to be placed in pre element.
    */
    function popupMessage(){
        alert("Description of the event");
    }


    function appendPre(message) {
    var events = [];
    var b = {};
    for (i = 0; i < year.length; i++) {
    //b = {'Date': new Date(year[i], month[i], day[i]), 'Title': summary[i], 'Link': desc[i]}
    b = {'Date': new Date(year[i], month[i], day[i]), 'Title': summary[i], 'Link': function(){popupMessage()}};
    events.push(b);
    }


    var settings = {};

    var element = document.getElementById('caleandar');

    caleandar(element, events, settings);

    }

    /**
    * Print the summary and start datetime/date of the next ten events in
    * the authorized user's calendar. If no events are found an
    * appropriate message is printed.
    */

    listUpcomingEvents();
    function listUpcomingEvents() {
    gapi.client.calendar.events.list({
    'calendarId': 'primary',
    //'timeMin': (new Date()).toISOString(),
    'showDeleted': false,
    'singleEvents': true,
    //'maxResults': 10,
    'orderBy': 'startTime'
    }).then(function(response) {
    var events = response.result.items;


    if (events.length > 0) {
    for (i = 0; i < events.length; i++) {
    var event = events[i];
    var when = event.start.dateTime;
    if (when){
    anDate = new Date(when);
    }else{
    anDate = new Date(event.start.date);
    }


    summary.push(event.summary);
    desc.push(event.description);
    year.push(anDate.getFullYear());
    month.push(anDate.getMonth());
    day.push(anDate.getDate());

    if (!when) {
    when = event.start.date;
    }
    }
    appendPre(event.summary + ' ' + event.description + ' (' + when + ')')
    } else {
    appendPre('No upcoming events found.');
    }
    });
    }


    function myFunction() {
    var test = document.getElementById("YearInputEvent").value;

    var event = {
    'summary': document.getElementById("SummaryInputEvent").value,
    'description': document.getElementById("DescriptionInputEvent").value,
    'start': {
    'dateTime': document.getElementById("YearInputEvent").value + '-' +document.getElementById("MonthInputEvent").value + '-' + document.getElementById("DayInputEvent").value + 'T01:00:00-23:00',
    'timeZone': 'America/Toronto'
    },
    'end': {
    'dateTime': document.getElementById("YearInputEvent").value + '-' +document.getElementById("MonthInputEvent").value + '-' + document.getElementById("DayInputEvent").value + 'T01:00:00-23:00',
    'timeZone': 'America/Toronto'
    },
    'recurrence': [
    //'RRULE:FREQ=DAILY;COUNT=2'
    ],
    'attendees': [
    //{'email': 'lpage@example.com'}
    ],
    'reminders': {
    'useDefault': false,
    'overrides': [
    {'method': 'email', 'minutes': 24 * 60},
    {'method': 'popup', 'minutes': 10}
    ]
    }
    };

    var request = gapi.client.calendar.events.insert({
    'calendarId': 'nickchengswps@yahoo.ca',
    'resource': event
    });

    request.execute(function(event) {
    alert('Event created: ' + event.htmlLink);
    });
    }

    /*

    */



    function myFunction2(){
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
    }
    </script>
    </div>

    </h3>
    <div id="caleandar">
    </div>
    <!--Add buttons to initiate auth sequence and sign out-->
    <pre id="content"></pre>
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
