
<%@ page import="br.ufscar.dc.mvp.Editora" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'editora.label', default: 'Editora')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-editora" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-editora" class="content scaffold-list" role="main">
			<h1><g:message code="domain.editora.label" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'editora.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="CNPJ" title="${message(code: 'editora.CNPJ.label', default: 'CNPJ')}" />
					
						<th><g:message code="editora.endereco.label" default="Endereco" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${editoraInstanceList}" status="i" var="editoraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${editoraInstance.id}">${fieldValue(bean: editoraInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: editoraInstance, field: "CNPJ")}</td>
					
						<td>${fieldValue(bean: editoraInstance, field: "endereco")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${editoraInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
