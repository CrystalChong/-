//
//  Top_250_CELL.m
//  项目一
//
//  Created by Crystal on 16/7/22.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Top_250_CELL.h"


@implementation Top_250_CELL
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self != nil) {
       
        UIImageView *imageview1 = [[UIImageView alloc]initWithFrame:CGRectZero];
        imageview1.tag = 3100;
        [self.contentView addSubview:imageview1];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
        label.tag = 3101;
        [self.contentView addSubview:label];
        //因为在PCH文件里面已经定义了;(在PCH文件里面最好不要定义太多的宏或者文件)(项目做完之后再说)

        //self.width  不管用  只要是兴新视图的  高度决定整个星星视图的大小
        StartView *start = [[StartView alloc]initWithFrame:CGRectMake(0, self.height - 30, self.width, 18)];
        start.tag  = 3102;
        [self.contentView addSubview:start];
        
        
    }
    return self;
}

- (void)setModel:(TOP_MODEL *)model{

    _model = model;
    //让子视图布局
    [self setNeedsLayout];

}

- (void)layoutSubviews{
    
    UIImageView *imageview1 = [self.contentView viewWithTag:3100];
    UILabel *label = [self.contentView viewWithTag:3101];
    StartView *start = [self.contentView viewWithTag:3102];
    
    imageview1.frame = CGRectMake(0, 0, self.width, self.height - 30);
    
    [imageview1 sd_setImageWithURL:[NSURL URLWithString:_model.images[@"medium"]]];
    
    label.frame = CGRectMake(0, CGRectGetMaxY(imageview1.frame) - 20, self.width, 20);
    label.backgroundColor = [UIColor colorWithWhite:.2 alpha:.4];
    label.text = _model.title;
    //居中
    label.textAlignment = NSTextAlignmentCenter;
    //修改文字的大小
    label.font = [UIFont systemFontOfSize:12];
    //修改颜色:我想把背景调成  黑色
    label.textColor = [UIColor whiteColor];
    
    /*
     rating
     average
     _model.rating[@"average"]====>是一个NSString类型的
     doubleValue  把字符串转化成  数值
     */
    start.rating = [_model.rating[@"average"] doubleValue];
 
}








@end
