//
//  Big_CELL.m
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Big_CELL.h"
#import "DetaiLVeiw.h"

@implementation Big_CELL
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
      //创建子视图(imageView  detaileView(肯定要去自定义的UIview))
        [self _creatSUbviews];
    }
    return self;
}
//创建子视图(imageView  detaileView(肯定要去自定义的UIview))
- (void)_creatSUbviews{
    
    CGFloat width = self.width *.95;
    //显示图片(刚开始的时候就显示出来)
    UIImageView *imageview  = [[UIImageView alloc]initWithFrame:CGRectMake((self.width - width)/2, 0, width, self.height)];
    imageview.tag = 1600;
    [self.contentView addSubview:imageview];
    
    //先暂时用系统的
    DetaiLVeiw *detaileView = [[DetaiLVeiw alloc]initWithFrame:imageview.frame];
    detaileView.tag = 1601;
    detaileView.hidden = YES;
    [self.contentView addSubview:detaileView];
 
}
//这时候值才穿件来
-(void)setModel:(CInema_CELL_MODEL *)model{
    _model = model;
    
    UIImageView *imageview = [self.contentView viewWithTag:1600];
    DetaiLVeiw *detaileView  = [self.contentView viewWithTag:1601];
    detaileView.backgroundColor = [UIColor clearColor];
    //rangimageView  加载图片
    detaileView.model = _model;//传值;
    [imageview sd_setImageWithURL:[NSURL URLWithString:_model.images[@"large"]]];
}

//让单元格重新恢复到原来的状态
- (void)recover{

    UIImageView *imageview = [self.contentView viewWithTag:1600];
    DetaiLVeiw *detaileView  = [self.contentView viewWithTag:1601];
    
    imageview.hidden = NO;
    detaileView.hidden = YES;
    
}

-(void)flipView{
    UIImageView *imageview = [self.contentView viewWithTag:1600];
    UIView *detaileView  = [self.contentView viewWithTag:1601];
    
    //标示着翻转的方向(从左或者从右)  以imageview的hideen属性为标准
    UIViewAnimationOptions option =imageview.hidden?
UIViewAnimationOptionTransitionFlipFromLeft:
    UIViewAnimationOptionTransitionFlipFromRight;
    
    
    imageview.hidden = ! imageview.hidden;
    detaileView.hidden = ! detaileView.hidden;
    [UIView transitionWithView:self duration:.3 options:option animations:nil completion:nil];
    
}

@end
