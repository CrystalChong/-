//
//  Cinema_Model.m
//  项目一
//
//  Created by Crystal on 16/7/18.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Cinema_Model.h"

@implementation Cinema_Model
//根据字典里面key去我的属性里面去找  如果找不到  就会调用这个方法
//key 就是  lowPrice  key  distance
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

    //[key isEqualToString:<#(nonnull NSString *)#>]判断字符创是否相同
    if([key isEqualToString:@"id"]){
    
        self.my_id = value;
    
    }


}

@end
