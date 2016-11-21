//
//  Lunch_Page_VCtrl.m
//  项目一
//
//  Created by Crystal on 16/7/26.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Lunch_Page_VCtrl.h"
#import "MainTabbarController.h"

@interface Lunch_Page_VCtrl ()
//盛放imageView
@property (nonatomic, strong)NSMutableArray *muarray;
@property (nonatomic, assign)NSInteger index;
@end

@implementation Lunch_Page_VCtrl

- (void)viewDidLoad {
    [super viewDidLoad];

    _muarray = [NSMutableArray array];
    //创建视图(先别考虑动画)目前只是把所有的图片添加到屏幕上去
    [self _creatSUbViews];
    _index = 0;
    //调用动画
    [self CreatAnimation];
    
}
//(1)设置定时器
//(2)延时调用
- (void)CreatAnimation{
    
    if (_index == 24) {
        //要修改根视图控制器
        //(1)通过self.view   window拿到当前窗口;
        //self.view.window.rootViewController = [[MainTabbarController alloc]init];
        //(2)拿到当前的应用程序
        //[UIApplication sharedApplication];
        UIWindow *window =  [UIApplication sharedApplication].keyWindow;
       MainTabbarController *main = [[MainTabbarController alloc]init];
     
        //想让他缩小
        main.view.transform = CGAffineTransformMakeScale(0, 0);
        //再让他恢复原状
        [UIView animateWithDuration:.5 animations:^{
            //回复原状
            main.view.transform = CGAffineTransformIdentity;
        }];
        
        //重新设置根视图控制器
        window.rootViewController = main;
        
        
        return;
    }
    
    //拿到图片
   UIImageView *iamgeveiw = [_muarray objectAtIndex:_index];
    //3/24.0  数据类型强制转换
    [UIView animateWithDuration:3/24.0 animations:^{
        
        iamgeveiw.alpha = 1;
        
    }];
    _index++;
    
    //调用自己,延时调用,
    [self performSelector:@selector(CreatAnimation) withObject:nil afterDelay:3/24.0];
    
}

/*
 
 先把图片加载
 装在一个数组里面
 让所有图片装在数组里面之前  透明度设置  0
 一个一个拿出来  改变透明度  (动画)
 */
- (void)_creatSUbViews{
    
    //先定义一个图片的宽度和高度
    CGFloat width = KscreenWidth / 4;
    CGFloat height = KscreenHeight / 6;
    
    for(int i= 1;i<25;i++){
        //把变量变为图片名字
        NSString *imagestr = [NSString stringWithFormat:@"%d.png",i];
        //图片
        UIImage *image = [UIImage imageNamed:imagestr];
        //先零食给一个坐标  但是代销必须先要确定
        UIImageView *iamgeview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        
        iamgeview.image = image;
        //确定 iamgeViuew的坐标
        
        CGFloat x = 0;
        CGFloat y = 0;
        
       //前五个
        if (i<5) {
            x = (i-1)*width;
            y = 0;
        }else if (i>=5 && i<=9){//&&与
        
            x = KscreenWidth - width;
            y =(i- 4)*height;
        
        }else if (i >=10&&i<=12){
        
            x =KscreenWidth -( (i-8)*width);
            y = KscreenHeight - height;
        }else if (i<=16){
        
            x =0;
            y = (17-i)*height;
        }else if (i<=18){
            x = (i -16)*width;
            y = height;
        }else if (i<=21){
        
            x = 2*width;
            y = (i-17)*height;
        }else if (i<=24){
            x = width;
            y = (26-i)*height;
        }
        
        
        
        
        
        
        //确定视图XY坐标(原点)
        iamgeview.origin = CGPointMake(x, y);
        iamgeview.alpha = 0;//全部都透明;
        [self.view addSubview:iamgeview];
        
       //全局的数组(把所有的imaView放到数组里面)
        [_muarray addObject:iamgeview];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
