#!/usr/bin/env bash

set -e

if ! [[ "$0" =~ scripts/updatebom.sh ]]; then
	echo "must be run from repository root"
	exit 255
fi

./scripts/install_tool.sh github.com/coreos/license-bill-of-materials

echo "generating bill-of-materials.json"
license-bill-of-materials \
    --override-file ./bill-of-materials.override.json \
    github.com/polygon-io/etcd github.com/polygon-io/etcd/etcdctl > bill-of-materials.json

echo "generated bill-of-materials.json"
