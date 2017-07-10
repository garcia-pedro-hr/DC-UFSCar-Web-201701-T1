<!DOCTYPE html>
<html>
	<head>

		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

	</head>
	<body>

		<div id="page-body" role="main">
			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<g:if test="${c.logicalPropertyName.equals('login') || c.logicalPropertyName.equals('logout') || c.logicalPropertyName.equals('dbdoc')}">
							<!-- Não mostra nada para os controladores de login, logout e dbdoc -->
						</g:if>

						<g:elseif test="${c.logicalPropertyName == 'venda'}">
							<sec:ifAnyGranted roles="ROLE_SLSMN, ROLE_ADMIN">
								<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName}</g:link></li>
							</sec:ifAnyGranted>
						</g:elseif>

						<g:else>
							<sec:ifAnyGranted roles="ROLE_ADMIN">
								<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName}</g:link></li>
							</sec:ifAnyGranted>
						</g:else>
					</g:each>
				</ul>
			</div>
              
	</body>
</html>
