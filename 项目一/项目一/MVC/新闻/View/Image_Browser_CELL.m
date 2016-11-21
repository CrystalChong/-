//
//  Image_Browser_CELL.m
//  项目一
//
//  Created by Crystal on 16/7/20.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Image_Browser_CELL.h"




@implementation Image_Browser_CELL

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        //创建一些子视图
        [self _creatSubViews];
        
        /*
         {
         "id": 2238621,
         "image": "http://img31.mtime.cn/pi/2013/02/04/093444.29353753_1280X720.jpg",
         "type": 6
         }
         */
        
    }
    return self;
}

- (void)_creatSubViews{
    
    //创建scrollView  scroView盛放IMageView
    UIScrollView *scroView = [[UIScrollView alloc]initWithFrame:self.bounds];
    scroView.tag = 2300;
//    scroView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:scroView];
    
    //self.bounds ==  cgrectMake(0,0,self.width,self,height);
    UIImageView *iamgeView = [[UIImageView alloc]initWithFrame:self.bounds];
    iamgeView.tag = 2301;

    [scroView  addSubview:iamgeView];

}
//如果在外边给imageURl赋值  会自动调用这个方法
-(void)setImageUrl:(NSString *)imageUrl{
    //重写了一个set方法
    _imageUrl = imageUrl;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];//为了保险起见  调用功能一下父类的layoutSubviews
    //通过一个tag值拿到scrollView
   UIScrollView *scrollview = [self.contentView viewWithTag:2300];

    UIImageView *imageview = [scrollview viewWithTag:2301];

    //imageview   有一个自适应的属性(大小和原来的一样)原来的图片有多大就让你显示多大不会被拉伸
    //让imaggeView自适应大小
    imageview.contentMode =  UIViewContentModeScaleAspectFit;
    
    NSURL *url = [NSURL URLWithString:_imageUrl];
    //通过一个第三方框架拿到 (通过网络) 图片
    [imageview sd_setImageWithURL:url];
    
    
    //放大的效果
    //放大的最大值 数字赋值
    scrollview.maximumZoomScale = 2;
    //缩小的最小值
    scrollview.minimumZoomScale = .5;
    scrollview.delegate = self;//self  === cell自定义的单元格
//    //放大或者缩小的属性
//    scrollview.zoomScale = .5;
    /*
     *  (1)修改显示的大小
        (2)添加手势
        (3)TOP
     */
    UIButton *btn;//点击事件  ...
    
    //设置标题  图片
    [scrollview addSubview:btn];
    
    //UIGestureRecognizer  事件的父类;;
    //手势   UITapGestureRecognizer 类似于button  Tap点击
    // Target:self     action方法选择
    UITapGestureRecognizer *tapGes1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_gesAction:)];
    //手势咱们必须去设置点击的次数
    //点击的手指的个数
    /*
    numberOfTapsRequired:手指点击的次数
    numberOfTouchesRequired:手指的个数
     */
    //手指点击一次屏幕
    tapGes1.numberOfTapsRequired = 1;
    //手指的个数为1
    tapGes1.numberOfTouchesRequired = 1;
    
    //[scrollview addSubview:<#(nonnull UIView *)#>];
    
    [scrollview addGestureRecognizer:tapGes1];
    
    //手势的类  UITapGestureRecognizer 父类-->  UIGestureRecognizer
    UITapGestureRecognizer *tapGes2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_gesAction:)];
    tapGes2.numberOfTapsRequired = 2;//手指点击两次
    tapGes2.numberOfTouchesRequired = 1;//手指个数为1
    [scrollview addGestureRecognizer:tapGes2];
        //取消两次手势的冲突
    [tapGes1 requireGestureRecognizerToFail:tapGes2];
    
}

- (void)_gesAction:(UITapGestureRecognizer *)ges{
    
  
    if (ges.numberOfTapsRequired == 2) {
        NSLog(@"你点击了两次");
      UIScrollView *scrllview =  [self.contentView viewWithTag:2300];
       //X==1?2:1;先问一下滑动视图的缩放倍数为多少  如果为1  就让他变为2  如果不为1  就变味1;
     scrllview.zoomScale = scrllview.zoomScale ==1?2:1;
        
    }else if(ges.numberOfTapsRequired == 1) {
        NSLog(@"你点击了一次");
        //发送一个通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Hidden_NAV_TAB" object:nil userInfo:nil];
        
        
    }
    
    
}


//这个方法会返回一个视图    return谁  谁就能放大;
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return [scrollView viewWithTag:2301];
  
}



@end
