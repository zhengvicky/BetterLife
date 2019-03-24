//
//  FirstViewController.swift
//  BetterLife
//
//  Created by Vicky Zheng on 3/23/19.
//  Copyright © 2019 Vicky Zheng. All rights reserved.
//

import UIKit

struct Quote: Decodable {
    let quote: String
    let author: String
}

class FirstViewController: UIViewController, UISearchBarDelegate {
    
    let cellReuseIdentifier = "RecipeCell"

    @IBOutlet weak var tableView: UITableView!
    var RecipeData: [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 100
        
        fetchRecipes() { recipes in
            print("Yo dawg. come get your watermelon! \(recipes[0])")
            self.RecipeData = recipes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
//        let url = "http://quotes.rest/qod.json?category=inspire"
//        let urlObj = URL(string: url)
//
//        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
//            //   debugPrint(data)
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
//                if(json != nil) {
//                    let contents = json!["contents"] as! [String: Any]
//
//
//
//                    debugPrint(contents as Any)
//                    let quotes = contents["quotes"] as! [Any]
//                    print(quotes as Any)
//                    let firstElement = quotes[0] as! [String: Any]
//                    let quote = firstElement["quote"]
//                    //    for quote in quotes! {
//                    //        let q = quote as Any
//                    //        debugPrint(q)
//                    //  print(quote)
//                    //   }
//                }
//
//            } catch {
//                print("error")
//            }
//            //            do {
//            //                let quotes = try JSONDecoder().decode([Quote].self, from: data!)
//            //                debugPrint(quotes)
//            //                for quote in quotes {
//            //                    print(quote.quote)
//            //                }
//            //
//            //            } catch let error {
//            //                print(error)
//            //            }
//
//            }.resume()
    }
    
    func fetchRecipes(completion: (([Recipe]) -> Void)? = nil) {
        let url = "https://www.food2fork.com/api/search?key=3cc31acb0cd37dda6ad985360cb79d3f&q=chicken%20breast"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)
                print(recipeResponse.recipes[0])
                
                completion?(recipeResponse.recipes)
            } catch let err {
                print(err)
            }
            
            }.resume()
    }
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard !RecipeData.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let recipe = RecipeData[indexPath.row]
        cell.textLabel?.text = recipe.title
        cell.detailTextLabel?.text = recipe.publisher
        var imageUrl = recipe.image_url
        
        // str.substring(3)
        imageUrl.insert("s", at: imageUrl.index(imageUrl.startIndex, offsetBy: 4))
        
        cell.imageView?.imageFromUrl(urlString: imageUrl)
        return cell
    }

}

