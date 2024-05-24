<?php
include 'config.php';

if (!isset($_GET['type'])) {
    die("Invalid request");
}

$type = $_GET['type'];
$animal_id = 1; // Use the actual animal_id from the session or request

$data = [];
if ($type == 'weight') {
    $stmt = $conn->prepare("SELECT log_date, weight FROM weight_logs WHERE animal_id = ?");
    $stmt->bind_param('i', $animal_id);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $data['dates'][] = $row['log_date'];
        $data['values'][] = $row['weight'];
    }
} elseif ($type == 'meal') {
    $stmt = $conn->prepare("SELECT log_date, meal_count FROM meal_logs WHERE animal_id = ?");
    $stmt->bind_param('i', $animal_id);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $data['dates'][] = $row['log_date'];
        $data['values'][] = $row['meal_count'];
    }
}

header('Content-Type: application/json');
echo json_encode($data);
?>
