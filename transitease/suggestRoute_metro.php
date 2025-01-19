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

        // Query to find the best route with minimum stops and break ties by train count
        $query = "
        WITH route_details AS (
            SELECT 
                r.name AS route_name,
                mc.name AS metro_company,
                ABS(s2.stop_number - s1.stop_number) AS stops_to_cross,
                COUNT(t.train_id) AS train_count
            FROM 
                metro_stops s1
            JOIN 
                metro_stops s2 ON s1.route_id = s2.route_id
            JOIN 
                metro_routes r ON s1.route_id = r.route_id
            JOIN 
                metro_companies mc ON r.company_id = mc.company_id
            LEFT JOIN 
                trains t ON mc.company_id = t.company_id
            WHERE 
                s1.name = ?
                AND s2.name = ?
            GROUP BY 
                r.name, mc.name, stops_to_cross
        )
        SELECT 
            route_name, metro_company, stops_to_cross, train_count
        FROM 
            route_details
        WHERE 
            stops_to_cross = (SELECT MIN(stops_to_cross) FROM route_details)
        ORDER BY 
            train_count DESC, 
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
                "company" => $row["metro_company"],
                "stops_to_cross" => $row["stops_to_cross"],
                "train_count" => $row["train_count"]
            ]);
        } else {
            echo json_encode(["message" => "No matching metro routes found."]);
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
?>

