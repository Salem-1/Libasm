#!/usr/bin/env bash
# dev.sh — manage the libasm dev environment (x86-64 Docker on ARM Mac)
#
#   ./dev.sh build            (re)build the docker images
#   ./dev.sh shell            open an x86-64 shell in the asm container (default)
#                             -> inside it, run `make`, `make run`, `make t1`, ...
#   ./dev.sh make <target>    run a make target in the container, e.g.:
#                             ./dev.sh make re | ./dev.sh make mytest ARGS="a b"
#   ./dev.sh gdb [args...]    debug ./a.out via the dbg sidecar (qemu gdb stub),
#                             e.g. ./dev.sh gdb 5 1 1 3 2
#   ./dev.sh status           show containers for this project
#   ./dev.sh stop             stop and remove project containers
#   ./dev.sh clean            stop + also remove the built images
set -euo pipefail
cd "$(dirname "$0")"

die() { echo "dev.sh: $*" >&2; exit 1; }

need_docker() {
	docker info >/dev/null 2>&1 || die "Docker daemon isn't running — start Docker Desktop first"
}

cmd=${1:-shell}
[[ $# -gt 0 ]] && shift

case "$cmd" in
	build)
		need_docker
		docker compose build
		;;
	shell|up|start)
		need_docker
		docker compose run --rm asm bash
		;;
	make)
		need_docker
		docker compose run --rm asm make "$@"
		;;
	gdb|debug)
		# delegate to the Makefile's debug target so the gdbcfg filtering
		# and qemu stub wiring stay in one place
		need_docker
		if [[ $# -gt 0 ]]; then
			make debug ARGS="$*"
		else
			make debug
		fi
		;;
	status|ps)
		need_docker
		docker compose ps -a
		;;
	stop|down)
		need_docker
		docker compose down --remove-orphans
		;;
	clean)
		need_docker
		docker compose down --remove-orphans --rmi local
		;;
	help|-h|--help)
		sed -n '2,13p' "$0" | sed 's/^# \{0,3\}//'
		;;
	*)
		die "unknown command '$cmd' — try: ./dev.sh help"
		;;
esac
