<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-venda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="create-venda" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:hasErrors bean="${vendaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${vendaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<div id="venda-form-0" class="row">
				<div class="col s12">
					<g:form url="[resource:vendaInstance, action:'save']">
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
			</div>

			<div id="button-row" class="row">
				<!-- Add form button -->
				<div class="col s6 center-align">
					<a id="add-venda" class="btn-floating btn-large waves-effect waves-light red">
						<i class="material-icons">add</i>
					</a>
				</div>

				<!-- Send all forms button -->
				<div class="col s6 center-align">
					<a id="submit-all" class="btn-floating btn-large waves-effect waves-light red">
						<i class="material-icons">send</i>
					</a>
				</div>
			</div>
		</div>

		<g:javascript src="init.js" />
		<g:javascript src="venda-manager.js" />
	</body>
</html>
