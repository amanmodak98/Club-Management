<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        body, html {
            min-height: 100%;
        }
        body, div, form, input, select, textarea, label { 
            padding: 0;
            margin: 0;
            outline: none;
            font-family: Roboto, Arial, sans-serif;
            font-size: 14px;
            color: #666;
            line-height: 22px;
        }
        h1 {
            position: absolute;
            margin: 0;
            font-size: 50px;
            color: #fff;
            z-index: 2;
            line-height: 83px;
        }
        legend {
            padding: 10px;      
            font-family: Roboto, Arial, sans-serif;
            font-size: 18px;
            color: #fff;
            background-color: #006622;
        }
        textarea {
            width: calc(100% - 12px);
            padding: 5px;
        }
        .testbox {
            display: flex;
            justify-content: center;
            align-items: center;
            height: inherit;
            padding: 20px;
        }
        form {
            width: 100%;
            padding: 20px;
            border-radius: 6px;
            background: #fff;
            box-shadow: 0 0 8px #006622; 
        }
        .banner {
            position: relative;
            height: 250px;
            background-image: url("/uploads/media/default/0001/02/b23a2c8c49b8e43249487140e4c2e22a63bd7cb8.jpeg");  
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .banner::after {
            content: "";
            background-color: rgba(0, 0, 0, 0.4); 
            position: absolute;
            width: 100%;
            height: 100%;
        }
        input, select, textarea {
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input {
            width: calc(100% - 10px);
            padding: 5px;
        }
        input[type="date"] {
            padding: 4px 5px;
        }
        textarea {
            width: calc(100% - 12px);
            padding: 5px;
        }
        .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
            color:  #006622;
        }
        .item input:hover, .item select:hover, .item textarea:hover {
            border: 1px solid transparent;
            box-shadow: 0 0 3px 0  #006622;
            color: #006622;
        }
        .item {
            position: relative;
            margin: 10px 0;
        }
        .item span {
            color: red;
        }
        input[type="date"]::-webkit-inner-spin-button {
            display: none;
        }
        .item i, input[type="date"]::-webkit-calendar-picker-indicator {
            position: absolute;
            font-size: 20px;
            color: #00b33c;
        }
        .item i {
            right: 1%;
            top: 30px;
            z-index: 1;
        }
        .week {
            display:flex;
            justify-content:space-between;
        }
        .columns {
            display:flex;
            justify-content:space-between;
            flex-direction:row;
            flex-wrap:wrap;
        }
        .columns div {
            width:48%;
        }
        [type="date"]::-webkit-calendar-picker-indicator {
            right: 1%;
            z-index: 2;
            opacity: 0;
            cursor: pointer;
        }
        input[type=radio], input[type=checkbox]  {
            display: none;
        }
        label.radio {
            position: relative;
            display: inline-block;
            margin: 5px 20px 15px 0;
            cursor: pointer;
        }
        .question span {
            margin-left: 30px;
        }
        .question-answer label {
            display: block;
        }
        label.radio:before {
            content: "";
            position: absolute;
            left: 0;
            width: 17px;
            height: 17px;
            border-radius: 50%;
            border: 2px solid #ccc;
        }
        input[type=radio]:checked + label:before, label.radio:hover:before {
            border: 2px solid  #006622;
        }
        label.radio:after {
            content: "";
            position: absolute;
            top: 6px;
            left: 5px;
            width: 8px;
            height: 4px;
            border: 3px solid  #006622;
            border-top: none;
            border-right: none;
            transform: rotate(-45deg);
            opacity: 0;
        }
        input[type=radio]:checked + label:after {
            opacity: 1;
        }
        .flax {
            display:flex;
            justify-content:space-around;
        }
        .btn-block {
            margin-top: 10px;
            text-align: center;
        }
        button {
            width: 150px;
            padding: 10px;
            border: none;
            border-radius: 5px; 
            background:  #006622;
            font-size: 16px;
            color: #fff;
            cursor: pointer;
        }
        button:hover {
            background:  #00b33c;
        }
        @media (min-width: 568px) {
            .name-item, .city-item {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }
            .name-item input, .name-item div {
                width: calc(50% - 20px);
            }
            .name-item div input {
                width:97%;
            }
            .name-item div label {
                display:block;
                padding-bottom:5px;
            }
        }
    </style>
</head>
<body>
    <h2>Add Event</h2>
    <form action="Logout">
    <button type="submit" name="action">Logout</button>
    </form>
    
     <form action="AddEvent" method="post" class="testbox">
        <div class="banner"></div>
        <fieldset>
            <legend>Event Information</legend>
            <div class="columns">
                <div class="item">
                    <label for="user_id">Proposer User ID:<span>*</span></label>
                    <!-- Display the fetched proposer name here -->
                    <input type="text" id="user_id" name="user_id" value="${sessionScope.uname}" readonly>
                </div>
                <div class="item">
                    <label for="proposer_name">Proposer Name:<span>*</span></label>
                    <input type="text" id="proposer_name" name="proposer_name" required>
                </div>
                <div class="item">
                    <label for="event_name">Event Name:<span>*</span></label>
                    <input type="text" id="event_name" name="event_name" required>
                </div>
            </div>
            <div class="item">
                <label for="event_description">Event Description:<span>*</span></label>
                <textarea id="event_description" name="event_description" rows="4" cols="50" required></textarea>
            </div>
            <div class="columns">
                <div class="item">
                    <label for="venue">Venue:<span>*</span></label>
                    <select id="venue" name="venue" required>
                        <option disabled selected value="">Select Venue</option>
                        <option value="A Block Auditorium">A Block Auditorium</option>
                        <option value="C Block Seminar Hall">C Block Seminar Hall</option>
                        <option value="B15 Lab">B15 Lab</option>
                        <option value="B26 Lab">B26 Lab</option>
                        <option value="PMC Ground">PMC Ground</option>
                        <option value="A Block Lawn">A Block Lawn</option>
                    </select>
                </div>
                <div class="item">
                    <label for="event_date">Event Date:<span>*</span></label>
                    <input type="date" id="event_date" name="event_date" required>
                </div>
            </div>
            <div class="columns">
                <div class="item">
                    <label for="from_time">From Time:<span>*</span></label>
                    <input type="time" id="from_time" name="from_time" required>
                </div>
                <div class="item">
                    <label for="to_time">To Time:<span>*</span></label>
                    <input type="time" id="to_time" name="to_time" required>
                </div>
            </div>
        </fieldset>
        <div class="btn-block">
            <button type="submit" href="/">Submit</button>
        </div>
    </form>

</body>
</html>