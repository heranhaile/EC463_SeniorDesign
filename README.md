# EC463_SeniorDesign

## Description/Project Overview
 PrintAR is an iOS mobile application in swift, developed using xcode. It is built mainly using ARkit and Scenekit frameworks provided by apple. See the software documentation for more specific technical information regarding the project. Note that, as a predominantly software based project, there is little hardware involved in this.
 
 Currently, the application simply compiles and detects the images that are incorporated directly into the application without any access to the internet. The application is fully functional.
 
## Notes/advice to any future extension

If you are looking to develop an extension of this project to include a database, I recommed looking into this repository: https://github.com/BlackMirrorz/ARKitDynamicReferenceImages. The application builds detected images based on an URL (That no longer is working and should be revised in the original link provided).

If one encounters a problem with the development of this program, one likely sourcce of a bug is not a part of the code, but possibly the image files you are using for your project. Read into this post by Google on what makes a good tracking image: https://developers.google.com/ar/develop/augmented-images. One frequent problem for us in the development process was the lack of details in the image. Modifying the image slightly can be a great help at times.

When making/choosing the images and videos for the application, remember to check if the file types are appropriate for ARkit and relevant frameworks. Using PNG for the images and mp4's for the videos is a proven and verified option from us.

If the image is not the problem and googling/stackoverflow can't fix your problem, try looking into the apple documentation page for your framework: https://developer.apple.com/documentation/arkit. 

## Design Choices

The application does not have much interface or additional features - this was intentional due to the fact that the application would be used for individuals with disabilities. It would make little sense to have many, compact features that is hard to understand for the viewers.

Videos were used in place of 3D models (Which is more standard choice) per the request of the clients. We feared that a 3D modelling may confuse or frighten some users as opposed to real people being involved

The lack of a database was due to two factors - our initial misunderstanding (which was debunked much later) that the internet connection at the client was unstable and the fact that the total file size of the application would be small enough to be all stored within the application without the need for a database.

ARkit was chosen over other platforms for various reasons. We had once considered using vuforia, but that would be costly and be much more complicated and difficult than arkit. Although, it does have the benefit that it could be developed for cross platform development. Some other platforms that we considered such as SparkAR was rejected by the client directly.

