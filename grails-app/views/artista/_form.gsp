<%@ page import="br.ufscar.dc.mvp.Artista" %>



<div class="fieldcontain ${hasErrors(bean: artistaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="artista.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="40" required="" value="${artistaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artistaInstance, field: 'cds', 'error')} ">
	<label for="cds">
		<g:message code="artista.cds.label" default="Cds" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${artistaInstance?.cds?}" var="c">
    <li><g:link controller="CD" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="CD" action="create" params="['artista.id': artistaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'CD.label', default: 'CD')])}</g:link>
</li>
</ul>


</div>

