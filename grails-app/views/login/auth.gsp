
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Login</title>

        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
        <g:external dir="css" file="materialize.min.css" />
        <g:external dir="css" file="auth.css"/>
        <g:external dir="css" file="style.css"/>

        <g:javascript src="util/jquery-3.2.1.min.js" />
        <g:javascript src="util/jquery.maskedinput.min.js" />
        <g:javascript src="util/materialize.min.js" />
    </head>

    <body>
        <div class="background-image background-tint"></div>

        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header center-align">
                        <p><g:message code="default.appname.label"/></p>
                    </div>

                    <div class="card-content">
                        <form action="/temp-t1/j_spring_security_check" method="POST" id="loginForm" class="cssform" autocomplete="off">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input type="text" name="j_username" id="username">
                                    <label for="username" class="active">Username</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <input type="password" name="j_password" id="password">
                                    <label for="password" class="active">Password</label>
                                </div>
                            </div>

                            <p id="remember_me_holder" class="center-align">
                                <input type="checkbox" class="chk" name="_spring_security_remember_me" id="remember_me">
                                <label for="remember_me" class="active"><g:message code="default.login.rememberme" /></label>
                            </p>
                        </form>
                    </div>

                    <div class="card-action right-align">
                        <a class="mvp-anchor" href="#" onclick="$('#loginForm').submit();">
                            <g:message code="default.login.login" />
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>