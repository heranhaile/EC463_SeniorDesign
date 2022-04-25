# EC463_SeniorDesign

## Description
 PrintAR is an iOS mobile application in swift, developed using xcode. It is built mainly using ARkit and Scenekit frameworks provided by apple. See the software documentation and Hardware_readme for more specific technical information regarding the project. As a software based project, there is little hardware involved in this.
 
 Currently, the application simply compiles and detects the images that are incorporated directly into the application without any access to the internet. The application is fully functional.
 
## Notes/advice to any future extension

If you are looking to develop an extension of this project to include a database, I recommed looking into this repository: https://github.com/BlackMirrorz/ARKitDynamicReferenceImages. The application builds detected images based on an URL (That no longer is working and should be revised in the original link provided).

If one encounters a problem with the development of this program, one likely sourcce of a bug is not a part of the code, but possibly the image files you are using for your project. Read into this post by Google on what makes a good tracking image: https://developers.google.com/ar/develop/augmented-images. One frequent problem for us in the development process was the lack of details in the image. Modifying the image slightly can be a great help at times.

When making/choosing the images and videos for the application, remember to check if the file types are appropriate for ARkit and relevant frameworks. Using PNG for the images and mp4's for the videos is a proven and verified option from us.

If the image is not the problem and googling/stackoverflow can't fix your problem, try looking into the apple documentation page for your framework: https://developer.apple.com/documentation/arkit. 
