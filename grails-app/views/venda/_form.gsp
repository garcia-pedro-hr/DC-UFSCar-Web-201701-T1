<%@ page import="br.ufscar.dc.mvp.Venda" %>



<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'funcionario', 'error')} required">
	<label for="funcionario">
		<g:message code="venda.funcionario.label" default="Funcionario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="funcionario" name="funcionario.id" from="${br.ufscar.dc.mvp.User.list()}" optionKey="id" required="" value="${vendaInstance?.funcionario?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'produtos', 'error')} ">
	<label for="produtos">
		<g:message code="venda.produtos.label" default="Produtos" />
		
	</label>
	<g:select name="produtos" from="${br.ufscar.dc.mvp.Produto.list()}" multiple="multiple" optionKey="id" size="5" value="${vendaInstance?.produtos*.id}" class="many-to-many"/>

</div>

