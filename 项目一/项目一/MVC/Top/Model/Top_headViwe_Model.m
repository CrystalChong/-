//
//  Top_headViwe_Model.m
//  项目一
//
//  Created by Crystal on 16/7/22.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Top_headViwe_Model.h"

@implementation Top_headViwe_Model
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    //判断一下  key 是否是我刚才自定义的属性;
    if ([key isEqualToString:@"release"]) {
        _my_release = value;
    }
    
}
@end
