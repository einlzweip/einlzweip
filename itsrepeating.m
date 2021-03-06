
#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Jul  1 12:01:48 2019

@author: schollpp
"""

# -*- coding: utf-8 -*-
"""
Created on Mon Jul  1 11:03:45 2019

@author: Uschi
"""


import collections
import numpy as np
import time
import csv
import operator
import itertools
 
name = "bananas-1-2d"
l = 5
KSET = np.arange(1,20,1)

Node = collections.namedtuple("Node", 'point axis left right')
#x=[1,0.5,0.5,0.5,0.5,0.5,0.5,0.6,0.5,0.5,0.5]

class KDTree(object):    
    def __init__(self, k, objects):

        def build_tree(objects, bxis=1):

            if not objects:
                return None

            objects.sort(key=lambda o: o[bxis])
            median_idx = len(objects) // 2
            median_point = objects[median_idx]

            next_axis = bxis % k + 1 #(((bxis + 1) % k) + (bxis % 2) * 2)
            return Node(median_point, bxis,
                        build_tree(objects[:median_idx], next_axis),
                        build_tree(objects[median_idx + 1:], next_axis))

        self.root = build_tree(list(objects))        

    def nearest_neighbor(self, k, e, destination):

        best = []
        for i in range(e):
            best.append([0,2*k])

        def recursive_search(here):

            if here is None:
                return

            point, bxis, left, right = here
            here_sd = d(point, destination)
            if here_sd < best[e-1][1]:
                for f in range(e):
                    if(here_sd < best[f][1]):
                        best[f+1:e] = best[f:e-1]
                        best[f]=[point,here_sd]
                        break
#                    j=int(e/2)
#                    u=0
#                    o=e-1
#                    while j>0:
#                        if(here_sd<best[u+j-1][1]):
#                            o=o-j
#                        else:
#                            u=u+j
#                        if(o-u==j):
#                            j=int(j/2)
#                        else:
#                            j=int(j/2)+1
#                        best[u+1:e] = best[u:e-1]
#                        best[u]=[here_sd]

            diff = destination[bxis] - point[bxis]
            close, away = (left, right) if diff <= 0 else (right, left)

            recursive_search(close)
            if diff * diff < best[e-1][1]:

                recursive_search(away)

        recursive_search(self.root)
        return best
        #self.nearest_neighbor = nearest_neighbor(self, destination) 



def d(x,b):
    n = np.size(x)
    s = 0
    for i in np.arange(1,n,1):
        s = s + (x[i] - b[i])*(x[i]-b[i])
    return s

def classify(name, KSET, l):
    tic=time.time()
    data2 = np.genfromtxt("{}.test.csv".format(name), delimiter = ",")
    writer = csv.writer(open("{}.result.csv".format(name), "w"))
    data = np.genfromtxt("{}.train.csv".format(name), delimiter = ",")
    np.random.shuffle(data)

    

#def square_distance(a, b):
 #   s = 0
 #   for x, y in itertools.izip(a, b):
 #       d = x - y
 #       s += d * d
 #   return s



    k=np.size(data,axis=1)-1
    def f_Dg(A,e,x):
        Ab = A.nearest_neighbor(k,e,x)
        #s = 0
        idx0 = operator.itemgetter(0)
        Abs = itertools.imap(idx0,Ab[0:e])
        s = sum(itertools.imap(idx0,Abs))
        #for i in range(e):
        #    s = Ab[i][0][0] + s
        f_Df=0
        if s == 0:
            f_Df = 1
        else:
            f_Df = np.sign(s)
        return f_Df, Ab
#x=[1,0.5,0.5,0.5,0.5,0.5,0.5,0.6,0.5,0.5,0.5]


        




    b=np.size(data, axis = 0)
#K=np.arange(10,21,1)
    m=b % l
    a=0
    D=[]
    for i in range(m):
        D.append(data[a:a+b/l+1,:])
        a=a+b/l+1
    for i in range(l-m):
        D.append(data[a:a+b/l,:])
        a=a+b/l
    f=[float(0)]*np.size(KSET)
    g=[float(0)]*np.size(KSET)
    h=np.array([float(0)]*np.size(KSET))
    A=[]
    for i in range(l):        
        Di=np.zeros((b-np.size(D[i],axis=0),k+1))
        a=0
        for j in range(l):
            if (not j == i):
                Di[a:a+np.size(D[j],axis=0),0:k+1]=D[j]
                a=a+np.size(D[j],axis=0)
        A.append(KDTree(k,Di))

    for i in range(l):
#        Di=np.zeros((b-np.size(D[i],axis=0),3))
#        a=0
#        for j in range(l):
#            if (not j == i):
#                Di[a:a+np.size(D[j],axis=0),0:3]=D[j]
#                a=a+np.size(D[j],axis=0)
#        A = KDTree(2,Di)
#        KDi=A[i].nearest_neighbor(k,e,x)
#        KDi=A.nearest_neighbor(2,e,x)
        g=[float(0)]*np.size(KSET)
        for j in range(np.size(D[i], axis = 0)):
            t=0
            Ab = A[i].nearest_neighbor(k,KSET[-1],D[i][j,:])
            idx0 = operator.itemgetter(0)
            Abs = itertools.imap(idx0,Ab[0:KSET[0]])
            
            
#        s,Ab = f_Dg(A[i],K[-1],D[i][j,:])
#        if (not s == D[i][j,0]):
#            f[-1]= f[-1] + 1
#        f[-1]=f[-1]/np.size(D[i],axis=0)
#        g[-1]+=f[-1]
#        f[-1]=float(0)
#        for ij in np.arange(0,K[0]+1,1):
#            t+=Ab[ij][0][0]
        
            for e in np.arange(0,np.size(KSET),1):
                f[e]=float(0)
                
                if(e==0):
                    #t = np.sum(Ab[0:KSET[0]+1][0][0])
                    t += sum(itertools.imap(idx0,Abs))
                    #for ij in np.arange(0,KSET[0],1):
                    #    t+=Ab[ij][0][0]
                else:
                    Abs2 = itertools.imap(idx0,Ab[KSET[e-1]:KSET[e]])
                    t += sum(itertools.imap(idx0,Abs2))
                    #t = np.sum(Ab[KSET[e-1]:KSET[e]+1][0][0])
                    #for ij in np.arange(KSET[e-1],KSET[e],1):
                    #    t+=Ab[ij][0][0]
                
                if t == 0:
                    f_Df = 1
                else:
                    f_Df = np.sign(t)
                if (not f_Df == D[i][j,0]):
                    f[e] = f[e] + 1
                f[e]=f[e]/np.size(D[i],axis=0)
                g[e]+=f[e]
            
        h=h+g
#            s = f_Dg(A,e,[1,D[i][j,1],D[i][j,2]])
##    if(j==305):
# #       A = KDTree(2,e,D[i][j,:],Di)
#  #      Ab = A.nearest_neighbor
#   #     print(Ab)
#            if (not s == D[i][j,0]):
#                f = f + 1
   #     #falsi.append(j)
#        f=f/np.size(D[i],axis=0)    
    h/=l
    k1=np.argmin(h)+1
    F = 0.0
    B = KDTree(k,data)
    for i in range(np.size(data2, axis=0)):
        x = data2[i,:]
        y, Abs = f_Dg(B, k1, x)
        vector = (y,)
        for j in range(np.size(x)-1):
            vector = vector + (x[j+1],)
        writer.writerows([vector])
        if not y == x[0]:
            F += 1
    F = F/np.size(data2, axis=0)
    print F
    toc=time.time()
    print(toc-tic)
    return h
