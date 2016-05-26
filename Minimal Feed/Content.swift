import UIKit

class Content {
    
    let title: String
    let mainImage: String
    let description: String?
    static var allVideos: [Video] = []
    
    init(title: String, mainImage: String, description: String?){
        
        self.title = title
        self.mainImage = mainImage
        self.description = description
        
    }
    
    func calculateCellHeight(width: CGFloat) -> CGSize {
        
        let fixedSizes = CGFloat(305)
        let size = CGSizeMake(width, 1000)
        let option = NSStringDrawingOptions.UsesFontLeading.union(.UsesLineFragmentOrigin)
        let estimatedFrame = NSString(string: self.description!).boundingRectWithSize(size, options: option, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(12)], context: nil)
        
        return CGSizeMake(width, estimatedFrame.height + fixedSizes)
    }
    
}
