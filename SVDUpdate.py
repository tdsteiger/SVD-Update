import numpy as np

def svd_update(U, S, V, X, c = None, add = False, down = False):
    V = np.vstack([V, np.zeros(V.shape[0])])
    if down or type(c) == type(np.array([])):
        b = np.zeros(V.shape[0])
        b[-1] = 1
        b = np.reshape(b, (b.shape[0], 1))
        if down:
            a = np.multiply(X[:,0], -1)
        elif add:
            a = c
        else:
            a = X[:,0] - c
    else:
        b = np.zeros(V.shape[0])
        b = np.add(b, 1)
        #still need to make a for this case... this is the case where you just want to recenter

    m = np.dot(np.transpose(U), a)
    p = a - np.dot(U, m)
    Ra = np.linalg.norm(p)
    P = np.multiply((1 / Ra), p)
    n = np.dot(np.transpose(V), b)
    q = b - np.dot(V, n)
    Rb = np.linalg.norm(q)
    Q = np.multiply((1 / Rb), q)

    k = np.vstack([S, np.zeros(S.shape[0])])
    K = np.zeros((k.shape[0], k.shape[0]))
    K[:,:-1] = k
    t = np.transpose(np.vstack([m, Ra]))
    stack = np.vstack([n, Rb])
    dot = np.dot(stack, t)
    K = np.add(K, dot)

    D, P = matrix(K).eigenmatrix_right()

    return ((P.inverse()).transpose(), D, P)
