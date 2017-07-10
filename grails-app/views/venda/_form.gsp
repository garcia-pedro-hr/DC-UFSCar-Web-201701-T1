<%@ page import="br.ufscar.dc.mvp.Venda" %>


<sec:ifAnyGranted roles="ROLE_ADMIN">
	<div id="funcionario-field" class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'funcionario', 'error')} required">
		<label for="funcionario">
			<g:message code="venda.funcionario.label" default="Funcionario" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="funcionario" name="funcionario.id" from="${br.ufscar.dc.mvp.User.list()}" optionKey="id" required="" value="${sec.loggedInUserInfo(field: 'id')}" class="many-to-one"/>

	</div>
</sec:ifAnyGranted>

<sec:ifAnyGranted roles="ROLE_SLSMN">
	<div id="funcionario-field" class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'funcionario', 'error')} required">
		<label for="funcionario">
			<g:message code="venda.funcionario.label" default="Funcionario" />
			<span class="required-indicator">*</span>
		</label>
		<g:select disabled="disabled" id="funcionario" name="funcionario.id" from="${br.ufscar.dc.mvp.User.list()}" optionKey="id" required="" value="${sec.loggedInUserInfo(field: 'id')}" class="many-to-one"/>

	</div>
</sec:ifAnyGranted>

<div id="produto-field" class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="venda.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${br.ufscar.dc.mvp.Produto.list()}" optionKey="id" required="" value="${vendaInstance?.produto?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="venda.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="1" value="${vendaInstance.quantidade}" required=""/>

</div>

