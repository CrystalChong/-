//
//  CInema_CELL_MODEL.h
//  项目一
//
//  Created by Crystal on 16/7/15.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CInema_CELL_MODEL : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *year;
@property (nonatomic, strong)NSDictionary *rating;
@property (nonatomic, strong)NSDictionary *images;

@end
