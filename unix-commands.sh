docker run -dit --net=host -e ENABLE_SSL=1 -e ADV_HOST=192.168.1.3 --name kafka-sandbox lensesio/fast-data-dev:latest


export HOST_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | head -1 | cut -d\  -f2)

