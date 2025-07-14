# Пользовательские образы как цель этого гит-форка
# Образ для практикума по питону для сетевой загрузки в компьютерных классах

# WM base target
# !!! на этой ветке в distro/.regular-wm удалил use/live-install/desktop , чтобы не было иконки установщика ОС в live режиме

# make prac-xfce.iso BRANCH=sisyphus
distro/prac-xfce: distro/.regular-gtk mixin/regular-xfce \
	use/deflogin/live use/03unroot use/04cmcldap use/06mount ; @:
	@$(call add,DEFAULT_SYSTEMD_SERVICES_ENABLE,sshd)
	@$(call add,DEFAULT_SERVICES_ENABLE,rpc.statd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nscd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nslcd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nfs-client.target)
	@$(call add,DEFAULT_SERVICES_ENABLE,prometheus-node_exporter.socket)
	@$(call add,DEFAULT_SERVICES_ENABLE,node_exporter-smart.timer)
	@$(call add,SYSTEMD_SERVICES_ENABLE,uuid-mount.service)
	@$(call add,USERS,altlinux:::1)
	@$(call add,CLEANUP_PACKAGES,sudo)
	@$(call add,THE_LISTS,prac-xfce)
	@$(call add,THE_LISTS,prac-ldap)
