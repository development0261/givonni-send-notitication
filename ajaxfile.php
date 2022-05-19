<?php
require_once('dbconnect.php');
 
$query = $conn->query("SELECT count(id) FROM notifications");
$totalRecords = $query->fetch_row()[0];
 
$length = $_GET['length'];
$start = $_GET['start'];
$columnIndex = $_GET['order'][0]['column']; // Column index
$columnName = $_GET['columns'][$columnIndex]['data']; // Column name
$columnSortOrder = $_GET['order'][0]['dir']; // asc or desc 

$sql = "SELECT * FROM notifications";
 
if (isset($_GET['search']) && !empty($_GET['search']['value'])) {
    $search = $_GET['search']['value'];
    $sql .= " WHERE title like '%$search%' OR message like '%$search%' OR created_at like '%$search%' OR delivered_at like '%$search%'";

}
 
$sql .= " LIMIT $start, $length";
 
$query = $conn->query($sql);
$result = [];
while ($row = $query->fetch_assoc()) {
    $result[] = [
        $row['title'],
        $row['message'],
        $row['created_at'],
        $row['delivered_at'],
        ($row['status']==1) ? '<span class="badge rounded-pill bg-success">Success</span>' : '<span class="badge rounded-pill bg-danger">Fail</span>'
    ];
}
 
echo json_encode([
    'draw' => $_GET['draw'],
    'recordsTotal' => $totalRecords,
    'recordsFiltered' => $totalRecords,
    'data' => $result,
]);