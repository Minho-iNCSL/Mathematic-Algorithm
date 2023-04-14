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

For $X\mathbf{p} = 0$, and $\mathbf{p}$ is a solution, Our goal is to find the $\mathbf{p}$ that minimizes 
