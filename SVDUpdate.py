import numpy as np

mat = np.array([[1,2,3],[3,2,5],[5,3,1],[7,7,7]])
U, s, V = np.linalg.svd(mat, full_matrices = False)

V = np.vstack([V, np.zeros(V.shape[0])])
S = np.diag(s)
a = np.array([1,2,4,4])
a = np.reshape(a, (a.shape[0], 1))
b = np.zeros(V.shape[0])
b[-1] = 1
b = np.reshape(b, (b.shape[0], 1))

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
c = np.dot(stack, t)
K = np.add(K, c)

D, P = matrix(K).eigenmatrix_right()

#results
Uprime = (P.inverse()).transpose()
Vprime = P
Sprime = D
