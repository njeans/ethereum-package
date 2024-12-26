
# set -x

relay=$(docker ps | grep relay-api | awk -F ' ' '{print $NF}')
docker logs $relay &> logs/relay.log 


vc1=$(docker ps | grep vc-1 | awk -F ' ' '{print $NF}')
docker logs $vc1 &> logs/vc-1.log 
cl1=$(docker ps | grep cl-1 | awk -F ' ' '{print $NF}')
docker logs $cl1 &> logs/cl-1.log 
el1=$(docker ps | grep el-1 | awk -F ' ' '{print $NF}')
docker logs $el1 &> logs/el-1.log 
mb1=$(docker ps | grep mev-boost-1 | awk -F ' ' '{print $NF}')
docker logs $mb1 &> logs/boost-1.log 

bd=$(docker ps | grep el-2-geth-builder | awk -F ' ' '{print $NF}')
docker logs $bd &> logs/builder.log 
docker network inspect kt-prof > logs/network.json

echo "docker logs -f --tail 10 $relay"
echo "docker logs -f --tail 10 $vc1 "
echo "docker logs -f --tail 10 $cl1"
echo "docker logs -f --tail 10 $el1"
echo "docker logs -f --tail 10 $mb1"
echo "docker logs -f --tail 10 $bd"

echo 
echo "logs:"
set -x
# docker logs -f $el1 | grep submitBlock
# docker logs -f $bd | grep validateBlock
# cat logs/relay.log | grep prof
cat logs/relay.log | grep "/builder/blocks"
# cat logs/builder.log | grep validateProfBlock
