# Пользовательские образы как цель этого гит-форка
# Образ для практикума по питону для сетевой загрузки в компьютерных классах

# WM base target
# в distro/.regular-wm удалил use/live-install/desktop , чтобы не было иконки установщика ОС в live режиме

# make prac-mate.iso BRANCH=sisyphus
distro/prac-mate: distro/.regular-gtk mixin/regular-mate \
	use/deflogin/live use/03unroot use/04cmcldap ; @:
	@$(call add,THE_LISTS,prac-mate)
	@$(call add,THE_LISTS,prac-ldap)
	@$(call add,CLEANUP_PACKAGES,sudo)
	@$(call add,USERS,altlinux:::1)
	@$(call add,DEFAULT_SERVICES_ENABLE,sshd)

#	@$(call add,CLEANUP_LIVE_PACKAGES,livecd-user)
