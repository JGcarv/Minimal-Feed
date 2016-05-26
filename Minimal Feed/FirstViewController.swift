//
//  ViewController.swift
//  Minimal Feed
//
//  Created by Joao Gabriel Carvalho on 25/05/16.
//  Copyright © 2016 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import CollectionViewWaterfallLayout

class FirstViewController: UICollectionViewController, CollectionViewWaterfallLayoutDelegate {

    var contentList = [Content]()
    var cellSizes = [CGSize]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Setup the NavBar
        navigationItem.title = "MinFeed"
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName:UIFont(name: "Playfair Display", size: 18)!]
        
        
        //Setup the collectionView attributes
        collectionView?.alwaysBounceVertical = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.registerClass(ContentCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        
        //Add the dummyData to the needed arrays
        contentList = [videoTwo,stroryTwo,videoEight,storyThree,videoSix,videoFour, videoFive, storyOne, videoSeven, videoOne, videoThree]
        Content.allVideos = [videoThree,videoEight,videoSix,videoFour, videoFive, videoSeven, videoOne, videoTwo]
        
        
        //Get the size of each cell - necessary for the waterfallLayout
        for content in contentList {
            cellSizes.append(content.calculateCellHeight((view.frame.width - 36)/2))
        }

    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentList.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath) as! ContentCell
        
        cell.cellContent = contentList[indexPath.item]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSizes[indexPath.item]
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let selectedItem = contentList[indexPath.item]
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        
        if (selectedItem is Article){
            
            let selectedArticle = selectedItem as! Article
            let articleView = storyboard.instantiateViewControllerWithIdentifier("articleView") as! ArticleDetailView
            articleView.fileURL = selectedArticle.URL
            navigationController?.pushViewController(articleView, animated: true)
        }
        
        if (selectedItem is Video){
            let videoView = storyboard.instantiateViewControllerWithIdentifier("videoView") as! VideoDetailView
            let selectedVideo = selectedItem as! Video
            videoView.video = selectedVideo
            navigationController?.pushViewController(videoView, animated: true)
        }
    }

}

