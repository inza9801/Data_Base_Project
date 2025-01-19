<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Completed</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Trip Completed</h1>
    </header>
    <main>
        <section id="trip-complete">
            <h2>Your trip has been successfully completed!</h2>
            <p>Thank you for using the Dhaka City Transit System. We hope you had a smooth and convenient journey.</p>
            <button id="goHome">Go to Homepage</button>
        </section>
    </main>
    <footer>
        <p>© 2025 Dhaka City Transit System</p>
    </footer>
    <script>
        document.getElementById("goHome").addEventListener("click", () => {
            // Redirect to the homepage (index.html)
            window.location.href = "index.html";
        });
    </script>
</body>
</html>
