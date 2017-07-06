<%@ page import="br.ufscar.dc.mvp.Artista" %>


<div class="row">
	<div class="fieldcontain ${hasErrors(bean: artistaInstance, field: 'nome', 'error')} required">
		<label for="nome">
			<g:message code="artista.nome.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="nome" maxlength="40" required="" value="${artistaInstance?.nome}" class="input-field"/>

	</div>
</div>