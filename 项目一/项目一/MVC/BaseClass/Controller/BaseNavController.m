//
//  BaseNavController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //设置背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64@2x.png"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏上文字的颜色
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationBar setTitleTextAttributes:dic];
    //设置按钮的标题的时候  (文字颜色就会呈现出什么颜色)
   // [self.navigationBar setTintColor:[UIColor whiteColor]];
    /*
     如果想让tablbiew(View显示完全   )
     (1)让tableview或者(view)作为UInavgationCOntroler 和uitabbarCOntroller的根视图的第一个子视图;
     (2)让导航栏和标签栏变为半透明  也就是说  半透明的属性  给设置为YES;
     */
    #warning 修改了导航栏的透明度;
    //让导航栏变为半透明
    self.navigationBar.translucent = YES;
    
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
