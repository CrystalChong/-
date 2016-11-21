//
//  Top_Comment_list_model.h
//  项目一
//
//  Created by Crystal on 16/7/22.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 {
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "yangna988",
 "rating" : "9.0",
 "content" : "儿子很喜欢 一直期盼上映"
 }
 */

@interface Top_Comment_list_model : NSObject
@property (nonatomic, copy)NSString *userImage;
@property (nonatomic, copy)NSString *content;
@end
