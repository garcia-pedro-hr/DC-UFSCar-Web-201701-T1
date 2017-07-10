    
<%@ page import="br.ufscar.dc.mvp.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"> 
                <!-- Latest compiled and minified CSS -->
                <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'table.css')}" type="text/css">

                <!-- Latest compiled and minified JavaScript -->
                <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

                <!-- Latest compiled and minified Locales -->
                <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
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
			<h1><g:message code="domain.produto.label" /></h1>
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
                       <table class="table table-hover striped" data-toggle="table" id="table">
                        <thead>
                            <tr>
                                 <th data-field="nome">Nome</th>
                                 <th data-field="quantidade">Quantidade</th>
                                 <th data-field="preco">Preço</th>
                                 <th data-field="tipo">Tipo</th>
                            </tr>
                        </thead>
                        </table>
		</div>
                 <script>
                    var listaLink = "${createLink(controller:'produto', action:'listaProduto')}";
                    var getProduto = "${createLink(controller:'produto', action:'getProduto')}";
                </script>
              
                <g:javascript src="autoComplete.js" />  
	</body>
</html>
