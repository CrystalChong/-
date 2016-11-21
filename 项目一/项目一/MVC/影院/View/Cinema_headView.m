//
//  Cinema_headView.m
//  项目一
//
//  Created by Crystal on 16/7/18.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Cinema_headView.h"

@implementation Cinema_headView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self != nil) {
        
        _btn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_btn setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage@2x.png"] forState:UIControlStateNormal];
        

//        NSLog(@"%@",self.contentView);contentView  frame为00  所以不能响应时间
        [self addSubview:_btn];
    }
    return self;
    
}

//对屏幕进行布局的时候会调用这个方法
-(void)layoutSubviews{
//self.frame
    _btn.frame = self.bounds;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
