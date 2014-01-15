{**
 * Предпросмотр топика
 *
 * @styles css/topic.css
 *}

{$oUser = $oTopic->getUser()}

<h3 class="profile-page-header">{$aLang.topic_preview}</h3>

<article class="topic topic-type-{$oTopic->getType()}">
	<header class="topic-header">
		<h1 class="topic-title">
			{$oTopic->getTitle()|escape:'html'}
		</h1>

		<div class="topic-info">
			<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" pubdate title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
			{date_format date=$oTopic->getDateAdd() format="j F Y, H:i"}
			</time>
		</div>
	</header>

	<div class="topic-content text">
		{hook run='topic_preview_content_begin' topic=$oTopic}

		{$oTopic->getText()}

		{hook run='topic_preview_content_end' topic=$oTopic}
	</div>

	<footer class="topic-footer">
		<ul class="tag-list tag-list-topic">
			<li class="tag-list-item tag-list-item-label">{$aLang.topic_tags}:</li>
			{strip}
				{foreach $oTopic->getTagsArray() as $sTag}
					<li class="tag-list-item tag-list-item-tag">
						{if ! $sTag@first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape}</a>
					</li>
				{foreachelse}
					<li class="tag-list-item tag-list-item-empty">{$aLang.topic_tags_empty}</li>
				{/foreach}
			{/strip}
		</ul>

		<ul class="topic-info clearfix">
			{* Автор топика *}
			<li class="topic-info-item topic-info-item-author">
				<a href="{$oUser->getUserWebPath()}">
					<img src="{$oUser->getProfileAvatarPath(48)}" alt="{$oUser->getDisplayName()}" class="topic-info-item-author-avatar" />
				</a>
				<a rel="author" href="{$oUser->getUserWebPath()}" class="topic-info-item-author-login">{$oUser->getDisplayName()}</a>
			</li>
			
			{hook run='topic_preview_show_info' topic=$oTopic}
		</ul>

		{hook run='topic_preview_show_end' topic=$oTopic}
	</footer>
</article>

{* TODO: Пофиксить кнопки сабмита *}
<button type="submit" name="submit_topic_publish" class="button button-primary fl-r" onclick="jQuery('#submit_topic_publish').trigger('click');">
	{if $sEvent == 'add' or ($oTopicEdit and $oTopicEdit->getPublish() == 0)}
		{$aLang.topic_create_submit_publish}
	{else}
		{$aLang.topic_create_submit_update}
	{/if}
</button>
<button type="button" name="submit_preview" class="button js-topic-preview-text-hide-button">{$aLang.topic_create_submit_preview_close}</button>
<button type="submit" name="submit_topic_save" class="button" onclick="jQuery('#submit_topic_save').trigger('click');">{$aLang.topic_create_submit_save}</button>