
import UIKit

class Article: Content {

    var autor: String
    var URL: NSURL
    
    init(title: String, autor: String, mainImage: String, description: String, URLFileName: String){
        self.autor = autor
        self.URL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(URLFileName, ofType: "html")!)
        super.init(title: title, mainImage: mainImage, description: description)
    }

}