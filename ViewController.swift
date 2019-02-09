//
//  ViewController.swift
//  fdjkkfjdjfdfjdkf
//
//  Created by Mac on 2/9/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        AppCategory.fetchedFeaturedApps()
        
        
    }
    
    override func viewDidLayoutSubviews(){
      
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
    }


}





    class AppCategory: NSObject{
        var name: String?
        var apps: [CategoryApp]?
        
        static func fetchedFeaturedApps(){
            let jsonUrlString = "https://api.letsbuildthatapp.com/appstore/featured"
            guard let url = URL(string: jsonUrlString) else {return}
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                guard let data = data else {return}
                do{
                    let featured = try JSONDecoder().decode(Featured.self, from: data)
                    print(featured)
                }catch{
                    print(error)
                }
                }.resume()
        }
    }




struct Featured: Codable {
    let bannerCategory: BannerCategory
    let categories: [Category]
}

struct BannerCategory: Codable {
    let name: String
    let apps: [BannerCategoryApp]
    let type: String
}

struct BannerCategoryApp: Codable {
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case imageName = "ImageName"
    }
}

struct Category: Codable {
    let name: String
    let apps: [CategoryApp]
    let type: String
}

struct CategoryApp: Codable {
    let id: Int?
    let name, category: String?
    let price: Double?
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case price = "Price"
        case imageName = "ImageName"
    }
}


