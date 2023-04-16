# RANSAC (RANdom SAmple Consensus)

![image](https://user-images.githubusercontent.com/60316325/232277572-42dae5cd-96fb-4b8e-be50-72bc29f9d45c.png)

**One of the most widely used robust estimation methods. Particularly for 3D Computer Vision. Many Variants have benn suggested**

---

* Basic Philosophy of RANSAC
  * Data elements are used to vote for model.
  * Assumption #1 : Noisy data points will not vote consistently for any single model ("few" Outlier)
  * Assumption #2 : There are enough data points to agree on a good model ("few" missing data)

* Algorithm
  1) Select random sample of minimum required size to fit model. <br>
  (모델에 적용하기 위해, 무작위로 데이터를 선택. 최소한으로 요구하는 갯수만큼만) <br>
  2) Compute a putative model from sample set. <br>
  (선택한 무작위 데이터를 통해, 모델을 추정한다.)
  3) Compute the set of inliers to this model using the whole data set. <br>
  (추정한 모델을 사용하여, 전체 데이터 중 몇개가 inlier에 속하는지 계산한다.) <br>
  
  \- Repeat 1\~3, and select the model supported by the largest number of inliers <br>
  \- Optional : Calculate the final solution by applying the least squares method to all inliers. <br>
  (위의 1\~3 과정을 반복하여 가장 많은 inlier를 가지는 모델을 선택한다. 여기에 선택적으로 inlier들에 대해 LSE를 적용시켜도 된다.)
  
![image](https://user-images.githubusercontent.com/60316325/232279077-a6fd69de-47ca-4d36-bb16-f0f9f4ac36e0.png)

---

### RANSAN Parmaters

1. **Inlier Threshold** <br>
  \- Related to the amount of noise we expect in inliers ( $\delta$ in image )
    * Often model noise as Gaussian with a standard deviation of $\sigma$.
    * Set the inlier threshold to $k\sigma$.
2. **Number of rounds (iteration)** <br>
  \- Related to the percentage of outliers we expect, and the probability of success we'd like to guarantee
    * Suppose there are 20% outliers and we want to find the correct answer with 99.9% probability...
    * How many rounds (N) do we need ??
    * Choose the number of rounds($N$) with the probability($p$) so that at least one random sample is free from ouliers.<br>
    
    $$(1-(1-e)^s)^N = 1-p $$ 
    
    * 쉽게 $p$는 RANSAC의 성공확률이며, $e$는 전체 데이터에서 outlier의 비율을 나타낸다.
    * The proportion(비율) of ouliers is $e$, and the number of samples is $s$.
    * $(1-e)$ : Probability that a sample is an inlier. (선택한 샘플이 inlier일 확률)<br>
      $(1-e)^s$ : Probability that a $s$ samples are all inlier. ($s$개의 샘플이 모두 inlier일 확률)<br>
      $(1-(1-e)^s)$ : Probability that $s$ samples includes outliers. ($s$개의 샘플이 outliers를 포함할 확률)<br>
      $(1-(1-e)^s)^N$ : Probability that $s$ samples includes outliers during all $N$ rounds. <br>
      $\qquad \qquad \qquad \quad$ (모든 $N$번의 반복에서 $s$개의 샘플이 outliers를 포함할 확률) <br>
      
    $$N = {log(1-p) \over log(1-(1-e)^s)}$$

---

![image](https://user-images.githubusercontent.com/60316325/232286407-26d7d448-6601-4295-acbf-5dcd8ee7c39e.png)

![image](https://user-images.githubusercontent.com/60316325/232287064-2eb8a9f4-d9e1-413f-a408-da423394dfeb.png)

* Further, There have been suggested many other robust estimation methods.
  * Least Median of Squares (LMedS)
  * M-estimator
  * Hough Transform

---

### Problem..

1. Each Iteration the RANSAC result can be different.
2. Mathematical probability is probability, and no solution can be found no matter how much $N$ is increased.
3. If Outliers are not randomly distributed, something like structure, RANSAC result maybe approximation of outlier's distribution
4. The method of estimating a model with only a few samples can make a big problem depending on the situation. <br>
(포물선의 경우 3개의 점으로 결정 가능하지만, 추정하는 과정에서 포물선의 한쪽 면에서 뽑힌 인접한 3개의 점을 사용하게 된다면?...) 
