//
//  utilities.swift
//  BetterLife
//
//  Created by Vicky Zheng on 3/23/19.
//  Copyright © 2019 Vicky Zheng. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let imageData = data as Data? {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }.resume()
    }
}
