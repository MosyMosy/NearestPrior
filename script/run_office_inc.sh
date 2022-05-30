#!/bin/sh
python $2 --config configs/office-train-config_CLDA.yaml --exp_name $3 --source ./txt/source_amazon_obda_few_v2.txt --target_u ./txt/target_dslr_obda_few_v2.txt --target_l ./txt/target_dslr_obda_few_label_v2.txt --gpu_device $1
python $2 --config configs/office-train-config_CLDA.yaml --exp_name $3 --source ./txt/source_amazon_obda_few_v2.txt --target_u ./txt/target_webcam_obda_few_v2.txt --target_l ./txt/target_webcam_obda_few_label_v2.txt --gpu_device $1
python $2 --config configs/office-train-config_CLDA.yaml --exp_name $3 --source ./txt/source_webcam_obda_few_v2.txt --target_u ./txt/target_dslr_obda_few_v2.txt --target_l ./txt/target_dslr_obda_few_label_v2.txt --gpu_device $1
python $2 --config configs/office-train-config_CLDA.yaml --exp_name $3 --source ./txt/source_webcam_obda_few_v2.txt --target_u ./txt/target_amazon_obda_few_v2.txt --target_l ./txt/target_amazon_obda_few_label_v2.txt --gpu_device $1
python $2 --config configs/office-train-config_CLDA.yaml --exp_name $3 --source ./txt/source_dslr_obda_few_v2.txt --target_u ./txt/target_amazon_obda_few_v2.txt --target_l ./txt/target_amazon_obda_few_label_v2.txt --gpu_device $1
python $2 --config configs/office-train-config_CLDA.yaml --exp_name $3 --source ./txt/source_dslr_obda_few_v2.txt --target_u ./txt/target_webcam_obda_few_v2.txt --target_l ./txt/target_webcam_obda_few_label_v2.txt --gpu_device $1

