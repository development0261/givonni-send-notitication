<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: signin.php');
}
include 'header.php';
?>

<body>
<div class="container-fluid p-3">
    <h2 id="top-center">Notifications</h2>
    <div class="row mt-3">
        <table id="tblNotification" class="table table-striped table-hover table-responsive">
            <thead>
                <td>Title</td>
                <td>Message</td>
                <td>Created At</td>
                <td>Delivered At</td>
                <td>Status</td>
            </thead>
           
        </table>
    </div>
</div>
   
</body>
<script>

jQuery(document).ready(function($) {
    $('#tblNotification').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax": "ajaxfile.php"
    } );
        <?php
        if (isset($_SESSION['success'])) {
        ?>
            Toastify({
                text: "<?php echo $_SESSION['success'] ?>",
                duration: 3000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#4fbe87",
            }).showToast();
        <?php
            unset($_SESSION['success']);
        }
        ?>
    });    
    
</script>
</html>