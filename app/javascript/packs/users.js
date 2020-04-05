$("#check_email").click(function (e) {
    $.post("/users/check_email", {email: $("#register_email").val()}, function (data) {
        if (data['message'] == 'Success') {
            if (data['data']['available'] == true) {
                $("#check_email_results").text('Email address available');
            }
        }else{
            $("#check_email_results").text('Email address unavailable')
        }
    });
});