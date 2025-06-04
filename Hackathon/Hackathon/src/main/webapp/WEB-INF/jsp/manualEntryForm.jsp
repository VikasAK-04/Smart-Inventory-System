<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Manual Tomato Entry</title>
    <style>
        body {
            padding: 40px;
            font-family: Poppins, sans-serif;
            background-color: #222;
            color: white;
        }
        form {
            max-width: 400px;
        }
        input[type="text"], input[type="number"] {
            padding: 10px;
            width: 100%;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
            font-size: 1rem;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background: linear-gradient(to right, #92fe9d, #00c9ff);
            border-radius: 25px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
        }
    </style>
</head>
<body>
    <h2>🍅 Add Tomato Manually</h2>
    <form action="/addManual" method="post">
        <input type="text" name="name" placeholder="Tomato Name" required />
        <input type="number" name="weight" placeholder="Weight (kg)" step="0.01" required />
        <input type="number" name="freshnessDays" placeholder="Freshness Days" min="1" required />
        <input type="submit" value="Add Tomato Manually" />
    </form>
</body>
</html>
