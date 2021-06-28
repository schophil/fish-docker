# Defines autocompletion for docker
#

set -l commands attach build commit cp create diff events exec export history images import info inspect kill load login logout logs pause port ps pull push rename restart rm rmi run save search start stats stop tag top unpause update version wait

function __fish_docker_running_containers
	docker ps --format "{{.Names}}"
	docker ps --format "{{.ID}}"
end

function __fish_docker_stopped_containers
	docker ps -f "status=exited" --format "{{.Names}}"
	docker ps -f "status=exited" --format "{{.ID}}"
end

function __fish_docker_all_containers
	docker ps -a --format "{{.Names}}"
	docker ps -a --format "{{.ID}}"
end

function __fish_docker_all_images
	docker images --format "{{.Repository}}"
	docker images --format "{{.ID}}"
end

complete -c docker -f

complete -c docker -n "not __fish_seen_subcommand_from $commands" -a "$commands"
complete -c docker -n "__fish_seen_subcommand_from rm" -a "(__fish_docker_stopped_containers)"
complete -c docker -n "__fish_seen_subcommand_from start" -a "(__fish_docker_stopped_containers)"
complete -c docker -n "__fish_seen_subcommand_from stop" -a "(__fish_docker_running_containers)"
complete -c docker -n "__fish_seen_subcommand_from rmi" -a "(__fish_docker_all_images)"

