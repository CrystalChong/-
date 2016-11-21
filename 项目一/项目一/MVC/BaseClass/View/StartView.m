//
//  StartView.m
//  StartView
//
//  Created by Crystal on 16/7/15.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "StartView.h"
#import "UIViewExt.h"

@implementation StartView

-(void)awakeFromNib{
    //创建子视图(如果使用xib的话会自动调用功能到这个方法里面)我让他创建那些子视图,和init方法功效是一样
    [self _creaSubViews];
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self !=nil) {
        [self _creaSubViews];
    }
    return self;
}

- (void)_creaSubViews{
  
    
    UIImage *yellowImage = [UIImage imageNamed:@"yellow@2x.png"];
    UIImage *grayImage = [UIImage imageNamed:@"gray@2x.png"];
    
    //获得了图片的宽度和高度
    CGFloat widht1 = yellowImage.size.width;

    CGFloat height1 = yellowImage.size.height;
    
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, widht1 *5, height1)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    
    
    _grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, widht1 *5, height1)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    
    [self addSubview:_grayView];
    [self addSubview:_yellowView];
    
    //传入的frame和我本省(黄色视图  或者灰色视图)大小的差别(比例)
      CGFloat scale = self.frame.size.height/height1;
    
    //这句话就是让我的黄色视图和灰色视图大小保持一致
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    //原点的意思origin(原点)
    _grayView.origin = CGPointMake(0, 0);
    _yellowView.origin = CGPointMake(0, 0);

//    _grayView.frame =
    //(1)直接把self 的frame赋值给_grayView;
    
    _yellowWidth = _yellowView.width;
    
}
-(void)setRating:(double)rating{
    _rating = rating;
    //让屏幕重新布局的命令
    [self setNeedsLayout];
}

//布局子视图;在这里面能够重新对屏幕进行布局)
-(void)layoutSubviews{
    
//    self.frame;
    
    _yellowView.width = _yellowWidth * .1* _rating;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
