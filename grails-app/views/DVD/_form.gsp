<%@ page import="br.ufscar.dc.mvp.DVD" %>



<div class="fieldcontain ${hasErrors(bean: DVDInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="DVD.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="nome" name="nome" maxlength="30" required="" value="${DVDInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: DVDInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="DVD.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: DVDInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: DVDInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="DVD.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="0" value="${DVDInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: DVDInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="DVD.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" min="1900" value="${DVDInstance.ano}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: DVDInstance, field: 'diretor', 'error')} required">
	<label for="diretor">
		<g:message code="DVD.diretor.label" default="Diretor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diretor" name="diretor.id" from="${br.ufscar.dc.mvp.Diretor.list()}" optionKey="id" required="" value="${DVDInstance?.diretor?.id}" class="many-to-one"/>

</div>

