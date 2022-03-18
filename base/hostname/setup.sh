#!/bin/bash

. settings.sh
. env.sh

sudo hostnamectl set-hostname "$hostname"
