
<%@ page import="br.ufscar.dc.mvp.HQ" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'HQ.label', default: 'HQ')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-HQ" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-HQ" class="content scaffold-list" role="main">
			<h1><g:message code="domain.HQ.label" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'HQ.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'HQ.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'HQ.quantidade.label', default: 'Quantidade')}" />
					
						<th><g:message code="HQ.editora.label" default="Editora" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${HQInstanceList}" status="i" var="HQInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${HQInstance.id}">${fieldValue(bean: HQInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: HQInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: HQInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: HQInstance, field: "editora")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${HQInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
