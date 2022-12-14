#!/usr/bin/env bash

source EXPERIMENTS_ROOT.sh


run_ICPR_EXPERIMENTS()
{
  RESULTS_PATH=$1; shift
  SAVE_IMAGES=$1; shift
  GPUS=($@)

  #train_single $SAVE_IMAGES STEEL $STEEL_PATH NO_DYN_BAL       $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 True  2 1 False True  True  ${GPUS[0]} # Table 3  row 1
  #train_single $SAVE_IMAGES STEEL $STEEL_PATH NO_GRAD_ADJ      $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 True  2 1 True  False True  ${GPUS[0]} # Table 3 row 2
  #train_single $SAVE_IMAGES STEEL $STEEL_PATH NO_WEIGHTED_SEG  $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 False 2 1 True  True  True  ${GPUS[0]} # Table 3 row 3
  #train_single $SAVE_IMAGES STEEL $STEEL_PATH NO_FREQ_SAMP     $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 True  2 1 True  True  False ${GPUS[0]} # Table 3 row 4, Table 5 row 4

  #train_single $SAVE_IMAGES STEEL $STEEL_PATH NOTHING          $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 False 2 1 False False False ${GPUS[0]} # Table 5, row 1
  #train_single $SAVE_IMAGES STEEL $STEEL_PATH ALL              $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 True  2 1 True  True  True  ${GPUS[0]} # Table 5 row 5, Table 3 row 5

  #train_single $SAVE_IMAGES STEEL $STEEL_PATH DYN_BAL          $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 False 2 1 True  False False ${GPUS[0]} # Table 5 row 2
  train_single $SAVE_IMAGES STEEL $STEEL_PATH DYN_BAL_GRAD_ADJ $RESULTS_PATH 1 1000 1000 50 0.1 0.1 10 False 2 1 True  True  False ${GPUS[0]} # Table 5 row 3

  #train_single $SAVE_IMAGES STEEL $STEEL_PATH 300_ALL          $RESULTS_PATH 1 300  300  90 0.1 0.1 10 True  2 1 True  True  True  ${GPUS[0]} # Table 4 column 4
  #train_single $SAVE_IMAGES STEEL $STEEL_PATH 750_ALL          $RESULTS_PATH 1 750  750  70 0.1 0.1 10 True  2 1 True  True  True  ${GPUS[0]} # Table 4 column 3
  #train_single $SAVE_IMAGES STEEL $STEEL_PATH 1500_ALL         $RESULTS_PATH 1 1500 1500 50 0.1 0.1 10 True  2 1 True  True  True  ${GPUS[0]} # Table 4 column 2
  #train_single $SAVE_IMAGES STEEL $STEEL_PATH 3000_ALL         $RESULTS_PATH 1 3000 3000 40 0.1 0.1 10 True  2 1 True  True  True  ${GPUS[0]} # Table 4 column 2


}

# Space delimited list of GPU IDs which will be used for training
GPUS=($@)
if [ "${#GPUS[@]}" -eq 0 ]; then
  GPUS=(0)
  #GPUS=(0 1 2) # if more GPUs available
fi
run_ICPR_EXPERIMENTS   ./results-icpr True "${GPUS[@]}"




