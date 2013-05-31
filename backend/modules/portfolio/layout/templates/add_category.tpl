{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

<div class="pageTitle">
	<h2>{$lblPortfolio|ucfirst}: {$lblAddCategory|ucfirst}</h2>
</div>

{form:add_category}
	<p>
		<label for="title">{$lblCategoryTitle|ucfirst}</label>
		{$txtTitle}{$txtTitleError}
	</p>
	<p>
	<input id="addCategoryButton" class="inputButton button mainButton" type="submit" name="add_category" value="{$lblAddCategory|ucfirst}"
	</p>
{/form:add_category}

{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}