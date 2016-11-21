//
//  JsonDataSeverice.m
//  项目一
//
//  Created by Crystal on 16/7/15.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "JsonDataSeverice.h"

@implementation JsonDataSeverice

+ (id)ObjectOfJSONWithname:(NSString *)name{

    //加载JSON文件
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
    //转化成数据(根据一个路劲去转化文件  转化成data)
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //想不要管他
    NSError *error = nil;
    
    //NSJSONReadingMutableContainers 把Data转化成一个可变的容器
   id JSON =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers  error:&error];
    
    //    NSLog(@"%@",error);
    if (error) {
        NSLog(@"%@",error);
        return nil;
    }
    return JSON;
    
}
@end
