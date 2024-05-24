<div class="container-all-blogs">
	<ul class="card-page d-flex align-items-center justify-content-center">
		<#if entries?has_content>
			<#list entries as curBlogEntry>
				<#if curBlogEntry.getCoverImageURL(themeDisplay)??>
					<#assign cardImage = true />
				<#else>
					<#assign cardImage = false />
				</#if>

				<li class="mt-4">
					<div class="container-blog">
						<div class="body d-flex flex-column flex-md-row align-items-center align-items-md-start">
							<div class="image-blog">
							<figure>
								<img alt="thumbnail" class="img-blog" src="${cardImage?then(curBlogEntry.getCoverImageURL(themeDisplay), portalUtil.getPathContext(renderRequest) + "/images/cover_image_placeholder.jpg")}">
							</figure>
                            </div>
							<div class="body-conteudo ml-3">
									<div>
										<#assign viewEntryPortletURL = renderResponse.createRenderURL() />
										<#assign currentURL = themeDisplay.getURLCurrent() />
										${viewEntryPortletURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
										${viewEntryPortletURL.setParameter("redirect", currentURL)}

										<#if validator.isNotNull(curBlogEntry.getUrlTitle())>
											${viewEntryPortletURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
										<#else>
											${viewEntryPortletURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
										</#if>

										<h3 class="titulo-blog">
											<a class="title-link" href="/home/-/blogs/${curBlogEntry.getUrlTitle()}">
											${htmlUtil.escape(blogsEntryUtil.getDisplayTitle(resourceBundle, curBlogEntry))}</a>
										</h3>
									</div>
                                    
                                    <#if validator.isNotNull(curBlogEntry.getDescription())>
                                        <#assign content = curBlogEntry.getDescription() />
									<#else>
                                        <#assign content = curBlogEntry.getContent() />
									</#if>
									<#if cardImage>
                                        <p class="blog-paragrafo">${stringUtil.shorten(htmlUtil.stripHtml(content), 150)}</p>
									<#else>
                                        <p class="blog-paragrafo">${stringUtil.shorten(htmlUtil.stripHtml(content), 400)}</p>
									</#if>

                                    <div class="footer d-flex">
                                        <div class="d-flex justify-content-center align-items-center">
                                            <#if blogsPortletInstanceConfiguration.enableComments()>
                                                <div>
                                                    <#assign viewCommentsPortletURL = renderResponse.createRenderURL() />
                                                    ${viewCommentsPortletURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
                                                    ${viewCommentsPortletURL.setParameter("scroll", renderResponse.getNamespace() + "discussionContainer")}
                                                    <#if validator.isNotNull(curBlogEntry.getUrlTitle())>
                                                        ${viewCommentsPortletURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
										            <#else>
											            ${viewCommentsPortletURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
                                                    </#if>
                                                    <a href="${viewCommentsPortletURL.toString()}" title="${language.get(locale, "comments")}">
                                                        <span>
                                                            <@clay["icon"] symbol="comments" />
											            </span> ${commentManager.getCommentsCount("com.liferay.blogs.model.BlogsEntry", curBlogEntry.getEntryId())}
										            </a>
									            </div>
								            </#if>
                                            <#if blogsPortletInstanceConfiguration.enableRatings()>
                                                <div>
                                                    <@liferay_ratings["ratings"] className="com.liferay.blogs.model.BlogsEntry" classPK=curBlogEntry.getEntryId()/>
                                                </div>
                                            </#if>
                                            <div>
                                                <#assign bookmarkURL = renderResponse.createRenderURL() />
                                                ${bookmarkURL.setWindowState(windowStateFactory.getWindowState("NORMAL"))}
                                                ${bookmarkURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
                                                <#if validator.isNotNull(curBlogEntry.getUrlTitle())>
                                                    ${bookmarkURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
									            <#else>
										            ${bookmarkURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
									            </#if>
                                                <@liferay_social_bookmarks["bookmarks"]
										        className="com.liferay.blogs.model.BlogsEntry"
										        classPK=curBlogEntry.getEntryId()
										        maxInlineItems=0
										        target="_blank"
										        title=blogsEntryUtil.getDisplayTitle(resourceBundle, curBlogEntry)
										        types=blogsPortletInstanceConfiguration.socialBookmarksTypes()
										        url=portalUtil.getCanonicalURL(bookmarkURL.toString(), themeDisplay, themeDisplay.getLayout())
                                                />
                                            </div>
                                            <div class="ml-2">
                                                ${dateUtil.getDate(curBlogEntry.getStatusDate(), "dd MMM", locale)}
												<#if blogsPortletInstanceConfiguration.enableReadingTime()>
													- <@liferay_reading_time["reading-time"] displayStyle="simple" model=curBlogEntry />
												</#if>
												<#assign assetEntry = blogsEntryAssetEntryUtil.getAssetEntry(request, curBlogEntry) />
												<#if blogsPortletInstanceConfiguration.enableViewCount()>
													- <@liferay_ui["message"] arguments=assetEntry.getViewCount() key=(assetEntry.getViewCount()==0)?then("x-view", "x-views") />
												</#if>
											</div>
							            </div>
						            </div>
							</div>
							<div>
                                <#if serviceLocator??>
                                    <#assign userLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.UserLocalService") entryUser = userLocalService.fetchUser(curBlogEntry.getUserId())/>
                                    <#if entryUser?? && !entryUser.isGuestUser()>
                                        <#assign entryUserURL = entryUser.getDisplayURL(themeDisplay) />
									</#if>
								</#if>
							</div>
						</div>
					</div>
				</li>
			</#list>
		</#if>
	</ul>
</div>