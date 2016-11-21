//
//  TOP_MODEL.h
//  项目一
//
//  Created by Crystal on 16/7/20.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//
/*
{ "subjects": [
               {
                   "rating": {
                       "max": 10,
                       "average": 9.6,
                       "stars": "50",
                       "min": 0
                   },
                   "title": "肖申克的救赎",
                   "images": {
                       "small": "https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480747492.jpg",
                       "large": "https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p480747492.jpg",
                       "medium": "https://img3.doubanio.com/view/movie_poster_cover/spst/public/p480747492.jpg"
                   },
                   */

#import <Foundation/Foundation.h>

@interface TOP_MODEL : NSObject
@property (nonatomic, strong)NSDictionary *rating;
@property (nonatomic, strong)NSDictionary *images;
@property (nonatomic, copy)NSString *title;
@end







