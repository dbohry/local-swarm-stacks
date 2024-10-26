#!/bin/bash

cd .. || { echo "Failed to change directory"; exit 1; }

for stack_file in *-stack.yml; do
    if [[ -f "$stack_file" ]]; then
        stack_name="${stack_file%-stack.yml}"
        echo "Deploying stack: $stack_name from file: $stack_file"
        docker stack deploy -c "$stack_file" "$stack_name"
    else
        echo "No -stack.yml files found in the parent directory."
    fi
done

cd - || exit
