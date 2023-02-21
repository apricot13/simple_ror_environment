#!/bin/ash

cd /app
rm -f /app/tmp/pids/server.pid 
bundle exec rails s -p 3000 -b=0.0.0.0

#&& bundle exec rails s
#cd /app && rm -f /app/tmp/pids/server.pid && bundle exec rails s -p 3000 -b=0.0.0.0

#rdebug-ide --host 0.0.0.0 --dispatcher-port 33030 --port 13030 -- bin/rails s -p 3000 --binding=0.0.0.0
