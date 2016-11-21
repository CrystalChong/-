//
//  MainTabbarController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "MainTabbarController.h"

//导航控制器
#import "BaseNavController.h"

//========导入子视图控制器=====
#import "CinmerViewController.h"
#import "MovieViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "MoreViewController.h"
//导入自定义的button
#import "MyButton.h"


@interface MainTabbarController ()
@property (nonatomic, strong)UIImageView *selectorImage;

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //给tabbar设置子视图控制器
    [self _creatSubViews];
    //
    [self _removeSubViews];
}

- (void)_removeSubViews{
    
    //循环遍历 去除tabbar上的自带item;
    for (UIView *view1 in self.tabBar.subviews) {
        [view1 removeFromSuperview];//从俯视图中移除;
    }
    //放你设置了北京图片或者图片的时候  导航栏或者标签栏半透明状态就更改为NO;
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
#warning 这个地方修改标签栏的透明度
    //让标签栏满足条件(半透明的条件)
    self.tabBar.translucent = YES;
    //title  导航栏上显示的文字
    NSArray *titles = @[@"电影",@"新闻",@"TOP",@"影院",@"更多"];
    //标签栏现实的图片名字
    NSArray *images = @[@"movie_home.png",
                        @"msg_new.png",
                        @"start_top250.png",
                        @"icon_cinema.png",
                        @"more_select_setting.png"];

    _selectorImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 49, 49)];
    _selectorImage.image = [UIImage imageNamed:@"selectTabbar_bg_all1@2x"];
   
    _selectorImage.layer.cornerRadius = 15;//以10的半径  修剪四个角
    [self.tabBar addSubview:_selectorImage];
    //PCH文件(我只定义一次宏,,在其他的类里面都能用到)  在刚才新建的PCH文件里面:宏定义
    //添加button;
    for(int i= 0;i<5;i++){
        
        MyButton *btn = [[MyButton alloc]initWithFrame:CGRectMake(i * (KscreenWidth /5), 0, KscreenWidth / 5, 49) withImageName:images[i] withTitle:titles[i]];
        /*
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i * (KscreenWidth /5), 0, KscreenWidth / 5, 49)];
        
        //设置被禁图片
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 30, 10)];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        //把label的位置给他一个frame
        btn.titleLabel.textAlignment =  NSTextAlignmentLeft;
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(30, -50, 0, 0)];
        
        
        [self.tabBar addSubview:btn];
         */
        
        [btn addTarget:self action:@selector(_btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
        [self.tabBar addSubview:btn];
        
    }
    //先让_selectorImage在程序运行的时候 就和第一个btn保持一个位置
    UIButton *btn = [self.tabBar viewWithTag:100];
    _selectorImage.center = btn.center;
    
    
    
}

- (void)_btnAction:(UIButton *)btn{
    //切换标签控制器的子控制器
    self.selectedIndex = btn.tag -100;
    
    //block实现动画
    //第一个参数是动画执行的时间
    //第二个参数  是动画执行的内容;
    [UIView animateWithDuration:.3 animations:^{
        
        _selectorImage.center = btn.center;
    }];
    
    
    
}
//标签栏
- (void)_creatSubViews{
    
    //把视图控制器实例化成一个对象
    MovieViewController *movie = [[MovieViewController alloc]init];
    NewsViewController *news = [[NewsViewController alloc]init];
    TopViewController *top = [[TopViewController alloc]init];
    CinmerViewController *cine = [[CinmerViewController alloc]init];
    MoreViewController *more = [[MoreViewController alloc]init];
    //控的可变的数组
    NSMutableArray *mutablArr = [NSMutableArray array];
    //把试图控制器对象存储起来
    NSArray *array = @[movie,news,top,cine,more];
    for (UIViewController *Vtrc in array) {
        
        BaseNavController *nav = [[BaseNavController alloc]initWithRootViewController:Vtrc];

        [mutablArr addObject:nav];
        
    }
    
    self.viewControllers = mutablArr;
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
