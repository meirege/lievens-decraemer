{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

<div class="pageTitle">
	<h2>{$lblPortfolio|ucfirst}: {$lblCategories|ucfirst}</h2>

	<div class="buttonHolderRight">
		<a href="{$var|geturl:'add_category'}" class="button icon iconAdd" title="{$lblAddCategory|ucfirst}">
			<span>{$lblAddCategory|ucfirst}</span>
		</a>
	</div>
</div>

{option:datagrid}
	{$datagrid}
{/option:datagrid}

{option:!datagrid}
<p>{$msgNoItems}</p>
{/option:!datagrid}


{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}