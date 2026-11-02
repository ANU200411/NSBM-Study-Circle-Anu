<?php

header("Content-Type: application/json");

$conn = mysqli_connect("localhost", "root", "", "studycircle");

if (!$conn) {
    echo json_encode(array("error" => "Connection failed"));
    exit();
}

function countRows($conn, $sql) {
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_row($result);
    return $row[0];
}

$data = array();

$data["students"]  = countRows($conn, "SELECT COUNT(*) FROM users");
$data["materials"] = countRows($conn, "SELECT COUNT(*) FROM materials WHERE status='approved'");
$data["answered"]  = countRows($conn, "SELECT COUNT(*) FROM questions WHERE answers > 0");
$data["groups"]    = countRows($conn, "SELECT COUNT(*) FROM study_groups");

$data["subjects"] = array();
$result = mysqli_query($conn, "SELECT * FROM subjects");

while ($s = mysqli_fetch_assoc($result)) {
    $name = mysqli_real_escape_string($conn, $s["name"]);

    $item = array();
    $item["code"]      = $s["code"];
    $item["name"]      = $s["name"];
    $item["resources"] = countRows($conn, "SELECT COUNT(*) FROM materials WHERE subject='$name' AND status='approved'");
    $item["questions"] = countRows($conn, "SELECT COUNT(*) FROM questions WHERE subject='$name'");

    $data["subjects"][] = $item;
}

echo json_encode($data);
?>
