//
//  YoutubeSearchResponse.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 30.11.2022.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [Items]
}

struct Items: Codable {
    let id: VideoId
}

struct VideoId: Codable {
    let kind: String
    let videoId: String
}

/*
 {
 items =     (
 {
 etag = V8LmFuuv6a1tx4t9D1zU60gDuoo;
 id =             {
 kind = "youtube#video";
 videoId = sAwwnLCiea0;
 };
 kind = "youtube#searchResult";
 },
 )
 }
 */
