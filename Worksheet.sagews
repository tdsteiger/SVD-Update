︠5c60b8ad-67a8-471e-828a-706edab98037︠
import numpy as np

mat = np.array([[1,2,3],[3,2,5],[5,3,1],[7,7,7]])
'''
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

K = np.vstack([S, np.zeros(S.shape[0])])
t = np.vstack([n, Rb])
t = np.reshape(t, t.shape[0])
c = np.dot(np.vstack([n, Ra]), t) #this doesn't work, yet
c = np.reshape(c, (c.shape[0], 1))
K = np.append(K, c, 1)
'''
ones = np.zeros(mat.shape[0])
ones = np.add(ones, 1)
ones = np.reshape(ones, (ones.shape[0], 1))
mat2 = np.multiply(mat, ones)
mat
mat2
︡2efc46cd-cf80-4470-b03f-3d79822c5cb1︡{"stderr":"Error in lines 22-22\nTraceback (most recent call last):\n  File \"/mnt/home/vHa2OGCG/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nValueError: matrices are not aligned\n"}︡
︠37be6385-e11f-4248-848e-0d648b318cbf︠
