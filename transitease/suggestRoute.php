<?php
header("Content-Type: application/json");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $input = json_decode(file_get_contents("php://input"), true);

    if (isset($input["source"], $input["destination"])) {
        $source = $input["source"];
        $destination = $input["destination"];

        // Database connection
        $conn = new mysqli("localhost", "root", "", "transit_system");

        if ($conn->connect_error) {
            echo json_encode(["message" => "Database connection failed."]);
            http_response_code(500);
            exit();
        }

        // Query to find the best route with minimum stops and break ties by bus count
        $query = "
        WITH route_details AS (
            SELECT 
                r.name AS route_name,
                bc.name AS bus_company,
                ABS(s2.stop_number - s1.stop_number) AS stops_to_cross,
                COUNT(b.bus_id) AS bus_count
            FROM 
                stops s1
            JOIN 
                stops s2 ON s1.route_id = s2.route_id
            JOIN 
                routes r ON s1.route_id = r.route_id
            JOIN 
                bus_companies bc ON r.company_id = bc.company_id
            LEFT JOIN 
                buses b ON bc.company_id = b.company_id
            WHERE 
                s1.name = ?
                AND s2.name = ?
            GROUP BY 
                r.name, bc.name, stops_to_cross
        )
        SELECT 
            route_name, bus_company, stops_to_cross, bus_count
        FROM 
            route_details
        WHERE 
            stops_to_cross = (SELECT MIN(stops_to_cross) FROM route_details)
        ORDER BY 
            bus_count DESC, 
            route_name ASC
        LIMIT 1;
        ";

        $stmt = $conn->prepare($query);
        $stmt->bind_param("ss", $source, $destination);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            echo json_encode([
                "route" => $row["route_name"],
                "company" => $row["bus_company"],
                "stops_to_cross" => $row["stops_to_cross"],
                "bus_count" => $row["bus_count"]
            ]);
        } else {
            echo json_encode(["message" => "No matching routes found."]);
            http_response_code(404);
        }

        $stmt->close();
        $conn->close();
    } else {
        echo json_encode(["message" => "Invalid input."]);
        http_response_code(400);
    }
} else {
    echo json_encode(["message" => "Invalid request method."]);
    http_response_code(405);
}
