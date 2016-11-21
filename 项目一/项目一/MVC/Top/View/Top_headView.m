//
//  Top_headView.m
//  项目一
//
//  Created by Crystal on 16/7/22.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Top_headView.h"

@implementation Top_headView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self != nil) {

        //创建子视图
        [self _creatSUbViews];

    }
    
    return self;
    
}


- (void)_creatSUbViews{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100, 150)];
    imageView.tag = 3201;
    //一定要清楚自己定义的是什么
    [self addSubview:imageView];
    
    UILabel *tilteLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame), 5, self.width - 105, 35)];
    //设置一下字体的大小
    tilteLabel.font = [UIFont systemFontOfSize:20];
    tilteLabel.tag = 3202;
    [self addSubview:tilteLabel];
    
    UILabel *actorLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame), CGRectGetMaxY(tilteLabel.frame), CGRectGetWidth(tilteLabel.frame), 60)];
    actorLabel.numberOfLines = 0;
    actorLabel.tag = 3203;
    actorLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:actorLabel];
    
    
    //在imageview的友边  在actorlabel的下面  宽度  self - imagView的宽度
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame),  CGRectGetMaxY(actorLabel.frame), CGRectGetWidth(tilteLabel.frame), CGRectGetMaxY(imageView.frame ) - CGRectGetMaxY(actorLabel.frame))];
    
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.tag = 3204;
    [self addSubview:contentLabel];
    
    //设置scrolView在图片的下面 高度为  self的高度减去  imageview的高度
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 10,self.width, self.height - CGRectGetMaxY(imageView.frame))];
    scrollview.tag = 3205;
    [self addSubview:scrollview];
    
    
    UIButton *btn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    //让btn的中心和imageView的中心重叠;
     btn.center = imageView.center;
    [btn setBackgroundImage:[UIImage imageNamed:@"playButton@2x.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(_btnAction1) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];

}

//播放视频的按钮;
- (void)_btnAction1{
    //因为是在自定义的View里面   视频播放不能模态弹出
//    [self pres];
    //能通过发送通知的机制  调出模态弹出(控制器--Top_DEtaile_VCTRL)
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PLAY_VIDEO" object:nil];
    
}

-(void)setModel:(Top_headViwe_Model *)model{
    _model = model;
    
    UIImageView *imageView = [self  viewWithTag:3201];
    UILabel *tilteLabel = [self  viewWithTag:3202];
    tilteLabel.textColor = [UIColor whiteColor];
    UILabel *actorLabel = [self  viewWithTag:3203];
    actorLabel.textColor = [UIColor  whiteColor];
    UILabel *contentLabel = [self  viewWithTag:3204];
    contentLabel.textColor = [UIColor whiteColor];
    
    //给imageView赋值
    [imageView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    tilteLabel.text = [NSString stringWithFormat:@"标题:%@",_model.titleCn] ;
    
    NSString *str = [_model.actors componentsJoinedByString:@","];
    NSString *str1 = [NSString stringWithFormat:@"演员:%@",str];
//    //遍历演员数组(字符串)
//    for (<#type *object#> in <#collection#>) {
//        <#statements#>
//    }
//
    
    actorLabel.text = str1;
    
    contentLabel.text = [NSString stringWithFormat:@"简介:%@",_model.content];
//    [self setNeedsLayout];
    
    
    UIScrollView *scrollView = [self viewWithTag:3205];
    //设置scrolView的contentsize;
    scrollView.contentSize = CGSizeMake(_model.images.count * 105, scrollView.height);
    
    for (int i = 0;i<_model.images.count ; i++) {
        //陈芳图片
        UIImageView *scrollView_image = [[UIImageView alloc]initWithFrame:CGRectMake(i*105, 0, 100, scrollView.height)];
        //直接从数组里面取字符串
        [scrollView_image sd_setImageWithURL:[NSURL URLWithString:_model.images[i]]];
        
        [scrollView addSubview:scrollView_image];
    }
    
    
    
    
    
    
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
