//
//  Movie.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 23.11.2022.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}



/* API Result[0]
{
adult = 0;
"backdrop_path" = "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg";
"genre_ids" =             (
28,
14,
878
);
id = 436270;
"media_type" = movie;
"original_language" = en;
"original_title" = "Black Adam";
overview = "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods\U2014and imprisoned just as quickly\U2014Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.";
popularity = "22201.949";
"poster_path" = "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg";
"release_date" = "2022-10-19";
title = "Black Adam";
video = 0;
"vote_average" = "7.042";
"vote_count" = 1489;
} */
