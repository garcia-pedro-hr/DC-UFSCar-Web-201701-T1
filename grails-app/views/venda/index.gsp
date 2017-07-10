
<%@ page import="br.ufscar.dc.mvp.Venda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-venda" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="highlight">
			<thead>
					<tr>
					
						<th><g:message code="venda.funcionario.label" default="Funcionario" /></th>
					
						<th><g:message code="venda.produto.label" default="Produto" /></th>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'venda.quantidade.label', default: 'Quantidade')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vendaInstanceList}" status="i" var="vendaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vendaInstance.id}">${fieldValue(bean: vendaInstance, field: "funcionario")}</g:link></td>
					
						<td>${fieldValue(bean: vendaInstance, field: "produto")}</td>
					
						<td>${fieldValue(bean: vendaInstance, field: "quantidade")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vendaInstanceCount ?: 0}" />
			</div>
		</div>

		<div
	</body>
</html>
