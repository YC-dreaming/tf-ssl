#!/usr/bin/env bash
python vat_ladder.py --beta1 0.9 --beta1_during_decay 0.9 --corrupt_sd 0.3 --dataset mnist --decay_start 0.8 --encoder_layers 1000-500-250-250-250-10 --end_epoch 250 --epsilon 0.0883744878208-0.00120893605073-0.00809300661658-0.00809300661658-0.00809300661658-0.00809300661658-0.00809300661658 --initial_learning_rate 0.002 --logdir logs/ --lr_decay_frequency 10 --lrelu_a 0.1 --model nlw --num_labeled 1000 --num_power_iters 3 --rc_weights 4427.48669938-5.45001666614-0.0126038172785-0.0126038172785-0.0126038172785-0.0126038172785-0.0126038172785 --seed 8794 --static_bn 0.99 --test_frequency_in_epochs 5 --vadv_sd 0.5 --validation 0 --which_gpu 6 --xi 1e-6 

python vat_ladder.py --beta1 0.9 --beta1_during_decay 0.9 --corrupt_sd 0.3 --dataset mnist --decay_start 0.8 --encoder_layers 1000-500-250-250-250-10 --end_epoch 250 --epsilon 0.108709754061 --initial_learning_rate 0.002 --logdir logs/ --lr_decay_frequency 10 --lrelu_a 0.1 --model c --num_labeled 1000 --num_power_iters 3 --rc_weights 1923.95759609-39.4668900902-0.48183882327-0.48183882327-0.48183882327-0.48183882327-0.48183882327 --seed 2368 --static_bn 0.99 --test_frequency_in_epochs 5 --vadv_sd 0.5 --validation 0 --which_gpu 6 --xi 1e-6 

python vat_ladder.py --beta1 0.9 --beta1_during_decay 0.9 --corrupt_sd 0.3 --dataset mnist --decay_start 0.8 --encoder_layers 1000-500-250-250-250-10 --end_epoch 250 --epsilon 0.0730815479025-0.482173463842-0.00140155463202-0.00140155463202-0.00140155463202-0.00140155463202-0.00140155463202 --initial_learning_rate 0.002 --logdir logs/ --lr_decay_frequency 10 --lrelu_a 0.1 --model clw --num_labeled 100 --num_power_iters 3 --rc_weights 1966.16465847-14.2000743242-0.156300920559-0.156300920559-0.156300920559-0.156300920559-0.156300920559 --seed 2773 --static_bn 0.99 --test_frequency_in_epochs 5 --vadv_sd 0.5 --validation 0 --which_gpu 6 --xi 1e-6 

python vat_ladder.py --beta1 0.9 --beta1_during_decay 0.9 --corrupt_sd 0.3 --dataset mnist --decay_start 0.8 --encoder_layers 1000-500-250-250-250-10 --end_epoch 250 --epsilon 0.0320562984459 --initial_learning_rate 0.002 --logdir logs/ --lr_decay_frequency 10 --lrelu_a 0.1 --model c --num_labeled 100 --num_power_iters 3 --rc_weights 744.348310569-5.76127754805-0.777167499267-0.777167499267-0.777167499267-0.777167499267-0.777167499267 --seed 8340 --static_bn 0.99 --test_frequency_in_epochs 5 --vadv_sd 0.5 --validation 0 --which_gpu 6 --xi 1e-6 

python vat_ladder.py --beta1 0.9 --beta1_during_decay 0.9 --corrupt_sd 0.3 --dataset mnist --decay_start 0.8 --encoder_layers 1000-500-250-250-250-10 --end_epoch 250 --epsilon 0.0209401405553 --initial_learning_rate 0.002 --logdir logs/ --lr_decay_frequency 10 --lrelu_a 0.1 --model n --num_labeled 100 --num_power_iters 3 --rc_weights 754.495982501-8.69486925733-0.871556893638-0.871556893638-0.871556893638-0.871556893638-0.871556893638 --seed 967 --static_bn 0.99 --test_frequency_in_epochs 5 --vadv_sd 0.5 --validation 0 --which_gpu 6 --xi 1e-6 

python vat_ladder.py --beta1 0.9 --beta1_during_decay 0.9 --corrupt_sd 0.3 --dataset mnist --decay_start 0.8 --encoder_layers 1000-500-250-250-250-10 --end_epoch 250 --epsilon 0.0212469650433 --initial_learning_rate 0.002 --logdir logs/ --lr_decay_frequency 10 --lrelu_a 0.1 --model c --num_labeled 50 --num_power_iters 3 --rc_weights 1918.4990815-32.3557779114-0.799217885741-0.799217885741-0.799217885741-0.799217885741-0.799217885741 --seed 8794 --static_bn 0.99 --test_frequency_in_epochs 5 --vadv_sd 0.5 --validation 0 --which_gpu 6 --xi 1e-6 

python vat_ladder.py --beta1 0.9 --beta1_during_decay 0.9 --corrupt_sd 0.3 --dataset mnist --decay_start 0.8 --encoder_layers 1000-500-250-250-250-10 --end_epoch 250 --epsilon 0.0337167780996 --initial_learning_rate 0.002 --logdir logs/ --lr_decay_frequency 10 --lrelu_a 0.1 --model n --num_labeled 50 --num_power_iters 3 --rc_weights 1862.2207984-8.21492073196-0.053401218333-0.053401218333-0.053401218333-0.053401218333-0.053401218333 --seed 2368 --static_bn 0.99 --test_frequency_in_epochs 5 --vadv_sd 0.5 --validation 0 --which_gpu 6 --xi 1e-6 
