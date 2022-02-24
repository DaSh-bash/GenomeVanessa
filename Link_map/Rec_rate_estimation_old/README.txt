#prepare maps for rec rate analysis

#prun maps of markers at end extending map length
manually remove markers in each map (from output of LepMak3r folder mapped/*), the pruned maps are in folder mapped_pruned/

#Reverse "negative" maps and start from 0 in maps where lower nr marker have been removed
Custom r-script: change_maporientation.R
Output in mapped_rearr/

#concatenate the maps to one file
cat Desktop/link_map_vanessa/output/LepMak3r_dtol/mapped_rearr/* |awk '{print $3,$1,$2,$4=$4/1000000}' |tr "," "." > Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est.table

#manually remove markers from other chromosomes
#check that all have been removed
cut -f1 -d " " Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2.table | uniq

wc -l Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2.table
5184 Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2.table


#thin (remove markers closer than 200 bp (same radtag)), obs have to change sort, the -g mess up the sorting some how
sort -k4g Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2.table | awk -v delta=0.0002 'NR == 1 { print; last=$4 } NR > 1 { if($4 - last >= delta) { print }; last=$4 }' | sort -k1,1 -k3,3n |sed -E 's/\*//g' > Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2_thin.table


wc -l Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2_thin.table
    1913 Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2_thin.table

#split the files for rearranging with 
awk '{print>$1}' Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2_thin.table
mv LR* Desktop/link_map_vanessa/output/LepMak3r_dtol/maps_for_rec_rate/

#run custom r-script to make sure all starts from 0 parts of change_maporientation2.R


#concat the files to one file
cat Desktop/link_map_vanessa/output/LepMak3r_dtol/maps_for_rec_rate/*_map > Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2_thin_rearr.table

Go to folder rec_rate_est_R
Use input_rec_rate_est2_thin_rearr.table as input for load_maps_KN_mod.R and linkedsel_rec_est_KN_rearr_mod.R in the folder prepare_input_files to get clean input for rest rec rate with input_marey_map.txt

#Use MareyMapR GUI

Output in output folder

output_marey_map_all.table is input for further analysis


