//
//  recipesAPI.swift
//  BetterLife
//
//  Created by Vicky Zheng on 3/23/19.
//  Copyright © 2019 Vicky Zheng. All rights reserved.
//

import Foundation

struct RecipeResponse: Decodable {
    var count: Int
    var recipes: [Recipe]
}

struct Recipe: Decodable {
    var publisher: String
    var f2f_url: String
    var title: String
    var source_url: String
    var recipe_id: String
    var image_url: String
    var social_rank: Float
    var publisher_url: String
}
