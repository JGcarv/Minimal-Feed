import UIKit

class Video: Content {
    

    let duration: String
    var HTMLContent: String?
    var tags: [VideoTags] = []
//    let frameWidth: CGFloat = 0
//    let frameHeight: CGFloat = 0
//    
    init(title: String, duration: String, mainImage: String, description: String, HTMLContent: String, tags: [VideoTags]){
        self.duration  = duration
        self.HTMLContent = HTMLContent
        for tag in tags{
            self.tags.append(tag)
        }
        super.init(title: title, mainImage: mainImage, description: description)
        
    }
    
    func addTags(tags: VideoTags...){
        for tag in tags {
            self.tags.append(tag)
        }
    }
    
    
    func getRelatedVideos() -> [Video] {
        
        var related :[Video] = []
        for video in Content.allVideos{
            for tag in self.tags{
                if (video.tags.contains(tag)){
                    if (!related.contains{$0.title == video.title}){
                        related.append(video)
                    }
                }
            }
        }
        return related
    }

    
}