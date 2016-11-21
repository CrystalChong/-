//
//  Guid_page_Vctrl.m
//  项目一
//
//  Created by Crystal on 16/7/26.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Guid_page_Vctrl.h"
#import "MainTabbarController.h"

@interface Guid_page_Vctrl ()<UIScrollViewDelegate>

@end

@implementation Guid_page_Vctrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    
    //创建滑动视图
    [self _creatSubViews];
}
- (void)_creatSubViews{

    //首先创建一个SCroLView;(类  创建 对象)
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    //自动翻页
    scrollView.pagingEnabled = YES;
    //隐藏水平方向的滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    //scroView必须设置一个ContentSize
    scrollView.contentSize  = CGSizeMake(KscreenWidth * 5, KscreenHeight);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    for (int i = 1; i<=5; i++) {
        
        
        //盛放图片
        UIImageView *iamgeView = [[UIImageView alloc]initWithFrame:CGRectMake((i-1)*KscreenWidth, 0, KscreenWidth, KscreenHeight)];
        //
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",i]];
        
        //给imageView设置图片
        iamgeView.image = image1;
        [scrollView addSubview:iamgeView];
        
        
        
        UIImageView *imaegView = [[UIImageView alloc]initWithFrame:CGRectMake((KscreenWidth -150)/2 + (i-1)*KscreenWidth, KscreenHeight /8 *7, 150, 30)];
        //给一个eImageView设置一张图片
        imaegView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideProgress%d",i]];
        [scrollView addSubview:imaegView];

        
    }

}
//滑动的时候实时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //五张图片四个宽度
    if(scrollView.contentOffset.x>KscreenWidth *4){
        //创建一个main对象  作为窗口的根视图控制器
        MainTabbarController *main  = [[MainTabbarController alloc]init];
        //拿到window
//        self.view.window.rootViewController = main;
        
        main.view.transform = CGAffineTransformMakeTranslation(KscreenWidth, 0);
        
        [UIView animateWithDuration:.3 animations:^{
            main.view.transform = CGAffineTransformIdentity;//回复原状
        }];
        
        [UIApplication sharedApplication].keyWindow.rootViewController = main;
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
