# Defines autocompletion for docker
#

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

complete -c docker -f

complete -c docker -n "__fish_seen_subcommand_from rm" -a "(__fish_docker_stopped_containers)"
complete -c docker -n "__fish_seen_subcommand_from stop" -a "(__fish_docker_running_containers)"

