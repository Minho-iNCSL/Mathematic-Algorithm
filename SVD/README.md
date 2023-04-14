# SVD (Singular Value Decomposition)

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
