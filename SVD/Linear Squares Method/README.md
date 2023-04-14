# SVD for Least Squares Method

### Introduction

![image](https://user-images.githubusercontent.com/60316325/231946478-17f34786-2c1e-45a1-b3a6-9b4dbac15283.png)

* How can we find parameters of the line passing through points? **(Left Image)**<br>
  * Model : $y = ax + b$ <br>
  * Parameters : $a$ & $b$

  Because there are two parameters, we need at least two points to find them. <br>
  * Two unknown can be found by two equations <br> 
  $y_1 = ax_1 + b$. <br>
  $y_2 = ax_2 + b$. <br>

* How can we find parameters when there are more than two points that involves noise. **(Right Image)**<br>
  * Model : $y = ax + b$ <br>
  * Parameters : $a$ & $b$
  
  How can we determine the best line? <br>

---

### Least Squares Method

![image](https://user-images.githubusercontent.com/60316325/231948483-98410693-0927-43a2-b23c-8fd31558bccf.png)

**True 와 Estimate 의 차이를 최소화 하는 파라미터가 곧 최고의 직선이 될 것이다.**

* The Best line parameter can be said to be the parameters that minimize error.
  * Error : $e_i = y_i - \hat{y}\_i = y_i - (ax_i + b)$ <br>
  (실제 point의 $y$ 위치와, 실제 $x$ 위치에서의 추정한 직선(그래프) $\hat{y}$ 의 차이) <br>
  * $e_i$ can be negatvie, so we calculate $e_i^2$ to make it positive. If we have N points, we can minimize...<br>
  
  $$\displaystyle\sum_{i=1}^{N} e_i^2 = \sum_{i=1}^{N} {y_i - (ax_i + b)}^2$$ 
  
  * Matrix form given as...
  
$$\displaystyle\sum_{i=1}^{N} e_i^2 = \sum_{i=1}^{N} {y_i - (ax_i + b)}^2 = (\mathbf{y} - X\mathbf{p})^T(\mathbf{y} - X\mathbf{p}) = \mathbf{J}$$
  
$$X\equiv 
\begin{bmatrix} x_1 & 1 \\
x_2 & 1 \\ 
\vdots &  \\ 
x_N & 1 
\end{bmatrix}, \quad
\mathbf{p}\equiv
\begin{bmatrix} a \\
b \end{bmatrix}, \quad
\mathbf{y} = 
\begin{bmatrix} y_1 \\
y_2 \\ 
\vdots\\ 
y_N 
\end{bmatrix} \qquad
\mathbf{y} = X\mathbf{p}$$

  * What we have to do next is to find $\mathbf{p}$ which minimizes $\mathbf{J}$. To do this, we will differentiate $\mathbf{J}$ and ${\partial\mathbf{J} \over \partial\mathbf{p}} = 0$.

$$\mathbf{J} = (\mathbf{y} - X\mathbf{p})^T(\mathbf{y} - X\mathbf{p}) = \mathbf{y}^T\mathbf{y} -2\mathbf{p}^TX^T\mathbf{y} + \mathbf{p}^TX^TX\mathbf{p}$$

$${\partial\mathbf{J} \over \partial\mathbf{p}} = {\partial({\mathbf{y}^T\mathbf{y} -2\mathbf{p}^TX^T\mathbf{y} + \mathbf{p}^TX^TX\mathbf{p}}) \over \partial\mathbf{p}} = -2X^T\mathbf{y} + 2X^TX\mathbf{p} = 0$$

$$2X^TX\mathbf{p} = 2X^T\mathbf{y}$$

$$X^TX\mathbf{p} = X^T\mathbf{y}$$

$$\mathbf{p} = (X^TX)^{-1}$X^T\mathbf{y}$$

  * **This is called Least square method**

  * $(X^TX)^{-1}X^T$ often called PseudoInverse because it is a fake inverse of $X$. <br>
  \- Assume that we have $X\mathbf{p} = \mathbf{y}$ where $X: N\times M, \mathbf{p}: M\times 1,$ and $\mathbf{y}: N\times 1$ <br>
  \- Because X is not a square matrix. so inverse of X cannot be calculated. <br>
  \- In this case, we can use a pseudoInverse to find $\mathbf{p}$ <br>
  \- **But this only possible when $N\ge M$.** <br>

  $\qquad$ ![image](https://user-images.githubusercontent.com/60316325/231953890-51d063d2-0e9b-47df-af4c-8f16b5256eb7.png) <br>




