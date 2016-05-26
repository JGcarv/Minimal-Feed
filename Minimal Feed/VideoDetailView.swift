import UIKit

class VideoDetailView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var video: Video?
    var relatedVideos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the video HTML
        let HTMLString = video?.HTMLContent

        //Setup basic WebView attributes
        webView.opaque = false
        webView.backgroundColor = UIColor.clearColor()
        webView.scrollView.scrollEnabled = false
        webView.loadHTMLString(HTMLString!, baseURL: nil)
        
        //Get the array of related videos
        relatedVideos = (video?.getRelatedVideos())!
        
        
        //Fill the labels with specific content
        titleLabel.text = video!.title
        descriptionLabel.text = video?.description
        
    }

    //CollectionView behaviour
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedVideos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("relatedVideoCell", forIndexPath: indexPath) as! RelatedVideoCell
        
        cell.imageView.image = UIImage(named: relatedVideos[indexPath.item].mainImage)
        cell.titleLabel.text = relatedVideos[indexPath.item].title
                
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let selectedItem = relatedVideos[indexPath.item]
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        
        let videoView = storyboard.instantiateViewControllerWithIdentifier("videoView") as! VideoDetailView
        videoView.video = selectedItem
        navigationController?.pushViewController(videoView, animated: true)
        
    }
}
