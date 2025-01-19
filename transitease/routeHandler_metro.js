document.getElementById("suggestMetroRoute").addEventListener("click", async () => {
    const source = document.getElementById("metroSource").value.trim();
    const destination = document.getElementById("metroDestination").value.trim();
    const suggestedRouteDiv = document.getElementById("suggestedMetroRoute");

    if (!source || !destination) {
        suggestedRouteDiv.innerHTML = "<p>Please provide both source and destination.</p>";
        return;
    }

    try {
        const response = await fetch("suggestRoute_metro.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ source, destination })
        });
        const data = await response.json();

        if (response.ok) {
            suggestedRouteDiv.innerHTML = `
                <p><strong>Suggested Metro Route:</strong> ${data.route}</p>
                <p><strong>Recommended Metro Company:</strong> ${data.company}</p>
            `;

            // Add a button to book the trip after suggesting the route
            suggestedRouteDiv.innerHTML += `
                <button id="bookMetroTrip">Book Metro Trip</button>
            `;

            document.getElementById("bookMetroTrip").addEventListener("click", () => {
                // Navigate to the booking page with the source, destination, and transit type
                window.location.href = `tripInfo.php?source=${encodeURIComponent(source)}&destination=${encodeURIComponent(destination)}&transit_type=metro`;
            });
        } else {
            suggestedRouteDiv.innerHTML = `<p>Error: ${data.message}</p>`;
        }
    } catch (error) {
        suggestedRouteDiv.innerHTML = `<p>Error fetching the metro route. Please try again later.</p>`;
        console.error("Error:", error);
    }
});

