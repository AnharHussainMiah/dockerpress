echo "==> 👷 build the custom image.."
./build.sh dev
echo "==> 🔨 stop any existing containers.."
docker stop wp
docker stop database
echo "==> 🔨 remove and dead containers.."
docker rm wp
docker rm database
echo "==> 🔨 lets create the wp network..."
docker network create -d bridge wpnetwork || true
echo "==> 🔨 spin up a mysql database..."
docker run \
    --rm \
    -d \
    --name database \
    --network=wpnetwork \
    -e MYSQL_DATABASE=wordpress \
    -e MYSQL_ROOT_PASSWORD=password \
    mysql
echo "==> 🔨 let the database spin up..."
sleep 10
echo "==> 🚀 lets spin up the main wordpress image..."
docker run \
    --rm -d \
    -p 8080:80 \
    --name wp \
    --network=wpnetwork \
    -e DB_NAME="wordpress" \
    -e DB_USER="root" \
    -e DB_PASS="password" \
    -e DB_HOST="database" \
    dockerpress
