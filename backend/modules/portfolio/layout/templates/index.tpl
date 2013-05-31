{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

<div class="pageTitle">
	<h2>{$lblPortfolioWork|ucfirst}</h2>

		<div class="buttonHolderRight">
		<a href="{$var|geturl:'add'}" class="button icon iconAdd" title="{$lblAddWork|ucfirst}">
			<span>{$lblAddWork|ucfirst}</span>
		</a>
	</div>
</div>

{option:datagrids}
	{iteration:datagrids}
		<div class="dataGridHolder" id="dataGrid-{$dataGrids.id}">
			<div class="tableHeading clearfix">
				<h3>{$dataGrids.title}</h3>
			</div>
			{iteration:datagrids.content}
				{$datagrids.content}
			{/iteration:datagrids.content}
	{/iteration:datagrids}
{/option:datagrids}

{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}