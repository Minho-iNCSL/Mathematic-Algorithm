# SVD (Singular Value Decomposition) 📒

![image](https://user-images.githubusercontent.com/60316325/231943786-a65eba04-4671-40ba-be0a-e2e7ba9b82ee.png)

* It is one of  the most useful matrix decompositions.
* It is used for finding a solution of an over-determined set of equations.<br>
(즉, 방정식의 개수가 미지수의 개수보다 더 많은 경우 Over-determinded 되었다고 한다.)
* Let A be an $m\times n$ matrix with $m\ge n$.
    * A may be factored as $A = UDV^T$ <br>
        \- $U$ is an $m\times m$ orthogonal(직교) matrix.<br>
        \- $D$ is an $m\times n$ matrix. (non-diagonal terms are all zeros, 대각성분 빼고는 다 0.)<br>
        \- $V$ is an $n\times n$ orthogonal matrix.<br>
    * The fact that U has orthogonal columns means that $U^TU = I_{m\times m}$. 
    * $U$는, $AA^T$를 고유값분해하여 얻어진 직교행렬로, $U$의 열벡터를 $A$의 Left Singular Vector 라고 부른다. 
    * $V$는, $A^TA$를 고유값분해하여 얻어진 직교행렬로, $V$의 열벡터를 $A$의 Right Singular Vector 라고 부른다. 
    * $D$는 U와 V를 고유값분해하여 나오는 고유값(eigenvalue)들의 Square root를 대각원소로 하는 직사각 대각행렬.
    * $D$의 대각원소들을 A의 특이값(Singular Value)이라 부른다. (Singular Value $\ge$ 0) <br>

---

* When an equation looks like $X\mathbf{p} = \mathbf{y}$, we can simply use the pseudoinverse. <br>
( Refer to : Least Squares Method )
* What about an equation that looks like $X\mathbf{p} = 0$ ? <br>
  * $\mathbf{0}$ is not of interest, and a non-zero solution should be found.<br>
  * The pseudoinverse cannot be used to find $\mathbf{p}$. <br>
* For instance, we somtimes need to find a line using the model, $ax+by+c = 0$ instead of the model $y=ax+b$.
  * We have to find $\mathbf{p}$ for $X\mathbf{p} = 0$.
  
$$X =
\begin{bmatrix} 
x_1&y_1&1 \\ 
x_2&y_2&1 \\ 
\vdots&\vdots&\vdots \\ 
x_N&y_N&1 \end{bmatrix}, \quad
\mathbf{p} = 
\begin{bmatrix} 
a \\
b \\
c \\
\end{bmatrix}
$$

**In this case, we have to use the "sigular value decomposition (SVD)"**

---

* For $X\mathbf{p} = 0$, and $\mathbf{p}$ is a solution, Our goal is to find the $\mathbf{p}$ that minimizes $\parallel X\mathbf{p}\parallel$ subject to $\parallel \mathbf{p}\parallel = 1$.

  * Let $X$ be factorized into $UDV^T$ by SVD.
  * $\parallel X\mathbf{p}\parallel = \parallel UDV^T\mathbf{p}\parallel = \parallel DV^T\mathbf{p}\parallel$ <br>
  (Because, $U$ is an orthogonal(직교) Matrix, it does not change the norm) <br>
  * $\parallel V^T\mathbf{p}\parallel = \parallel \mathbf{p}\parallel$ <br>
  (Because, $V$ is also an orthogonal matrix.)<br>
  * Let $V^T\mathbf{p} = \mathbf{K}$.
  
* If we let $V^T\mathbf{p} = \mathbf{K}$, then $\parallel X\mathbf{p}\parallel = \parallel D\mathbf{K}\parallel$ and $\parallel \mathbf{p}\parallel = \parallel \mathbf{K}\parallel$.
* Our goal can be changed like... **find $\mathbf{K}$ that minimizes $\parallel D\mathbf{K}\parallel$ subject to $\parallel \mathbf{K}\parallel = 1$**.

---

* Because our goal is to find $\mathbf{K}$ that minimizes $\parallel D\mathbf{K}\parallel$ subject to $\parallel \mathbf{K}\parallel = 1$.
  * $D$ is a diagonal matrix with its diagonal entries in descending order (내림차순). <br>
  ($D$ 행렬은 대각선상에 위치한 원소들은 X의 특이값들로 이루어져있다.)
  * It follows that the solution to this problem is $\mathbf{K} = [0, 0, ..., 1]^T$.
  * $\mathbf{K} = V^T\mathbf{p} \Rightarrow \mathbf{p} = V\mathbf{K}$ (Because $V^{-1} = V^T$ when $V$ is an orthogonal matrix)
  * Because $\mathbf{p} = V\mathbf{K}$ and $\mathbf{K} = [0, 0, ..., 1]^T$, $\mathbf{p}$ is simply the last column of $V$.
  
    * 즉, $Ax = 0$의 형태일 때, 
    * 특이값이 모두 양수인 경우, 최소 특이값에 해당하는 근사 해, 즉 $x$는 $V$벡터의 가장 우측 열벡터가 해가 된다. <br>(A의 최소 특이값에 대응하는 right singular verctor)
    * 원래는 특이값들 중 0 이 존재하면, 그 특이값에 해당하는 $V$의 열벡터가 모두 해가 된다.
  
* In Conclusion..
  * Objective(목적) : Given a matrix $X$ with at least as many rows as columns, find $\mathbf{p}$ that minimizes $\parallel X\mathbf{p}\parallel$ subject to $\parallel \mathbf{p}\parallel = 1$. 
  * Solution(방안, 해) : $\mathbf{p}$ is the last column of $V$, where $UDV^T$ is the SVD of $X$.
  
---
  
![image](https://user-images.githubusercontent.com/60316325/232276716-c9410880-ef28-46f3-afa1-9e91977b1423.png)

