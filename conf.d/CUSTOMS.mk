# Пользовательские образы как цель этого гит-форка
# Образ для практикума по питону для сетевой загрузки в компьютерных классах

# WM base target
# в distro/.regular-wm удалил use/live-install/desktop , чтобы не было иконки установщика ОС в live режиме

# make prac-mate.iso BRANCH=sisyphus
distro/prac-mate: distro/.regular-gtk mixin/regular-mate \
	use/deflogin/live use/04cmcldap use/03unroot use/06mount ; @:
	@$(call add,THE_LISTS,prac-mate)
	@$(call add,THE_LISTS,prac-ldap)
	@$(call add,CLEANUP_PACKAGES,sudo)
	@$(call add,USERS,altlinux:::1)
	@$(call add,DEFAULT_SERVICES_ENABLE,sshd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nscd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nslcd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nfs-client.target)
	@$(call add,DEFAULT_SERVICES_ENABLE,home-export.mount)
	@$(call add,DEFAULT_SERVICES_ENABLE,prometheus-node_exporter.socket)
	@$(call add,DEFAULT_SERVICES_ENABLE,node_exporter-smart.timer)


#	@$(call add,CLEANUP_LIVE_PACKAGES,livecd-user)
