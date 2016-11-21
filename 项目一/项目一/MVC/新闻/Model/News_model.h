//
//  News_model.h
//  项目一
//
//  Created by Crystal on 16/7/18.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 {
 "id" : 1491552,
 "type" : 1,
 "image" : "http://img31.mtime.cn/mg/2012/06/28/112005.28198250.jpg",
 "title" : "《小律师有大作为》宣传海报",
 "summary" : "小律师有大作为,TNT,律政剧"
 }
 */
@interface News_model : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *summary;
@property (nonatomic, copy)NSString *image;
@property (nonatomic, strong)NSNumber *type;
@property (nonatomic, copy)NSString *SB_id;

@end




