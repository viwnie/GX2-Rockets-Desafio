<#assign hasCategories = false />
<#if entries?has_content>
	<div class="d-flex w-100 justify-content-center categorias-container-modelo">
		<#list entries as entry>
			<#assign categories = entry.getCategories() />
				<#if categories?has_content>
					<#assign hasCategories = true />
						<div class="d-flex align-items-center flex-column mt-2">
							<h4>Categorias:</h4>
							<@displayCategories categories=categories />
						</div>
				</#if>
		</#list>
		<#if !hasCategories>
			${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}
			<div class="alert alert-info w-100">
				<@liferay_ui.message key="there-are-no-categories" />
			</div>
		</#if>
	</div>
</#if>

<#macro displayCategories categories>
	<#if categories?has_content>
		<ul class="categories d-flex pl-2 m-0 flex-wrap">
			<#list categories as category>
				<li class="ml-1">
					<#assign categoryURL = renderResponse.createRenderURL() />

					${categoryURL.setParameter("resetCur", "true")}
					${categoryURL.setParameter("categoryId", category.getCategoryId()?string)}

					<a href="${categoryURL}" class="pill2">${category.getName()}</a>

					<#if serviceLocator??>
						<#assign
							assetCategoryService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryService")

							childCategories = assetCategoryService.getChildCategories(category.getCategoryId())
						/>
						<@displayCategories categories=childCategories />
					</#if>
				</li>
			</#list>
		</ul>
	</#if>
</#macro>