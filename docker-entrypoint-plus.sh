#!/usr/bin/env bash

# set plots_dir based on plots_base_dir
if [[ -n "${plots_base_dir}" ]]; then
  echo "Searching base directory for plots: $plots_base_dir"
  plot_dirs=$(find $plots_base_dir -name '*.plot' -printf '%h\n' | sort | uniq)
  
  if [[ -n "${plot_dirs}" ]]; then
    plot_dirs_count=$(echo $plot_dirs | wc -l)
    echo "Found: $plot_dirs_count directories"
    export plots_dir=$(readarray -t ARRAY < <(echo $plot_dirs); IFS=':'; echo "${ARRAY[*]}")
  fi
fi

# proceed to base image original entrypoint
docker-entrypoint.sh "$@"
