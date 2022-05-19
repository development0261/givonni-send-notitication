<?php

session_start();
include 'dbconnect.php';
include 'header.php';

$result = $conn->query("SELECT * FROM `user`");

if (!isset($_SESSION['user_id'])) {
    header('Location: signin.php');
}


/**
 * Sending Push Notification
 */
function sendPushNotification($to='',$data=array()){
    // Firebase API Key
    $apikey='AAAArpJAIeg:APA91bEqvhgIcoozmIwU96ZU663OY32BVLFdeiLUHXou7YRYIsVLvA8sn1oKECaWtZIWED8lbUMvv5_8OaH3MokkU7f6oePiuYc-K3n7IshwK7cQIapaD_M2uTQ4NuyYCVKlgjad1xKr';

    $fields=array('to' => $to,'notification' => $data);
    $url = 'https://fcm.googleapis.com/fcm/send';
    $headers = array('Authorization: key='.$apikey, 'Content-Type: application/json');

     // Open connection
    $ch=curl_init();
    // Set the url, number of POST vars and POST data
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    // Disabling SSL Certificate support temporarly
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
    $result=curl_exec($ch);
    curl_close($ch);
    return json_decode($result,true);
}


?>

<body>

    <?php

    if (isset($_POST['submit'])) {

        $title = $_POST['title'];
        $message = $_POST['message'];
        $uid = $_POST['receiver'];
        $query = $conn->query("SELECT `device_token` FROM `user` WHERE `id` =".$uid);
        if($query->num_rows == 1 ){
            $row = mysqli_fetch_assoc($query);
            // Register Device Token
            $to = $row['device_token'];
        }
        // Register Device Token
        //$to ="cl7_nzAgQea7cL3V8PfKxb:APA91bFpB6GltHp7k1HYctYP23f-jyPa-5AuhitybFotj34jhsZzuKxk9OCM22SAvo5fDQx0ZlWf570Vs-QyQ2Zqzv6g_bQs15Vptie0lVOodSmAH5emt-GCXBfSsRmXvDY6pizGx2TI";
        if (!empty($title) && !empty($message)) {

            $query = "INSERT into `notifications` (title, message, status, token) VALUES ('$title', '$message', 0, '$to')";
            if ($conn->query($query) === TRUE) {

                $data=array(
                    'body' => $message,
                    'title' => $title,
                    'sound' => 'default',
                    'type' => 1
                );
                $result=sendPushNotification($to,$data);

                if ($result['success']==1) {
                    $sql = "SELECT  id FROM notifications ORDER BY id DESC LIMIT 1";
                    $result = $conn->query($sql);
                    if ($result->num_rows == 1) {
                        $row = mysqli_fetch_assoc($result);
                        $id=$row['id'];
                        $timestamp = date('Y-m-d H:i:s');
                        $sql="UPDATE notifications SET delivered_at= now(), status=1 WHERE id= $id";
                        if ($conn->query($sql) === TRUE) {
                            $_SESSION['success'] = "Notification Send Successfully";
                            ?>
                            <script type="text/javascript">
                                    window.location.href = BASE_URL+'/display_notification.php';
                            </script>
                        <?php
                        }
                    }
                } else {
                    $_SESSION['Error'] = "Something went wrong, please try again..";
                }

            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        $conn->close();
    }

    ?>

    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card">
                    <h2 class="text-center mt-3">Send Notification</h2>
                    <div class="card-body">
                        <form name="send_notification" method="post">
                            <div class="p-2">
                                <div class="form-group">
                                    <select class="form-control" name="receiver">
                                        <option class="" value="0">--- Select Receiver ---</option>
                                    <?php
                                        while($row = $result->fetch_assoc()){
                                            if($row['name'] !== 'Admin')
                                                echo "<option value=".$row['id'].">".$row['name']."</option>";
                                        }
                                    ?>
                                    </select>
                                </div>
                            </div>
                            <div class="p-2">
                                <div class="form-group">
                                    <input type="text" placeholder="Title" class="form-control" aria-label="Title" name="title" id="title" value="<?php if (isset($title)) echo $title ?>">
                                </div>
                            </div>

                            <div class="p-2">
                                <div class="form-group">
                                    <textarea id="message" name="message" rows="4" cols="50" class="form-control" placeholder="Message" maxlength="200"><?php if (isset($message)) echo $message ?></textarea>
                                </div>
                            </div>

                            <div class="p-2">
                                <button type="submit" class="btn btn-block btn-primary" name="submit" id="submit">Send</button>
                            </div>
                    </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>


</body>
<script>
    $(document).ready(function() {

        $("#title").focus();
       
        $.validator.addMethod("checkFormat",function(value,element){
            return this.optional(element) ||  /^[^\s].*/.test(value);
        },'This field should start with alphabetics only');

        var form = $('form[name="send_notification"]');
        form.validate({

            errorClass: 'error',
            rules: {
                title: {
                    required: true,
                    checkFormat: true
                },
                message: {
                    required: true,
                    checkFormat: true
                },
            },

            highlight: function(element, errorClass) {
                $(element).removeClass(errorClass); //prevent class to be added to input field.
            },

        });
      
        <?php
        if (isset($_SESSION['Error'])) {
        ?>
            Toastify({
                text: "<?php echo $_SESSION['Error'] ?>",
                duration: 3000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#F82D30",
            }).showToast();
        <?php
            unset($_SESSION['Error']);
        }
        ?>
    });
</script>
</html>