//
//  PosetView.h
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Big_collectioNView.h"
#import "Index_ColelctioNView.h"

@interface PosetView : UIView{
    Big_collectioNView *bigCollectioNView;
    UIView *headView;
    Index_ColelctioNView *index_colleView;
    UIControl *mask_view;//全局的遮罩视图
    UILabel *titlLabel;//盛放标题
    
}
@property (nonatomic, strong)NSArray *array;
@end
