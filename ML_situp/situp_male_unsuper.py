
# coding: utf-8


# In[10]:


import pandas as pd
from sklearn import metrics
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
import sys


# In[2]:


data = pd.read_excel('C:\\Users\\user\\ML_situp\\situp_unsuper_male.xlsx')


# In[3]:


X=data.iloc[:,:-1]
y = data.iloc[:,-1]


# In[5]:


X_train,X_test,y_train,y_test = train_test_split(X,y,random_state=0,test_size = 0.3)


# In[6]:


model = KNeighborsClassifier(n_neighbors = 5)


# In[7]:


model.fit(X_train,y_train)


# In[8]:


model.score(X_test,y_test)


# In[11]:

age = int(sys.argv[1])
height = int(sys.argv[2])
height_real = height/100
weight = int(sys.argv[3])
bmi = weight/height_real/height_real
muscle = int(sys.argv[4])
situp = int(sys.argv[5])


# In[9]:


pre = model.predict([[1,age, height, weight, bmi, muscle, situp]])

print(pre)

