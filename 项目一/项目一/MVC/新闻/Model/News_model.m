//
//  News_model.m
//  项目一
//
//  Created by Crystal on 16/7/18.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "News_model.h"

@implementation News_model
//KVC
//[model setvalueforkeyWithdictionary:dic];
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //key  id
    //valeu  1491552
    
    if ([key isEqualToString:@"id"]) {
        _SB_id = value;
    }
}
@end
