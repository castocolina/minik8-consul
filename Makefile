start:
	zsh start.zsh

stop:
	zsh scripts/s01_0_minikube-stop.zsh

create_all:
	zsh scripts/s00_create_all.zsh

install_consul_helm:
	zsh scripts/s02_deploy_consul.zsh

urls:
	zsh scripts/s20_urls.zsh

dashboard:
	zsh scripts/s01_1_enable_dashboard.zsh

consul_tools:
	zsh scripts/s04_install_consul_tools.zsh

consul_populate:
	zsh scripts/s05_consul_populate.zsh

consul_backup:
	zsh scripts/s06_consul_backup.zsh

exec_shell:
	zsh scripts/s08_template_executor.zsh
