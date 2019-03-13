//
//  PhotoViewController.swift
//  Project3
//
//  Created by Arash Zakeresfahani on 3/12/19.
//  Copyright © 2019 Arash Zakeresfahani. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedRowIndexpath: Int?
    var totalCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.backgroundColor = UIColor.lightGray
        
        if let imageToLoad = selectedImage {
            print(imageToLoad)
            imageView.image = UIImage(named: imageToLoad)
            title = "\(imageToLoad)"
        }
        


        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("No Image Found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

}
