# README
Blocmetrics is an Analyitcs tool to gather events from a source website.

It uses Javascript and Ruby on Rails.

Use this JS code to pull events to the api


```var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };



  blocmetrics.report('about page loaded');```
