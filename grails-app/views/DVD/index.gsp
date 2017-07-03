
<%@ page import="br.ufscar.dc.mvp.DVD" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'DVD.label', default: 'DVD')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-DVD" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-DVD" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'DVD.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'DVD.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'DVD.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="ano" title="${message(code: 'DVD.ano.label', default: 'Ano')}" />
					
						<th><g:message code="DVD.diretor.label" default="Diretor" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${DVDInstanceList}" status="i" var="DVDInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${DVDInstance.id}">${fieldValue(bean: DVDInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: DVDInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: DVDInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: DVDInstance, field: "ano")}</td>
					
						<td>${fieldValue(bean: DVDInstance, field: "diretor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${DVDInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
