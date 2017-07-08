<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title><g:layoutTitle default="Grails"/></title>

		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<g:external dir="css" file="materialize.min.css" />

		<g:javascript src="util/jquery-3.2.1.min.js" />
		<g:javascript src="util/jquery.maskedinput.min.js" />
		<g:javascript src="util/materialize.min.js" />

		<g:layoutHead/>
	</head>
	<body>
            <div id="header">    
                <nav>
                    <div class="nav-wrapper">
                      <a href="#" class="brand-logo">Lojinha do Salim <3</a>
                      <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><g:link controller="login">Login</g:link></li>
                        <li><g:link controller="logout">Logout</g:link></li>
                      </ul>
                    </div>
                </nav>
            </div>
            
		
            <div id="content">
                <g:layoutBody/>
                <img class="materialboxed" width="650" src="http://curitibacult.com.br/wp-content/uploads/2016/01/sebo.jpg">
            </div>

            <div id="footer">
            </div>
	</body>
</html>
