#pass the working directory in first argument


[ ! -d "$1" ] && exit 1;

for folder in $1/*; do



for f in /$folder/h00/*; do
	echo $PWD
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done
	
for f in /$folder/h01/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done

for f in /$folder/h02/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done

for f in /$folder/h03/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done

for f in /$folder/h04/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done

for f in /$folder/h05/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done

for f in /$folder/h06/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done

for f in /$folder/h07/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_00.txt;
done



#now the files for the first 8 hours are in list_file_00.txt








###############



#pass the working directory in first argument


for f in /$folder/h08/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_01.txt;
done
	
for f in /$folder/h09/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_01.txt;
done

for f in /$folder/h10/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_01.txt;
done

for f in /$folder/h11/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_01.txt;
done

for f in /$folder/h12/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_01.txt;
done

for f in /$folder/h13/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_01.txt;
done

for f in /$folder/h14/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_01.txt;
done

for f in /$folder/h15/*; do
        [[ -f $f ]] && echo "file $f" >> list_file_01.txt;
done



#now the files for the first 8 hours are in list_file_00.txt









####################################


#pass the working directory in first argument


for f in /$folder/h16/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done
	
for f in /$folder/h17/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done

for f in /$folder/h18/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done

for f in /$folder/h19/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done

for f in /$folder/h20/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done

for f in /$folder/h21/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done

for f in /$folder/h22/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done

for f in /$folder/h23/*; do
        [[ -f $f ]]	&&	echo "file $f" >> list_file_02.txt;
done



#now the files for the first 8 hours are in list_file_00.txt


ffmpeg -f concat -safe 0 -i list_file_00.txt -c copy "$1/$(basename "$(head -n 1 list_file_00.txt)")_8_hrs_part_1.mkv" &






ffmpeg -f concat -safe 0 -i list_file_01.txt -c copy "$1/$(basename "$(head -n 1 list_file_01.txt)")_8_hrs_part_2.mkv" &






ffmpeg -f concat -safe 0 -i list_file_02.txt -c copy "$1/$(basename "$(head -n 1 list_file_02.txt)")_8_hrs_part_3.mkv"

wait

echo "############################################" >> cctv_consolidation_log.txt
echo "Following batch allegedly finished on" >> cctv_consolidation_log.txt
date >> cctv_consolidation_log.txt
cat list_file_00.txt >> cctv_consolidation_log.txt
cat list_file_01.txt >> cctv_consolidation_log.txt
cat list_file_02.txt >> cctv_consolidation_log.txt

rm list_file_00.txt
rm list_file_01.txt
rm list_file_02.txt


mv /$folder /$folder_done

done
