//
//  ViewController.swift
//  ImageDetectionAR
//
//  Created by Wenting Yu on 11/14/21.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var videoNode:SCNNode!
    var targetVideoPlayer:AVPlayer!
    var playerDict: [String: AVPlayer] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/VideoScene.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        configuration.maximumNumberOfTrackedImages = 1 // set to detect 1 image at a time
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {return}
        
        configuration.trackingImages = referenceImages

        // Run the view's session
        sceneView.session.run(configuration, options:[.resetTracking, .removeExistingAnchors])
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func createVideoNodeFor(_ target: ARReferenceImage) -> (SCNNode,AVPlayer) { // function to add a video node to a reference image
        
        let videoPlayerNode = SCNNode()
        
        let videoPlayerGeometry = SCNPlane(width: target.physicalSize.width, height: target.physicalSize.height)
        
        var videoPlayer = AVPlayer()
        
        if let targetName = target.name,
           let validURL = Bundle.main.url(forResource: targetName, withExtension: "mp4") {
            videoPlayer = AVPlayer(url: validURL)
            playerDict[targetName] = videoPlayer
        }
        
        videoPlayerGeometry.firstMaterial?.diffuse.contents = videoPlayer
        videoPlayerNode.geometry = videoPlayerGeometry
        
        videoPlayerNode.eulerAngles.x = -.pi/2
        targetVideoPlayer = videoPlayer
        return (videoPlayerNode,videoPlayer)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard let validAnchor = anchor as? ARImageAnchor else { return }
        print("created!")
        let videoCollection = createVideoNodeFor(validAnchor.referenceImage)
        
        videoNode = videoCollection.0
    
        node.addChildNode(videoNode)
        targetVideoPlayer.play()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let validAnchor = anchor as? ARImageAnchor else { return }
        let videoPlayer = playerDict[validAnchor.referenceImage.name!]!
        if validAnchor.isTracked {
            videoPlayer.play()
            //node.addChildNode(createVideoNodeFor(imageAnchor.referenceImage).0)
        } else {
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.pause()
            return
        }
    }

}
