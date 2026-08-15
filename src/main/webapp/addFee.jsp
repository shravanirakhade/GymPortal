<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Fee Plan</title>

<style>

body {
    font-family: Arial, sans-serif;
    background: #f5f6fa;
    margin: 0;
}

.header {
    background: #1f2937;
    color: white;
    padding: 20px 35px;
}

.container {
    width: 500px;
    margin: 50px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    margin-bottom: 25px;
}

label {
    display: block;
    margin-top: 15px;
    font-weight: bold;
}

input, textarea {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 12px;
    margin-top: 25px;
    background: #16a34a;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

.back {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
}

</style>

</head>

<body>

<div class="header">

    <h2>🏋️ Universal Fitness - Admin</h2>

</div>


<div class="container">

    <h2>Add New Fee Plan</h2>

    <form action="saveFee.jsp" method="post">

        <label>Plan Name</label>

        <input type="text"
               name="plan_name"
               placeholder="Example: Gold"
               required>


        <label>Duration</label>

        <input type="text"
               name="duration"
               placeholder="Example: 6 Months"
               required>


        <label>Amount</label>

        <input type="number"
               step="0.01"
               name="amount"
               placeholder="Example: 5000"
               required>


        <label>Facilities</label>

        <textarea name="facilities"
                  rows="4"
                  placeholder="Example: Gym Equipment, Cardio, Trainer"
                  required></textarea>


        <button type="submit">
            Add Fee Plan
        </button>

    </form>


    <a class="back" href="adminFees.jsp">
        Back to Fee Structure
    </a>

</div>

</body>
</html>