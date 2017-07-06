<%@ page import="br.ufscar.dc.mvp.CD" %>



<div class="fieldcontain ${hasErrors(bean: CDInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="CD.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="30" required="" value="${CDInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: CDInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="CD.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: CDInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: CDInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="CD.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="0" value="${CDInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: CDInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="CD.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" min="1900" value="${CDInstance.ano}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: CDInstance, field: 'artista', 'error')} required">
	<label for="artista">
		<g:message code="CD.artista.label" default="Artista" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="artista" name="artista.id" from="${br.ufscar.dc.mvp.Artista.list()}" optionKey="id" required="" value="${CDInstance?.artista?.id}" class="many-to-one" />
</div>

