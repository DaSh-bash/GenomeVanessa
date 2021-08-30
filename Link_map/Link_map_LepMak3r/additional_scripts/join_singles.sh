#variables
LOD_LIM=12
SIZE_LIM=40

#map with size limit
zcat data.call.gz | java -cp LM3 SeparateChromosomes2 data=- lodLimit=$LOD_LIM distortionLod=1 informativeMask=2 sizeLimit=$SIZE_LIM > map.${LOD_LIM} 2> map.${LOD_LIM}.log

mkdir JS_test

#run join singles
for i in {5..15}
do
zcat data.call.gz | java -cp LM3 JoinSingles2All \
 data=-\
 map=map.${LOD_LIM}\
 lodLimit=$i\
 distortionLod=1\
 numThreads=2\
 iterate=1\
 > JS_test/map.${LOD_LIM}_js$i 2> JS_test/map.${LOD_LIM}_js$i.log
done
wait

#create a summary of the maps
(echo "LG";seq 0 40) > summary_JS.txt

for i in {1..10}  
do
cut -f1 JS_test/map.${LOD_LIM}_js${i} | sort | uniq -c | sort -k2g | awk 'NR==1{print $6};NR>1{print $1}' | paste summary_JS.txt -  > summary_JS_prel.txt && mv summary_JS_prel.txt summary_JS.txt  
done

