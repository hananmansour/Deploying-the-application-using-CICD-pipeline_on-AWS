<h1>Deploying-the-application-using-CICD-pipeline-on-AWS</h1>


 1. Create a Jenkins Server with all the dependencies, libraries, and packages needed,the code in terraform-code-to-create-Jenkins-server-main dir
 2. Once completed, access the Jenkins server and Set it up .
 3. Run the provision-eks-cluster-main to create EKS .
 4. then access jenkins server and create your pipeline,this pipeline build the code of the Application and push the image to docker hub with build number tag ,if any change happen the pipeline will work and push another version of the image and deploy that app version to eks.
 5. finally access your service
    

![8](https://github.com/hananmansour/Deploying-the-application-using-CICD-pipeline_on-AWS/assets/66485038/b9886b9c-ec65-4003-8504-efb2c1ac6bfc)


<h2>that is the solution</h2>  

![final_final](https://github.com/hananmansour/Deploying-the-application-using-CICD-pipeline_on-AWS/assets/66485038/59b02af8-b0bd-4a7c-a1f1-a44f5df0caef)



 

