# Пользовательские образы как цель этого гит-форка
# Образ для компьютерного класса со старыми карточками NVidia

# make prac-mate.iso BRANCH=sisyphus
distro/prac-mate: distro/.regular-gtk mixin/regular-mate \
	use/deflogin/live use/03unroot; @:
	@$(call add,THE_LISTS,prac-mate)
	@$(call add,CLEANUP_PACKAGES,sudo)
	@$(call add,USERS,altlinux:::1)

#	@$(call add,CLEANUP_LIVE_PACKAGES,livecd-user)
