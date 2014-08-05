{**
 * Навигация в профиле пользователя в разделе "Избранное"
 *}

{include 'components/nav/nav.tpl'
		 sName          = 'profile_favourite'
		 sActiveItem    = $sMenuSubItemSelect
		 sMods          = 'pills'
		 aHookArguments = [ 'oUserProfile' => $oUserProfile ]
		 aItems = [
		   	[ 'name' => 'topics',   'text' => {lang name='user.favourites.nav.topics'},   'url'  => "{$oUserProfile->getUserWebPath()}favourites/topics/",   'count' => $iCountTopicFavourite ],
		   	[ 'name' => 'comments', 'text' => {lang name='user.favourites.nav.comments'}, 'url'  => "{$oUserProfile->getUserWebPath()}favourites/comments/", 'count' => $iCountCommentFavourite ]
		 ]}