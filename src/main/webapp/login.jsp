<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Universal Fitness - Login</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;

    min-height: 100vh;

    display: flex;
    justify-content: center;
    align-items: center;

    color: #1f2937;

    /* Attractive gym-style background */
    background:
        radial-gradient(circle at 15% 20%, rgba(59, 130, 246, 0.35), transparent 25%),
        radial-gradient(circle at 85% 80%, rgba(37, 99, 235, 0.30), transparent 25%),
        linear-gradient(135deg, #0f172a, #1e293b, #111827);

    position: relative;
    overflow: hidden;
}

/* Decorative gym-style background circles */

body::before {
    content: "";
    position: absolute;

    width: 450px;
    height: 450px;

    border: 2px solid rgba(255, 255, 255, 0.06);
    border-radius: 50%;

    top: -180px;
    left: -150px;
}

body::after {
    content: "";
    position: absolute;

    width: 550px;
    height: 550px;

    border: 2px solid rgba(96, 165, 250, 0.08);
    border-radius: 50%;

    bottom: -250px;
    right: -180px;
}
/* Main Login Area */

.login-wrapper {
    width: 900px;
    min-height: 520px;

    background: white;

    border-radius: 18px;
    overflow: hidden;

    display: flex;

    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.35);

    position: relative;
    z-index: 2;
}

/* Left Side */

.left-section {
    width: 50%;
    background: #1f2937;
    color: white;
    padding: 55px 45px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.logo {
    font-size: 45px;
    margin-bottom: 20px;
}

.left-section h1 {
    font-size: 38px;
    margin-bottom: 15px;
}

.left-section h1 span {
    color: #60a5fa;
}

.left-section p {
    color: #d1d5db;
    font-size: 16px;
    line-height: 1.7;
}

.features {
    margin-top: 30px;
}

.feature {
    margin: 15px 0;
    color: #e5e7eb;
    font-size: 15px;
}


/* Right Side */

.right-section {
    width: 50%;
    padding: 55px 50px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.right-section h2 {
    font-size: 30px;
    color: #1f2937;
    margin-bottom: 8px;
}

.subtitle {
    color: #777;
    margin-bottom: 30px;
}


/* Input */

.input-group {
    margin-bottom: 20px;
}

.input-group label {
    display: block;
    font-weight: bold;
    color: #374151;
    margin-bottom: 8px;
}

.input-group input {
    width: 100%;
    padding: 13px 15px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
    transition: 0.3s;
}

.input-group input:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
}


/* Login Button */

.login-btn {
    width: 100%;
    padding: 14px;
    background: #1f2937;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.login-btn:hover {
    background: #111827;
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
}


/* Footer */

.footer-text {
    text-align: center;
    margin-top: 25px;
    color: #888;
    font-size: 13px;
}


/* Responsive */

@media (max-width: 800px) {

    .login-wrapper {
        width: 90%;
        flex-direction: column;
    }

    .left-section,
    .right-section {
        width: 100%;
    }

    .left-section {
        padding: 35px;
    }

    .right-section {
        padding: 35px;
    }

}

</style>

</head>


<body>


<div class="login-wrapper">


    <!-- LEFT SIDE -->

    <div class="left-section">

        <div class="logo">
            🏋️
        </div>

        <h1>
            Universal <span>Fitness</span>
        </h1>

        <p>
            Transform your body, strengthen your mind,
            and achieve your fitness goals with Universal Fitness.
        </p>


        <div class="features">

            <div class="feature">
                💪 Professional Training
            </div>

            <div class="feature">
                🏋️ Modern Gym Equipment
            </div>

            <div class="feature">
                ❤️ Personalized Fitness Plans
            </div>

        </div>

    </div>


    <!-- RIGHT SIDE -->

    <div class="right-section">

        <h2>Welcome Back!</h2>

        <p class="subtitle">
            Login to access your fitness dashboard.
        </p>


        <form action="LoginServlet" method="post">


            <div class="input-group">

                <label>Username</label>

                <input type="text"
                       name="username"
                       placeholder="Enter your username"
                       required>

            </div>


            <div class="input-group">

                <label>Password</label>

                <input type="password"
                       name="password"
                       placeholder="Enter your password"
                       required>

            </div>


            <button class="login-btn"
                    type="submit">

                LOGIN

            </button>


        </form>


        <p class="footer-text">
            © 2026 Universal Fitness | Gym Management System
        </p>

    </div>


</div>


</body>

</html>