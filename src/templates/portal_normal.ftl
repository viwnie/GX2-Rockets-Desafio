<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<div class="d-flex flex-column min-vh-100">
	<@liferay.control_menu />

	<div class="d-flex flex-column flex-fill position-relative" id="wrapper">
		<header id="banner">
			<div class="navbar navbar-classic navbar-top py-3 d-none d-md-flex">
				<div class="container-fluid container-fluid-max-xl user-personal-bar">
					<div class="align-items-center autofit-row">
						<a class="${logo_css_class} align-items-center d-flex logo-md" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
							<img alt="${logo_description}" class="mr-2" height="0px" src="${site_logo}" />
							<h1 class="h2 mb-0 titulo-principal">${site_name}</h1>
						</a>
						<#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />
						<div class="autofit-col autofit-col-expand d-md-flex d-none">
								<div class="justify-content-md-end mr-4 navbar-form" role="search">
									<@liferay.search_bar default_preferences="${preferences}" />
								</div>
						</div>
						<div class="autofit-col d-md-flex d-none">
							<@liferay.user_personal_bar />
						</div>
						<div class="contaienr-mini-cart-navbar">
							<div class="mini-cart-fragment" style="--mini-cart-icon-color: var(--gray-600);">
								<@liferay_commerce_ui["mini-cart"]
                   				displayTotalItemsQuantity=true
                   				spritemap="${themeDisplay.getPathThemeImages()}/clay/icons.svg"
                   				toggleable=true
                   				/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="navbar navbar-classic navbar-expand-md navbar-light pb-3">
				<div class="container-fluid container-fluid-max-xl">
					<a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs" href="${site_default_url}" rel="nofollow">
						<img alt="${logo_description}" class="mr-2" height="0px" src="${site_logo}" />
						<h2 class="h2 mb-0 titulo-principal">${site_name}</h2>
					</a>
					<div class="contaienr-mini-cart-navbar d-md-none">
						<div class="mini-cart-fragment" style="--mini-cart-icon-color: var(--gray-600);">
							<@liferay_commerce_ui["mini-cart"]
                   			displayTotalItemsQuantity=true
                   			spritemap="${themeDisplay.getPathThemeImages()}/clay/icons.svg"
                   			toggleable=true
                   			/>
						</div>
					</div>
					<#include "${full_templates_path}/navigation.ftl" />
				</div>
			</div>
			<div class="wave"></div>
		</header>
		<section class="flex-fill section-do-body" id="content">
			<@liferay_util["include"] page=content_include />
			${portletDisplay.recycle()}
			${portletDisplay.setTitle(the_title)}
			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</section>
		<footer id="footer" role="contentinfo" class="text-center text-black bg-white mt-4">
			<div class="container">
				<section>
					<div class="row text-center d-flex justify-content-center pt-5">
						<a class="${logo_css_class} align-items-center d-flex logo-md" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
							<img alt="${logo_description}" class="mr-2" height="0px" src="${site_logo}" />
							<h1 class="h2 mb-1 titulo-principal">${site_name}</h1>
						</a>
						<div class="col-md-2 mb-1 d-flex justify-content-center align-items-end">
							<h6 class="text-uppercase">
								<a href="/home" class="text-black">Home</a>
							</h6>
						</div>
						<div class="col-md-2 mb-1 d-flex justify-content-center align-items-end">
							<h6 class="text-uppercase">
								<a href="/noticias" class="text-black">Noticias</a>
							</h6>
						</div>
						<div class="col-md-2 mb-1 d-flex justify-content-center align-items-end">
							<h6 class="text-uppercase">
								<a href="/produtos" class="text-black">Produtos</a>
							</h6>
						</div>
					</div>
				</section>
				<hr />
				<section class="text-center mb-4">
					<span class="text-secondary">os melhores preços em um só lugar.</span>
				</section>
			</div>
		</footer>
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />
<@liferay_util["include"] page=bottom_include />

</body>

</html>