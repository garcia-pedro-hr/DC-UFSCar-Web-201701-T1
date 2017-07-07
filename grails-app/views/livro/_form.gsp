<%@ page import="br.ufscar.dc.mvp.Livro" %>



<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="livro.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="nome" name="nome" maxlength="30" required="" value="${livroInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="livro.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: livroInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="livro.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="0" value="${livroInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'autor', 'error')} required">
	<label for="autor">
		<g:message code="livro.autor.label" default="Autor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="autor" name="autor.id" from="${br.ufscar.dc.mvp.Autor.list()}" optionKey="id" required="" value="${livroInstance?.autor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'editora', 'error')} required">
	<label for="editora">
		<g:message code="livro.editora.label" default="Editora" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="editora" name="editora.id" from="${br.ufscar.dc.mvp.Editora.list()}" optionKey="id" required="" value="${livroInstance?.editora?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'classificacao', 'error')} required">
	<label for="classificacao">
		<g:message code="livro.classificacao.label" default="Classificacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="classificacao" required="" value="${livroInstance?.classificacao}"/>

</div>

