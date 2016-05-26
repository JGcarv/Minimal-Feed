import UIKit

class ContentCell: UICollectionViewCell {
    
    var cellContent: Content? {
        didSet{

            if (cellContent is Article){
            
                let article = cellContent as! Article
                
                mainImage.image = UIImage(named: (article.mainImage))
                contentTitle.text = article.title
                contentDescription.text = (article.description)!
                contentCharacteristic.text = "By " + (article.autor)
                videoLabel.text = nil
            }
            
            if (cellContent is Video) {
                
                let video = cellContent as! Video
                
                mainImage.image = UIImage(named: (video.mainImage))
                contentTitle.text = video.title
                contentDescription.text = (video.description)!
                contentCharacteristic.text = video.duration
                videoLabel.text = " Vídeo "
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //Define Subviews
    
    let mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .ScaleAspectFill
        return image
    }()
    
    let contentTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.adjustsFontSizeToFitWidth = true
        label.allowsDefaultTighteningForTruncation = true
        label.font = UIFont(name: "PlayfairDisplay-Black", size: 17)
        return label
    }()
    
    let contentDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.preferredMaxLayoutWidth = 130
        label.textColor = UIColor(white: 0.5, alpha: 1)
        label.font = UIFont.systemFontOfSize(12)
        return label
    }()
    
    let contentCharacteristic: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.5, alpha: 1)
        label.font = UIFont.systemFontOfSize(10)
        return label
    }()
    
    let videoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(10)
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        return label
    }()
    
    
    
    
    func setUpCell(){
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(white: 0.7, alpha: 0.3).CGColor
        self.clipsToBounds = true
        
        addSubview(videoLabel)
        addSubview(mainImage)
        addSubview(contentTitle)
        addSubview(contentDescription)
        addSubview(contentCharacteristic)
        bringSubviewToFront(videoLabel)
        
        //Setup layout Constraints
        addConstraintsWithFormat("H:|-3-[v0]", views: videoLabel)
        addConstraintsWithFormat("V:|-3-[v0]", views: videoLabel)
        
        addConstraintsWithFormat("H:|[v0]|", views: mainImage)
        addConstraintsWithFormat("H:|-15-[v0]-15-|", views: contentTitle)
        addConstraintsWithFormat("H:|-15-[v0]-15-|", views: contentDescription)
        addConstraintsWithFormat("H:|-15-[v0]", views: contentCharacteristic)
        addConstraintsWithFormat("V:|[v0(150)]-10-[v1(80)]-10-[v2]-10-[v3(20)]-5-|", views: mainImage, contentTitle, contentDescription,contentCharacteristic)

    }
    
    
    
}

