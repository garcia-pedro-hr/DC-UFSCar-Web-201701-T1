<%@ page import="br.ufscar.dc.mvp.Diretor" %>



<div class="fieldcontain ${hasErrors(bean: diretorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="diretor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="40" required="" value="${diretorInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diretorInstance, field: 'filmes', 'error')} ">
	<label for="filmes">
		<g:message code="diretor.filmes.label" default="Filmes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${diretorInstance?.filmes?}" var="f">
    <li><g:link controller="DVD" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="DVD" action="create" params="['diretor.id': diretorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'DVD.label', default: 'DVD')])}</g:link>
</li>
</ul>


</div>

