{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

<div class="pageTitle">
	<h2>{$lblPortfolio|ucfirst}: {$lblAddWork|ucfirst}</h2>
</div>

{form:add}
	<p>
		<label for="title">{$lblTitle|ucfirst}</label>
		{$txtTitle}{$txtTitleError}
	</p>
	<div id="pageUrl">
		<div class="oneLiner">
			{option:detailURL}
				<p><span><a href="{$detailURL}/{$item.url}">{$detailURL}/<span id="generatedUrl"></span></a></span></p>
			{/option:detailURL}
			{option:!detailURL}
				<p class="infoMessage">{$errNoModuleLinked}</p>
			{/option:!detailURL}
		</div>
	</div>
	<div class="tabs">
		<ul>
			<li><a href="#tabContent">{$lblContent|ucfirst}</a></li>
			<li><a href="#tabSEO">{$lblSEO|ucfirst}</a></li>
		</ul>

		<div id="tabContent">
			<table width="100%">
				<tr>
					<td id="leftColumn">
						<div class="box">
							<div class="heading">
								<h3>
									<label for="text">{$lblHeaderImage|ucfirst}</label>
								</h3>
							</div>
							<div class="options">
								<p>
									<label for="image">{$lblImage|ucfirst}</label>
									{$fileHeaderImage} {$fileHeaderImageError}
								</p>
							</div>
						</div>
						<div class="box">
							<div class="heading">
								<h3>
									<label for="text">{$lblDescription|ucfirst}<abbr title="{$lblDescription}">*</abbr></label>
								</h3>
							</div>
							<div class="optionsRTE">
								{$txtDescription}
								{$txtDescriptionError}
							</div>
						</div>
						<div class="box">
							<div class="heading">
								<h3>
									<label for="text">{$lblCreatedWith|ucfirst}<abbr title="{$lblCreatedWith}">*</abbr></label>
								</h3>
							</div>
							<div class="optionsRTE">
								{$txtCreatedWith}
								{$txtCreatedWithError}
							</div>
						</div>
						<div class="box">
							<div class="heading">
								<h3>
									<label for="text">{$lblContribution|ucfirst}<abbr title="{$lblContribution}">*</abbr></label>
								</h3>
							</div>
							<div class="optionsRTE">
								{$txtContribution}
								{$txtContributionError}
							</div>
						</div>
					</td>

					<td id="sidebar">
						<div id="publishOptions" class="box">
							<div class="heading">
								<h3>{$lblStatus|ucfirst}</h3>
							</div>

							<div class="options">
								<ul class="inputList">
									{iteration:hidden}
										<li>
											{$hidden.rbtHidden}
											<label for="{$hidden.id}">{$hidden.label}</label>
										</li>
									{/iteration:hidden}
								</ul>
							</div>

							<div class="options">
								<p class="p0"><label for="publishOnDate">{$lblPublishOn|ucfirst}</label></p>
								<div class="oneLiner">
									<p>
										{$txtPublishOnDate} {$txtPublishOnDateError}
									</p>
									<p>
										<label for="publishOnTime">{$lblAt}</label>
									</p>
									<p>
										{$txtPublishOnTime} {$txtPublishOnTimeError}
									</p>
								</div>
							</div>
						</div>

						<div class="box" id="articleMeta">
							<div class="heading">
								<h3>{$lblMetaData|ucfirst}</h3>
							</div>
							<div class="options">
								<label for="category">{$lblCategory|ucfirst}</label>
								{$ddmCategory} {$ddmCategoryError}
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>

		<div id="tabSEO">
			{include:{$BACKEND_CORE_PATH}/layout/templates/seo.tpl}
		</div>
	</div>

	<div class="fullwidthOptions">
		<div class="buttonHolderRight">
			<input id="addWorkButton" class="inputButton button mainButton" type="submit" name="add" value="{$lblAddWork|ucfirst}" />
		</div>
	</div>
{/form:add}

{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}