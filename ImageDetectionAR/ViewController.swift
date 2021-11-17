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
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard anchor is ARImageAnchor else {return}
        
        //Container
        
        guard let container = sceneView.scene.rootNode.childNode(withName: "container", recursively: false) else {return}
        
        container.removeFromParentNode()
        node.addChildNode(container) //connect to our reference image // videoScene will move around with the image
        container.isHidden = false
        
        //Video
        
        let videoURL = Bundle.main.url(forResource: "YesVideo", withExtension: "mp4")!
        
        let videoPlayer = AVPlayer(url: videoURL)
        
        let videoScene = SKScene(size: CGSize(width: 720, height: 1280))
        
        let videoNode = SKVideoNode(avPlayer: videoPlayer)
        
        videoNode.position = CGPoint(x: videoScene.size.width/2, y: videoScene.size.height/2)
        
        videoNode.size = videoScene.size
        
        videoNode.yScale = -1
        
        videoNode.play()
        
        videoScene.addChild(videoNode)
        
        guard let video = container.childNode(withName: "video", recursively: true) else {return}
        
        video.geometry?.firstMaterial?.diffuse.contents = videoScene
    
    }
}
