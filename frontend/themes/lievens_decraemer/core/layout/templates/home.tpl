{include:core/layout/templates/head.tpl}

<body>
<div id="container">

	<div id="header_wrapper">
		<div id="header">
			{* Logo *}
			<h1><a href="/">{$siteTitle}</a></h1>
		</div><!-- header -->

		{* Navigation *}
		<nav id="menu" class="menu_index">
			{$var|getnavigation:'page':0:1}
		</nav>
		<div class="dummy">&nbsp;</div>

		{* Language *}
		<!--<nav id="headerLanguage">
			<h4>{$lblLanguage|ucfirst}</h4>
			{include:core/layout/templates/languages.tpl}
		</nav>-->

		{* Breadcrumb *}
		<!--<div id="breadcrumb">
			<h4>{$lblBreadcrumb|ucfirst}</h4>
			{include:core/layout/templates/breadcrumb.tpl}
		</div>-->
	</div>

	<div id="page">
		<div id="projectenOverview">

			{* Page title *}
			{option:!hideContentTitle}
				<header class="mainTitle">
					<h1>{$page.title}</h1>
				</header>
			{/option:!hideContentTitle}

			{* Main position *}
			{iteration:positionMain}
				{option:positionMain.blockIsHTML}
					<section class="mod">
						<div class="inner">
							<div class="bd content">
								{$positionMain.blockContent}
							</div>
						</div>
					</section>
				{/option:positionMain.blockIsHTML}
				{option:!positionMain.blockIsHTML}
					{$positionMain.blockContent}
				{/option:!positionMain.blockIsHTML}
			{/iteration:positionMain}

			<div class="dummy">&nbsp;</div>
		</div><!-- projectenOverview -->

		{include:core/layout/templates/footer.tpl}

	<div class="dummy">&nbsp;</div>
</div><!-- page -->
</div> <!-- container -->

	<noscript>
		<div class="message notice">
			<h4>{$lblEnableJavascript|ucfirst}</h4>
			<p>{$msgEnableJavascript}</p>
		</div>
	</noscript>

	{* General Javascript *}
	{iteration:jsFiles}
		<script src="{$jsFiles.file}"></script>
	{/iteration:jsFiles}

	{* Theme specific Javascript *}
	<script src="{$THEME_URL}/core/js/triton.js"></script>

	{* Site wide HTML *}
	{$siteHTMLFooter}

</body>
</html>