document.getElementById("suggestRoute").addEventListener("click", async () => {
    const source = document.getElementById("source").value.trim();
    const destination = document.getElementById("destination").value.trim();
    const suggestedRouteDiv = document.getElementById("suggestedRoute");

    if (!source || !destination) {
        suggestedRouteDiv.innerHTML = "<p>Please provide both source and destination.</p>";
        return;
    }

    try {
        const response = await fetch("suggestRoute.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ source, destination })
        });
        const data = await response.json();

        if (response.ok) {
            suggestedRouteDiv.innerHTML = `
                <p><strong>Suggested Route:</strong> ${data.route}</p>
                <p><strong>Recommended Bus Company:</strong> ${data.company}</p>
            `;

            // Add a button to book the trip after suggesting the route
            suggestedRouteDiv.innerHTML += `
                <button id="bookBusTrip">Book Trip</button>
            `;

            document.getElementById("bookBusTrip").addEventListener("click", () => {
                // Navigate to the booking page with the source, destination, and transit type
                window.location.href = `tripInfo.php?source=${encodeURIComponent(source)}&destination=${encodeURIComponent(destination)}&transit_type=bus`;
            });
        } else {
            suggestedRouteDiv.innerHTML = `<p>Error: ${data.message}</p>`;
        }
    } catch (error) {
        suggestedRouteDiv.innerHTML = `<p>Error fetching the route. Please try again later.</p>`;
        console.error("Error:", error);
    }
});

