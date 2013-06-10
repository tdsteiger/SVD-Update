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
<<<<<<< HEAD
︡ab352360-8294-479b-9f52-ce93293391d6︡{"stderr":"Error in lines 22-22\nTraceback (most recent call last):\n  File \"/mnt/home/vHa2OGCG/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nValueError: matrices are not aligned\n"}︡
︠160ac76d-1d93-4a44-b751-62ad77626f1c︠
search_def('SVD')
︡b0a98d61-32da-404e-b803-6ad644972b8b︡{"stdout":"matrix/matrix_double_dense.pyx:2298:    def SVD(self, *args, **kwds):\n"}︡
︠e43bb9c9-77d8-407b-a347-145ec7951d03︠

︠37be6385-e11f-4248-848e-0d648b318cbf︠
︡820c0af8-8a44-488b-8cc1-a942ef7d5169︡
︠6691a9e1-af83-41b4-b125-28873400eb2a︠
︡1bd7317d-c787-48e1-b9ce-058f187236cb︡
︠760ed442-1be8-4b25-a217-97ef1b4010ba︠



=======
︡2efc46cd-cf80-4470-b03f-3d79822c5cb1︡{"stderr":"Error in lines 22-22\nTraceback (most recent call last):\n  File \"/mnt/home/vHa2OGCG/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nValueError: matrices are not aligned\n"}︡
︠37be6385-e11f-4248-848e-0d648b318cbf︠
>>>>>>> 95209e32ad5638cc6d2774d50751a4ca549dd636
