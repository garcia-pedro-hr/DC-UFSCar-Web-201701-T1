<!DOCTYPE html>
<html>
	<head>

		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

	</head>
	<body>

		<div id="page-body" role="main">
			<div id="controller-list" role="navigation">
				<div class="row" style="margin-top: 20px;">
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<g:if test="${c.logicalPropertyName.equals('login') || c.logicalPropertyName.equals('logout') || c.logicalPropertyName.equals('dbdoc') || c.logicalPropertyName.equals('role')  || c.logicalPropertyName.equals('userRole')}">
							<!-- Não mostra nada para os controladores de login, logout, dbdoc, role -->
						</g:if>

						<g:elseif test="${c.logicalPropertyName == 'venda'}">
							<sec:ifAnyGranted roles="ROLE_SLSMN, ROLE_ADMIN">
								<div class="col s3">
									<div class="card hoverable">
										<div class="card-image waves-effect waves-block waves-light">
											<i class="fa fa-money"></i>
										</div>
										<div class="card-content center-align">
											<span class="card-title activator grey-text text-darken-4"><g:message code="default.home.manage" /> ${c.logicalPropertyName.capitalize()}s</span>
										</div>
										<div class="card-action center-align">
											<a href="${createLink(controller: 'venda', action: 'create')}"><g:message code="default.button.create.label" /></a>
											<a href="${createLink(controller: 'venda', action: 'index')}"><g:message code="default.button.view.label" /></a>
										</div>
									</div>
								</div>
							</sec:ifAnyGranted>
						</g:elseif>

						<g:else>
							<sec:ifAnyGranted roles="ROLE_ADMIN">

								<div class="col s3">
									<div class="card hoverable">
										<div class="card-image waves-effect waves-block waves-light">
											<g:if test="${c.logicalPropertyName.equals('artista') || c.logicalPropertyName.equals('diretor') || c.logicalPropertyName.equals('autor') || c.logicalPropertyName.equals('user')}">
												<i class="fa fa-users"></i>
											</g:if>
											<g:elseif test="${c.logicalPropertyName.equals('CD') || c.logicalPropertyName.equals('DVD') || c.logicalPropertyName.equals('HQ') || c.logicalPropertyName.equals('livro')}" >
												<i class="fa fa-book"></i>
											</g:elseif>
											<g:else>
												<i class="fa fa-map-marker"></i>
											</g:else>
										</div>
										<div class="card-content center-align">
											<span class="card-title activator grey-text text-darken-4"><g:message code="default.home.manage" /> <g:message code="domain.${c.logicalPropertyName}.label" />s</span>
										</div>
										<div class="card-action center-align">
											<a href="${createLink(controller: "${c.logicalPropertyName}", action: 'create')}"><g:message code="default.button.create.label" /></a>
											<a href="${createLink(controller: "${c.logicalPropertyName}", action: 'index')}"><g:message code="default.button.view.label" /></a>
										</div>
									</div>
								</div>

							</sec:ifAnyGranted>
						</g:else>
					</g:each>
				</div>
			</div>
              
	</body>
</html>
