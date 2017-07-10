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

		<title>Lojinha do Salim</title>

		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
		<g:external dir="css" file="materialize.min.css" />
        <g:external dir="css" file="style.css" />
        <g:external dir="css" file="font-awesome.min.css" />

		<g:javascript src="util/jquery-3.2.1.min.js" />
		<g:javascript src="util/jquery.maskedinput.min.js" />
		<g:javascript src="util/materialize.min.js" />

		<g:layoutHead/>
	</head>
	<body>
        <div id="main-background"></div>

        <div id="main-header">
            <nav class="mvp-blue-background">
                <div class="nav-wrapper">
                    <a href="${createLink(uri: '/')}" class="brand-logo"><g:message code="default.appname.label"/></a>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><g:link controller="logout">Logout</g:link></li>
                    </ul>
                </div>
            </nav>
        </div>


        <div id="main-content">
            <g:layoutBody/>

        </div>

        <div id="main-footer">
        </div>

	</body>
</html>
