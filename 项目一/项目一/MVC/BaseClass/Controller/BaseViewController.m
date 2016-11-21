//
//  BaseViewController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIcolor  colowithPattenimage  把图片转化成颜色
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
//    StartView *views = [[StartView alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
//    views.rating  = 7;
//    [self.view addSubview:views];
    
    
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
