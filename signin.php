<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sing In</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/additional-methods.min.js"></script>
    <link rel="stylesheet" href="https://www.phptutorial.net/app/css/style.css">
    <style>
        .error {
            color: red;
        }
    </style>
</head>

<body>

    <?php
    session_start();
    include 'dbconnect.php';

    if (isset($_POST['submit'])) {

        $email = $_POST['email'];
        $pwd = $_POST['pwd'];
        $enc_pwd = md5($_POST['pwd']);

        $sql = "SELECT  * FROM user where email_id='$email' and password='$enc_pwd' and role=1";

        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            $row = mysqli_fetch_assoc($result);
            if ($row['email_id'] == $email && $row['password'] == $enc_pwd) {
                $_SESSION['user_email'] = $email;
                $_SESSION['user_id']=$row['id'];
                header('Location: SendNotification.php');
            } else {

                echo "<script>alert('invalid Email or Password')</script>";
            }
        } else {
            $_SESSION['Error'] = "Invalid Credential";
        }
        $conn->close();
    }

    ?>

<main>
    <form method="post" name="signin">
        <h1>Login</h1>
        <div>
            <label for="email">Email</label>
            <input type="email" placeholder="Email" class="form-control" aria-label="Email" name="email" id="email" value="<?php if (isset($email)) echo $email ?>">
        </div>
        
        <div>
            <label for="password">Password</label>
            <input type="password" placeholder="Password" class="form-control" name="pwd" id="pwd" value="<?php if (isset($pwd)) echo $pwd ?>">
        </div>
        <button type="submit" name="submit">Sign In</button>
        <?php
            if (isset($_SESSION['Error'])) {
            ?>
                <div class="p-2 text-danger"><?= $_SESSION['Error'] ?></div>
            <?php
                unset($_SESSION['Error']);
                session_destroy();
            }
            ?>
    </form>
</main>

    <!-- <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card">
                    <h2 class="text-center">Login</h2>

                    <div class="card-body">

                        <form name="signin" method="post">
                            <div class="p-2">
                                <div class="input-group">
                                    <input type="email" placeholder="Email" class="form-control" aria-label="Email" name="email" id="email" value="<?php if (isset($email)) echo $email ?>">
                                    <div class="input-group-text"><span class="fas fa-envelope"></span></div>
                                </div><label class="error" for="email" id="email-error" style="display: none"></label>
                            </div>

                            <div class="p-2">
                                <div class="input-group">
                                    <input type="password" placeholder="Password" class="form-control" name="pwd" id="pwd" value="<?php if (isset($pwd)) echo $pwd ?>">
                                    <div class="input-group-text"><span class="fas fa-lock"></span></div>
                                </div><label class="error" for="pwd" id="pwd-error" style="display: none"></label>
                            </div>

                            <div class="p-2">
                                <button type="submit" class="btn btn-block btn-primary" name="submit">Sign In</button>
                            </div>
                        </form>   
                    </div> 
                </div>
            </div>
        </div>
    </div> -->


</body>
<script>
    $(document).ready(function() {

        $("#email").focus();
        var form = $('form[name="signin"]');
        form.validate({

            errorClass: 'error',
            rules: {
                email: {
                    required: true,
                    email: true,
                },
                pwd: {
                    required: true,
                },
            },

            highlight: function(element, errorClass) {
                $(element).removeClass(errorClass); //prevent class to be added to input field.
            },

        });

    });
</script>

</html>