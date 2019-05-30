#!/bin/sh
PROJECT_HOME=/home/rails/rrrapi_rails
PUMA_PID=`cat $PROJECT_HOME/tmp/pids/puma.pid`

cd $PROJECT_HOME

/home/rails/rrrapi_rails/script/stop_puma.sh

echo "Update Contents..."
git pull


/home/rails/rrrapi_rails/script/start_puma.sh
