    
<%@ page import="br.ufscar.dc.mvp.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
                
		<a href="#list-produto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-produto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
                       <div class="row">
                         <div class="col s12">
                           <div class="row">
                             <div class="input-field col s12">
                               <i class="material-icons prefix">textsms</i>
                               <input type="text" id="autocomplete-input" class="autocomplete">
                               <label for="autocomplete-input">Autocomplete</label>
                             </div>
                           </div>
                         </div>
                       </div>
			<table>
			<thead>
				<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'produto.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'produto.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'produto.quantidade.label', default: 'Quantidade')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${produtoInstanceList}" status="i" var="produtoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${produtoInstance.id}">${fieldValue(bean: produtoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: produtoInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: produtoInstance, field: "quantidade")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${produtoInstanceCount ?: 0}" />
			</div>
                        
		</div>
                 <script>
                    var listaLink = "${createLink(controller:'produto', action:'listaProduto')}"
                </script>
                <g:javascript src="autoComplete.js" />
	</body>
</html>
