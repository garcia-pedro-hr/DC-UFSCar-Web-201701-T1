<%@ page import="br.ufscar.dc.mvp.Autor" %>



<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="autor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="40" required="" value="${autorInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'livros', 'error')} ">
	<label for="livros">
		<g:message code="autor.livros.label" default="Livros" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${autorInstance?.livros?}" var="l">
    <li><g:link controller="livro" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="livro" action="create" params="['autor.id': autorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'livro.label', default: 'Livro')])}</g:link>
</li>
</ul>


</div>

