
<%@ page import="br.ufscar.dc.mvp.CD" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'CD.label', default: 'CD')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-CD" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-CD" class="content scaffold-list" role="main">
			<h1><g:message code="domain.CD.label" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'CD.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'CD.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'CD.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="ano" title="${message(code: 'CD.ano.label', default: 'Ano')}" />
					
						<th><g:message code="CD.artista.label" default="Artista" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${CDInstanceList}" status="i" var="CDInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${CDInstance.id}">${fieldValue(bean: CDInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: CDInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: CDInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: CDInstance, field: "ano")}</td>
					
						<td>${fieldValue(bean: CDInstance, field: "artista")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${CDInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
