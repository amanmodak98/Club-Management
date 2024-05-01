<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>/* Global Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.header {
    background-color: #333;
    color: #fff;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.menu {
    font-size: 24px;
    cursor: pointer;
}

.sidebar {
    background-color: #444;
    color: #fff;
    width: 200px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: -200px;
    transition: left 0.3s ease;
    padding-top: 60px;
}

.sidebar a {
    display: block;
    color: #fff;
    text-decoration: none;
    padding: 10px;
    transition: background-color 0.3s ease;
}

.sidebar a:hover {
    background-color: #555;
}

.main-content {
    margin-left: 200px;
    padding: 20px;
}

.content-item {
    display: none;
}

.button {
    text-align: center;
    margin-top: 20px;
}

.button button {
    padding: 10px 20px;
    margin: 5px;
    border: none;
    background-color: #333;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button button:hover {
    background-color: #555;
}
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <style>
        /* Your CSS styles */
    </style>
</head>
<body>

    <div class="header">
        <h1 id="heading">Rit Roorkee</h1>
        <div class="menu" onclick="toggleMenu()">☰</div>
    </div>

    <div class="sidebar" id="sidebar">
        <a href="#" onclick="showContent('calendar')"><i class="fas fa-calendar-alt"></i> Calendar</a>
        <a href="#" onclick="showContent('eventForm')"><i class="fas fa-calendar-plus"></i> Event Form</a>
        <a href="#" onclick="showContent('feedback')"><i class="fas fa-comment"></i> Feedback</a>
        <a href="#" onclick="showContent('events')"><i class="fas fa-calendar-check"></i> Events</a>
        <a href="#" onclick="showContent('helpCenter')"><i class="fas fa-question-circle"></i> Help Center</a>
        <a href="#" onclick="showContent('remind')"><i class="fas fa-bell"></i> Remind</a>
    </div>

    <div class="main-content">
        <div id="calendar" class="content-item"> <!-- Calendar container -->
            <div id="calendarContainer"></div> <!-- Calendar will be populated here -->
        </div>
        <div id="eventForm" class="content-item">Event form...</div>
        <div id="feedback" class="content-item">Feedback content...</div>
        <div id="events" class="content-item">Events content...</div>
        <div id="helpCenter" class="content-item">Help Center content...</div>
        <div id="remind" class="content-item">Remind content...</div>
    </div>
    <div class="button">
       <form action="event" method="post">
        <button type="submit" name="action" value="Add Events">Add Events</button>
        <button type="submit" name="action" value="Aprove Event">Approve Event</button>
        <button type="submit" name="action" value="check status">Check Status</button>
        <button type="submit" name="action" value="drop events">Drop Events</button> 
        <button type="submit" name="action" value="previous events">Previous Events</button>
    </form> 
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <script src="dean.js"></script>

</body>
</html>