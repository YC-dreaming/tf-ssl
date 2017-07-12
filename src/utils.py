import tensorflow as tf
import argparse
import numpy as np

def decay_learning_rate(initial_learning_rate, decay_start_epoch, end_epoch, iter_per_epoch, global_step):
    end_step = end_epoch * iter_per_epoch
    decay_start_step = decay_start_epoch * iter_per_epoch

    decay_epochs = end_epoch - decay_start_epoch
    boundaries = [x for x in range(decay_start_step, end_step, iter_per_epoch)]
    decay_per_epoch = initial_learning_rate / decay_epochs
    values = [initial_learning_rate - x * decay_per_epoch for x in range(decay_epochs + 1)]
    assert len(values) == len(boundaries) + 1

    return tf.train.piecewise_constant(global_step, boundaries, values)


def parse_argstring(argstring, dtype=float, sep='-'):
    return list(map(dtype, argstring.split(sep)))


def get_cli_params():
    parser = argparse.ArgumentParser()
    parser.add_argument('--id', default='ladder')
    parser.add_argument('--train_flag', action='store_true')
    parser.add_argument('--decay_start_epoch', default=100, type=int)
    parser.add_argument('--end_epoch', default=150, type=int)
    parser.add_argument('--print_interval', default=50, type=int)
    parser.add_argument('--save_epochs', default=None, type=float)
    parser.add_argument('--num_labeled', default=100, type=int)
    parser.add_argument('--labeled_batch_size', default=100, type=int)
    parser.add_argument('--unlabeled_batch_size', default=250, type=int)
    parser.add_argument('--initial_learning_rate', default=0.0002, type=float)
    parser.add_argument('--gamma_flag', action='store_true')
    parser.add_argument('--layer_sizes', default='784-1000-500-250-250-250-10')
    parser.add_argument('--sc_weight', default=1000, type=float)
    parser.add_argument('--rc_weights', default='0-0-0-0-0-0-1')
    parser.add_argument('--gpu', action='store_true')

    # only used if train_flag is false
    parser.add_argument('--train_step', default=None, type=int)
    parser.add_argument('--verbose', action='store_true') # for testing

    params = parser.parse_args()
    return process_cli_params(params)

def process_cli_params(params, verbose=True):

    param_dict = vars(params)
    if verbose:
        print('===== Parameter settings =====', flush=True)
        sorted_keys = sorted([k for k in param_dict.keys()])
        for k in sorted_keys:
            print(k,':', param_dict[k])

    # Specify base structure
    layer_sizes = parse_argstring(params.layer_sizes, dtype=int)
    rc_weights = parse_argstring(params.rc_weights, dtype=float)
    rc_weights = dict(zip(range(len(rc_weights)), rc_weights))

    param_dict.update({
        'layer_sizes': layer_sizes,
        'rc_weights': rc_weights,
        'test_batch_size': None if params.train_flag else params.labeled_batch_size
    })

    return params

def print_trainables(write_to=None):
    # OPTIONAL: checking variables and number of training parameters
    # print('All variables: ', [var.name for var in tf.all_variables()])
    trainables = tf.trainable_variables()
    print('===== Trainable variables =====', file=write_to, flush=True)
    print('Number of trainable parameters:', np.sum([np.prod(var.get_shape()) for var in trainables]),
          file=write_to)
    # [print(var.name, var.get_shape()) for var in trainables]
