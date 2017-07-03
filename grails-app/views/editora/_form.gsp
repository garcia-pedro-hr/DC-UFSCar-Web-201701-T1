<%@ page import="br.ufscar.dc.mvp.Editora" %>



<div class="fieldcontain ${hasErrors(bean: editoraInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="editora.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${editoraInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: editoraInstance, field: 'CNPJ', 'error')} required">
	<label for="CNPJ">
		<g:message code="editora.CNPJ.label" default="CNPJ" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="CNPJ" maxlength="17" pattern="${editoraInstance.constraints.CNPJ.matches}" required="" value="${editoraInstance?.CNPJ}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: editoraInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="editora.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="endereco" name="endereco.id" from="${br.ufscar.dc.mvp.Endereco.list()}" optionKey="id" required="" value="${editoraInstance?.endereco?.id}" class="many-to-one"/>

</div>

