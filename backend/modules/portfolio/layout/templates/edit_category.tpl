{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

<div class="pageTitle">
	<h2>{$lblPortfolio|ucfirst}: {$lblEditCategory|ucfirst}</h2>
</div>

{form:edit_category}
	<p>
		<label for="title">{$lblCategoryTitle|ucfirst}</label>
		{$txtTitle}{$txtTitleError}
	</p>
	<p>
		<div class="buttonHolderRight">
			<input id="editCategoryButton" class="inputButton button mainButton" type="submit" name="edit_category" value="{$lblEditCategory|ucfirst}" />
		</div>
	</p>
{/form:edit_category}

<div class="fullwidthOptions">
    <a href="{$var|geturl:'delete_category'}&amp;id={$item.id}" data-message-id="confirmDelete" class="askConfirmation button linkButton icon iconDelete">
        <span>{$lblDelete|ucfirst}</span>
    </a>
</div>

<div id="confirmDelete" title="{$lblDelete|ucfirst}?" style="display: none;">
    <p>
        {$msgConfirmDelete|sprintf:{$item.title}}
    </p>
</div>


{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}