<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club/Commitee management</title>
    <style>
        /* Embedded CSS */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            width: 100%;
            height: 100%;
            color: white;
            background: rgb(107, 103, 103);
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }

        .container::before {
            content: "";
            background: url(roorkee.webp) no-repeat center center/cover;
            position: absolute;
            height: 100%;
            width: 100%;
            opacity: 0.3;
            z-index: -1;
        }

        .container .navbar {
            height: 100px;
            display: flex;
        }

        .container .navbar .left {
            height: 100%;
            display: flex;
            float: left;
        }

        .container .navbar .left img {
            height: 100px;
            position: absolute;
            left: 35px;
        }

        .container .navbar .right {
            display: flex;
            height: 100px;
            float: right;
            position: absolute;
            right: 50px;
        }

        .container .navbar .right .language {
            margin: auto;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            padding: 7px 10px;
            color: white;
            background: none;
            cursor: pointer;
            margin-right: 15px;
        }

        .container .navbar .right .language option {
            background-color: grey;
        }

        .container .navbar .right form {
            margin: auto;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: 400;
            padding: 7px 17px;
            background: #e50914;
            cursor: pointer;
            outline: none;
            border-radius: 4px;
            border: none;
        }

        .container .navbar .right form button {
            margin: auto;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: 400;
            padding: 7px 17px;
            background: #e50914;
            cursor: pointer;
            outline: none;
            border-radius: 4px;
            border: none;
        }


        .container .navbar .right button a {
            text-decoration: none;
            color: white;
        }

        .container .title {
            padding: 70px 45px;
        }

        .container .title .content {
            width: 950px;
            margin: auto;
            padding: 75px 0;
            text-align: center;
        }

        .container .title .content h2 {
            font-size: 2.5rem;
            text-align: center;
            color: #f40612;
        }

        .container .title .content h3 {
            font-size: 1rem;
            margin: 18px 0;
            text-align: center;
            color: #fff;
        }

        .container .title .content form .email {
            width: 1000px;
            margin: auto;
        }

        .container .title .content form .email input {
            height: 60px;
            width: 450px;
            margin: auto;
            padding: 20px;
            font-size: 20px;
            outline: none;
        }

        .container .title .content form .email button {
            margin: auto;
            height: 60px;
            width: 180px;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            padding: 7px 17px;
            background: #e50914;
            cursor: pointer;
            outline: none;
            border-top-right-radius: 2px;
            border-bottom-right-radius: 2px;
            border: none;
            margin-left: -5px;
        }

        .container .title .content form .email button:hover {
            background-color: #f40612;
        }

        .container .title .content form .email button a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>

<body>
    <div class="container">
        <nav class="navbar">
            <div class="left">
                <img src="logo1.png" alt="">
            </div>
            <div class="right">
                <select name="language" class="language">
                    <option value="English">English</option>
                    <option value="Hindi">Hindi</option>
                </select>
               <form action="login"><button type="submit">LogIn</button></form>
            </div>
        </nav>

        <div class="title">
            <div class="content">
                <h2>The first college in North India to be awarded</h2>
                <h2><b>NAAC A++</b></h2>
                <form action="newsletter" method="post">
                    <h3>No. 1 in Uttarakhand, No. 5 in North India, and No. 49 in India</h3>
                    <h3>State-of-the-art educational infrastructure and vibrant campus life</h3>
                    <div class="email">
                        <input type="email" name="email" placeholder="Email address">
                        <button type="submit">Get Started ></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>


</html>
