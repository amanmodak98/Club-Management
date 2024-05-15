<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
/* Global Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #87CEEB; /* Light sky blue background */
}

.header {
    background-color: #fff; /* White header background */
    color: #333; /* Dark text color */
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    height: 150px;
    width: 98%;
    margin-right: 5px;
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
    box-shadow: 2px 0 4px rgba(0, 0, 0, 0.1);
}

.sidebar a {
    display: block;
    color: #fff;
    text-decoration: none;
    padding: 20px;
    transition: background-color 0.3s ease;
    border-bottom: 1px solid #555; /* Add border to separate links */
}

.sidebar a:last-child {
    border-bottom: none; /* Remove border from last link */
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
    padding: 20px 40px;
    margin: 10px;
    border: none;
    background-color: #007bff; /* Dark blue button color */
    color: #fff;
    cursor: pointer;
    border-radius: 10px;
    transition: background-color 0.3s ease;
    width: 250px;
    height: 250px;
}

.button button:hover {
    background-color: #0056b3;
}

/* Hover effect on buttons */
.button button:hover {
    transform: translateY(-2px);
}

/* Additional styles for header */
#heading {
    font-size: 36px; /* Larger text size for the header */
}

/* Custom scrollbar for sidebar */
.sidebar {
    overflow-y: auto;
    scrollbar-width: thin;
    scrollbar-color: #666 transparent;
}

.sidebar::-webkit-scrollbar {
    width: 8px;
}

.sidebar::-webkit-scrollbar-thumb {
    background-color: #666;
    border-radius: 4px;
}

h1 {
    font-size: 50px; /* Set the font size */
    color: #333; /* Set the text color */
    margin: 10px 0; /* Set the top and bottom margin */
    /* You can add more styles as needed, such as font-family, font-weight, etc. */
    margin-left: 40px;
    margin-right: 40px;
}

.menu{
font-size: 50px;
margin-right: 10px;
}


#logo {
    max-width: 510.6px; /* Adjust the width of the logo as needed */
    height: 148px;
    margin-left: 5px;
}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</style>
</head>
<body>

<div class="header">
    <img id="logo" alt="" src="https://ritroorkee.com/wp-content/uploads/2024/01/RIT-NAAC-LOGO-1.pdf-1.png">
    <h1>The first college in North India to be awarded NAAC A++</h1>
    <div class="menu" onclick="toggleMenu()">=</div>
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