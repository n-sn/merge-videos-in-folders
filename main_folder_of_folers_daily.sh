#pass the working directory in first argument


[ ! -d "$1" ] && exit 1;



for d in /$1/*; do
	echo $PWD
	FILECOUNT=$(find $d -type f | wc -l)
	echo $FILECOUNT
        #[[ -d $d ]]	&&	[[ $FILECOUNT -eq 1 ]]	&& echo "folder $d" #>> list_file_00.txt;
	if [ $FILECOUNT -eq 1 ] 
	then
	sh batchfolder1_for_folder_of_folders_onefile.sh $d
	else
	sh batchfolder1_for_folder_of_folders.sh $d
	fi
done



#now the files for the folder are in list_file_00.txt


#ffmpeg -f concat -safe 0 -i list_file_00.txt -c copy "$(basename "$(head -n 1 list_file_00.txt)")_full_day_hdwifi_motion.mkv" 



#echo "############################################" >> cctv_consolidation_log.txt
#echo "Following batch allegedly finished on" >> cctv_consolidation_log.txt
#date >> cctv_consolidation_log.txt
#cat list_file_00.txt >> cctv_consolidation_log.txt

#rm list_file_00.txt



#mv /$1 /$1_done
