# Пользовательские образы как цель этого гит-форка
# Образ для практикума по питону для сетевой загрузки в компьютерных классах

# !!! на этой ветке в distro/.regular-wm удалил use/live-install/desktop , чтобы не было иконки установщика ОС в live режиме
# !!! на этой ветке в use/live/x11: use/live/base use/deflogin/desktop \ убрана цель use/x11-autologin
# !!! на этой ветке в use/live/base: удалена цель use/deflogin/live
# !!! на этой ветке удалена цель use/net/etcnet
# !!! на этой ветке модифицирована цель use/net/nm
# !!! убрано +nm-gtk из цели mixin/xfce-base

# make prac-xfce.iso BRANCH=sisyphus
distro/prac-xfce: distro/.regular-gtk mixin/regular-xfce \
	use/03unroot use/04cmcldap use/06mount ; @:
	@$(call add,DEFAULT_SYSTEMD_SERVICES_ENABLE,sshd)
	@$(call add,DEFAULT_SERVICES_ENABLE,rpc.statd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nscd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nslcd)
	@$(call add,DEFAULT_SERVICES_ENABLE,nfs-client.target)
	@$(call add,DEFAULT_SERVICES_ENABLE,prometheus-node_exporter.socket)
	@$(call add,DEFAULT_SERVICES_ENABLE,node_exporter-smart.timer)
	@$(call add,SYSTEMD_SERVICES_ENABLE,uuid-mount.service)
	@$(call add,SYSTEMD_SERVICES_ENABLE,replace-localdomain.service)
	@$(call add,DEFAULT_SERVICES_ENABLE,replace-localdomain.service)
	@$(call add,CLEANUP_PACKAGES,sudo)
	@$(call add,CLEANUP_PACKAGES,etcnet)
	@$(call add,THE_LISTS,prac-xfce)
	@$(call add,THE_LISTS,prac-ldap)
	@$(call add,DEFAULT_SERVICES_ENABLE,NetworkManager ModemManager)
