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
  (추정한 모델을 사용하여, 전체 데이터 중 몇개가 inlier에 속하는지 계산한다.)
  
  * Repeat 1\~3, and select the model supported by the largest number of inliers <br>
  * Optional : Calculate the final solution by applying the least squares method to all inliers. <br>
  (위의 1\~3 과정을 반복하여 가장 많은 inlier를 가지는 모델을 선택한다. 여기에 선택적으로 inlier들에 대해 LSE를 적용시켜도 된다.)
  
