import numpy as np

def svd_update(U, S, V, X, c = None, add = False, down = False):
    V = np.vstack([V, np.zeros(V.shape[1])])
    if down or type(c) == type(np.array([])):
        b = np.zeros(V.shape[0])
        b[-1] = 1
        b = np.reshape(b, (b.shape[0], 1))
        if down:
            a = np.reshape(np.multiply(X[:,-1], -1), (-1, 1))
        elif add:
            a = np.reshape(c, (-1, 1))
        else:
            a = np.reshape(X[:,-1] - c, (-1, 1))
    else:
        ones = np.zeros(V.shape[0])
        ones = np.add(b, 1)
        b = np.reshape(ones, (-1, 1))
        a = np.reshape(np.multiply((-1/X.shape[1]), np.dot(X, b)), (-1, 1))

    m = np.reshape(np.dot(np.transpose(U), a), (-1, 1))
    p = np.reshape(a - np.dot(U, m), (-1, 1))
    Ra = np.linalg.norm(p)
    P = np.reshape(np.multiply((1 / Ra), p), (-1, 1))
    n = np.reshape(np.dot(np.transpose(V), b), (-1, 1))
    q = b - np.dot(V, n)
    Rb = np.linalg.norm(q)
    Q = np.reshape(np.multiply((1 / Rb), q), (-1, 1))

    k = S
    K = np.zeros((k.shape[0] + 1, k.shape[0] + 1))
    K[:-1,:-1] = k
    stack = np.vstack(np.append(m, Ra))
    t = np.reshape(np.append(n, Rb), (1, -1))
    dot = np.dot(stack, t)
    K = np.add(K, dot)

    D, P = np.linalg.eig(K)

    return (np.transpose(np.linalg.inv(P)), D, P)
