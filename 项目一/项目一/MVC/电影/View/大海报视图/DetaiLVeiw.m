//
//  DetaiLVeiw.m
//  项目一
//
//  Created by Crystal on 16/7/25.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "DetaiLVeiw.h"

@implementation DetaiLVeiw

//为什么复写这个方法(因为我在外边创建的时候就调用这个方法)
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //显示图片
        UIImageView *iaegview = [[UIImageView alloc]initWithFrame:CGRectMake((self.width - (self.width *0.6))/2, 0, self.width *.6, self.height * .5)];
        iaegview.tag = 1900;
        [self addSubview:iaegview];
        
        //显示标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(iaegview.frame), self.width, 30)];
        label.tag = 1901;
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        
        //显示 星星视图
        StartView *start = [[StartView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), self.width *.5, 40)];
        start.tag = 1902;
        [self addSubview:start];
        
        //显示评分
        UILabel *labelRating = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(start.frame),150 , 30)];
        labelRating.tag = 1903;
        labelRating.textColor = [UIColor whiteColor];
        [self addSubview:labelRating];
        
    }
    return self;
}

-(void)setModel:(CInema_CELL_MODEL *)model{
    
    _model = model;
    
   //图片
    UIImageView *iaegview = [self viewWithTag:1900];
    
    [iaegview sd_setImageWithURL:[NSURL URLWithString:_model.images[@"medium"]]];
    
    //标题
    UILabel *label= [self viewWithTag:1901];
    label.text = _model.title;
    
    //星星视图
    StartView *start= [self viewWithTag:1902];
    start.rating = [_model.rating[@"average"] doubleValue];
    
    
    //一定记住转化类型
     UILabel *labelRating= [self viewWithTag:1903];
    labelRating.text =[NSString stringWithFormat:@"评分%@",_model.rating[@"average"]] ;
    
}



@end
