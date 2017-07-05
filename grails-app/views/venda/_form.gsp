<%@ page import="br.ufscar.dc.mvp.Venda" %>

<div class="row">
	<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'funcionario', 'error')} required input-field col s6">
		<select required id="funcionario" name="funcionario.id">
			<option value="" disabled selected>Funcionário...</option>
			<g:each in="${br.ufscar.dc.mvp.User.list()}" var="user">
				<option value="${user.id}">${user}</option>
			</g:each>
		</select>

		<label for="funcionario">
			<g:message code="venda.funcionario.label" default="Funcionario" />
			<span class="required-indicator">*</span>
		</label>
	</div>
</div>

<div class="row">
	<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'produto', 'error')} required input-field col s6">
		<select required id="produto" name="produto.id">
			<option value="" disabled selected>Produto...</option>
			<g:each in="${br.ufscar.dc.mvp.Produto.list()}" var="user">
				<option value="${user.id}">${user}</option>
			</g:each>
		</select>

		<label for="produto">
			<g:message code="venda.produto.label" default="Produto" />
			<span class="required-indicator">*</span>
		</label>
	</div>
</div>

<div class="row">
	<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'quantidade', 'error')} required input-field col s6">
		<input class="validate" id="quantidade" name="quantidade" type="number" min="1" value="${vendaInstance.quantidade}">

		<label for="quantidade">
			<g:message code="venda.quantidade.label" default="Quantidade" />
			<span class="required-indicator">*</span>
		</label>
	</div>
</div>


