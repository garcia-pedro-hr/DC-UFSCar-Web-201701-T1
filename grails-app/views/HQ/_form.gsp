<%@ page import="br.ufscar.dc.mvp.HQ" %>



<div class="fieldcontain ${hasErrors(bean: HQInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="HQ.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="nome" name="nome" maxlength="30" required="" value="${HQInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: HQInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="HQ.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: HQInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: HQInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="HQ.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="0" value="${HQInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: HQInstance, field: 'editora', 'error')} required">
	<label for="editora">
		<g:message code="HQ.editora.label" default="Editora" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="editora" name="editora.id" from="${br.ufscar.dc.mvp.Editora.list()}" optionKey="id" required="" value="${HQInstance?.editora?.id}" class="many-to-one"/>

</div>

