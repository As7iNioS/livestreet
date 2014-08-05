{**
 * Базовый шаблон профиля пользователя
 *}

{extends './layout.base.tpl'}

{block 'layout_content_header' prepend}
	{include 'components/user/header.tpl' user=$oUserProfile}

	<h3 class="profile-page-header">
		{block 'layout_user_page_title'}{/block}
	</h3>
{/block}