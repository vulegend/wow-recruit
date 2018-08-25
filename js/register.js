var logAlertDiv = $("#logalert");
logAlertDiv.hide();

function showError(message)
{
    $("#alertText").html(message);
}

function onRegister()
{
    var password = $("#password").val();
    var confirmPassword = $("#confirmPass").val();
    var email = $("#email").val();

    if(password.length < 8)
    {
        logAlertDiv.show();
        showError("Password must have at least 8 characters");
        return;
    }

    if(password !== confirmPassword)
    {
        logAlertDiv.show();
        showError("Passwords must match");
        return;
    }

    firebase.auth().createUserWithEmailAndPassword(email, password)
            .catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        if (errorCode == 'auth/weak-password') {
            alert('The password is too weak.');
        } else {
            alert(errorMessage);
        }
        console.log(error);
        }).then(function(userCred) {
            console.log(userCred.user);
            $.post("http://localhost/php/registerCallback.php", {googleID : userCred.user.uid, email : userCred.user.email}, function(callback) 
            {
                console.log(callback);

                if(callback == 1)
                {
                    console.log("redirect here faggot");
                    location.href = "http://localhost/index.html";   
                }
            });
        });
}