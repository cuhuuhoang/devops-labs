#!/bin/bash

. base/settings.sh

vt="$1.vt"

ip="$(dig +short $vt)"
if [ "$ip" == "125.235.4.59" ]; then
	echo "no ip for $vt"
	exit 1
fi

echo "rsync base"
rsync -au "$lc_base" "$vt":~/. --delete
scp "env/$vt.sh" "$vt":"$vt_base"/env.sh
