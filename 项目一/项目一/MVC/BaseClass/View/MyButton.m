//
//  MyButton.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title{
    
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        //在这里面创建子视图;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 25)/2, 5, 25, 25)];
        //显示图片
        imageView.image = [UIImage imageNamed:imageName];
        //自适应填充;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        //显示字体
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), frame.size.width, 19)];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        //给字体
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
        
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
