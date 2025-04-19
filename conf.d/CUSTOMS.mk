# Пользовательские образы как цель этого гит-форка
# Образ для компьютерного класса со старыми карточками NVidia

# make prac-mate.iso BRANCH=sisyphus
distro/prac-mate: distro/.regular-gtk mixin/regular-mate use/03unroot; @:
	@$(call add,THE_LISTS,prac-mate)
