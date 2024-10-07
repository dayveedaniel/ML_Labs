# import numpy as np

# def calc_confusion_matrix(true_labels, pred_labels):
#     """Compute confusion matrix to evaluate the accuracy of a classification
    
#     Parameters
#     ----------
#     true_labels : array-like of shape (n_samples,)
#         Ground truth (correct) target values.
#     pred_labels : array-like of shape (n_samples,)
#         Estimated targets as returned by a classifier.
#     """
#     num_labels = np.unique(true_labels).size
#     cm = np.zeros((num_labels, num_labels), dtype=int)
#     for a, p in zip(true_labels, pred_labels):
#         cm[a][p] += 1
#     return cm