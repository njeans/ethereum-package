
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

vc2=$(docker ps | grep vac-2 | awk -F ' ' '{print $NF}')
docker logs $vc2 &> logs/vc-2.log 
cl2=$(docker ps | grep cl-2 | awk -F ' ' '{print $NF}')
docker logs $cl2 &> logs/cl-2.log 
el2=$(docker ps | grep el-2 | awk -F ' ' '{print $NF}')
docker logs $el2 &> logs/el-2.log 
mb2=$(docker ps | grep mev-boost-2 | awk -F ' ' '{print $NF}')
docker logs $mb2 &> logs/boost-2.log 

bd=$(docker ps | grep el-3-geth-builder | awk -F ' ' '{print $NF}')
docker logs $bd &> logs/builder.log 

echo relay: $relay
echo validator-1: $vc1 
echo consensus-1: $cl1
echo execution-1: $el1
echo boost-1: $mb1
echo validator-2: $vc2 
echo consensus-2: $cl2
echo execution-2: $el2
echo boost-2: $mb2
echo builder: $bd

echo 
echo "logs:"
set -x
# docker logs -f $el1 | grep submitBlock
# docker logs -f $bd | grep validateBlock
# cat logs/relay.log | grep prof
# cat logs/relay.log | grep getHeader
# cat logs/builder.log | grep validateProfBlock
