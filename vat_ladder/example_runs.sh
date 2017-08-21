#!/usr/bin/env bash


# Test ladder benchmark
echo "===> ladder <==="
python vat_ladder.py --logdir logs/test/ --id ladder --model ladder --do_not_save --end_epoch 1 --decay_start 1.0 --which_gpu 0 --test_frequency_in_epochs 1

# Test each model
echo "===> lvac <==="
python vat_ladder.py --logdir logs/test/ --id lvac --model c --do_not_save --end_epoch 1 --decay_start 1.0 --which_gpu 0 --test_frequency_in_epochs 1

echo "===> lvac-lw <==="
python vat_ladder.py --logdir logs/test/ --id lvac-lw --model clw --do_not_save --end_epoch 1 --decay_start 1.0 --which_gpu 0 --epsilon 1.0-0.1-0.01-0.01-0.01-0.01-0.01 --test_frequency_in_epochs 1

echo "===> lvan <==="
python vat_ladder.py --logdir logs/test/ --id lvan --model n --do_not_save --end_epoch 1 --decay_start 1.0 --which_gpu 0 --test_frequency_in_epochs 1

echo "===> lvan-lw <==="
python vat_ladder.py --logdir logs/test/ --id lvan-lw --model nlw --do_not_save --end_epoch 1 --decay_start 1.0 --which_gpu 0 --epsilon 1.0-0.1-0.01-0.01-0.01-0.01-0.01 --test_frequency_in_epochs 1



# Hyperopt
nohup python -u hyperopt.py --which_gpu 0 --num_labeled 1000 --dump c1000.res --model c --end_epoch 50 > c1000.log.out &

nohup python -u hyperopt.py --which_gpu 1 --num_labeled 100 --dump clw100.res --model clw --end_epoch 50 > clw100.log.out &

nohup python -u hyperopt.py --which_gpu 2 --num_labeled 100 --dump c100.res --model c --end_epoch 50 > c100.log.out &


# Measuring smoothness
python vat_ladder.py --logdir logs/smoothness/ --id ladder --model ladder  --end_epoch 200 --decay_start 0.5 --test_frequency_in_epochs 10 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9 --measure_smoothness --which_gpu 0

python vat_ladder.py --logdir logs/smoothness/ --id lvac --model c --end_epoch 200 --decay_start 0.5 --which_gpu 1 --test_frequency_in_epochs 10 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9 --measure_smoothness --rc_weights 898.44421-20.73306-0.17875-0.31394-0.02214-0.39981-0.04065 --epsilon 0.03723

python vat_ladder.py --logdir logs/smoothness/ --id lvan-lw --model nlw --end_epoch 200 --decay_start 0.5 --which_gpu 2 --test_frequency_in_epochs 10 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9 --measure_smoothness --rc_weights 898.44421-8.81609-0.61101-0.11661-0.13746-0.50335-0.63461 --epsilon 0.11002-0.00930-0.00508-0.00001-0.00073-0.00113-0.00019


# Testing with smaller MLPs
python vat_ladder.py --logdir logs/shallow/ --id shallow-ladder --model ladder --end_epoch 200 --decay_start 0.5 --which_gpu 0 --test_frequency_in_epochs 10 --encoder_layers 784-1200-1200-10 --rc_weights 1000-10-0.1-0.1 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9

python vat_ladder.py --logdir logs/shallow/ --id shallow-c --model c --end_epoch 200 --decay_start 0.5 --which_gpu 1 --test_frequency_in_epochs 10 --encoder_layers 784-1200-1200-10 --rc_weights 1000-10-0.1-0.1 --epsilon 1.0 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9

python vat_ladder.py --logdir logs/shallow/ --id shallow-clw --model clw --end_epoch 200 --decay_start 0.5 --which_gpu 2 --test_frequency_in_epochs 10 --encoder_layers 784-1200-1200-10 --rc_weights 1000-10-0.1-0.1 --epsilon 1.0-0.1-0.01-0.01 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9


# Testing with 50 labels
nohup python -u vat_ladder.py --seed 1 --num_labeled 50 --batch_size 50 --ul_batch_size 250 --logdir logs/labeled-50/ --id ladder_seed-1 --model ladder --rc_weights 1000-10-0.1-0.1-0.1-0.1-0.1 --end_epoch 200 --decay_start 0.5 --test_frequency_in_epochs 10 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9 --which_gpu 0 > gpu0.out &

nohup python -u vat_ladder.py --seed 1 --num_labeled 50 --batch_size 50 --ul_batch_size 250 --logdir logs/labeled-50/ --id lvac_seed-1 --model c --rc_weights 898.44421-20.73306-0.17875-0.31394-0.02214-0.39981-0.04065 --epsilon 0.03723 --end_epoch 200 --decay_start 0.5 --test_frequency_in_epochs 10 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9 --which_gpu 1 > gpu1.out &

nohup python -u vat_ladder.py --seed 1 --num_labeled 50 --batch_size 50 --ul_batch_size 250 --logdir logs/labeled-50/ --id lvan-lw_seed-1 --model nlw --rc_weights 898.44421-8.81609-0.61101-0.11661-0.13746-0.50335-0.63461 --epsilon 0.11002-0.00930-0.00508-0.00001-0.00073-0.00113-0.00019 --end_epoch 200 --decay_start 0.5 --test_frequency_in_epochs 10 --lr_decay_frequency 10 --beta1 0.9 --beta1_during_decay 0.9 --which_gpu 2 > gpu2.out &
