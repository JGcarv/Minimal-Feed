
import UIKit

class ArticleDetailView: UIViewController {
    
    var fileURL: NSURL?

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.blackColor()
        self.navigationItem.backBarButtonItem?.title = ""
        
        //Load the HTML into the WebView
        webView.loadRequest(NSURLRequest(URL: fileURL!))

    }
}