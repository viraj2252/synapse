#!/bin/bash

## CAUTION:
## This script will remove (hopefully) all trace of the given room ID from
## your homeserver.db

## Do not run it lightly.

ROOMID="$1"

sqlite3 homeserver.db <<EOF
UPDATE room_names set room_id='' WHERE event_id='$150736991363BPibo:riot.tenx.tech'
DELETE FROM event_forward_extremities WHERE room_id = '$ROOMID';

VACUUM;
EOF
