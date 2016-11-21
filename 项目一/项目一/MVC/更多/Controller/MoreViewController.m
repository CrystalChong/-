//
//  MoreViewController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    NSArray *_titles;
    NSArray *_images;
}

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self loadData];
    //创建视图
    [self creatSUbViews];
    //打印了沙盒的路径
    NSLog(@"%@",NSHomeDirectory());
    
}
- (void)loadData{
    //给title赋值
    _titles = @[@"",@"清除缓存",@"给个评价",@"商务合作",@"欢迎页",@"关于"];
    //给image数组赋值
    //图片
    _images = @[@"  ",
                @"moreClear.png",
                
                @"moreScore.png",
                
                @"moreBusiness.png",
                
                @"moreVersion.png",
                
                @"moreWelcome.png",
                
                @"moreAbout.png"];
    
}

- (void)creatSUbViews{
    
    
    UITableView *tablview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tablview.dataSource = self;
    tablview.delegate  = self;
    //设置表视图是否能滑动;
    tablview.scrollEnabled =  NO;
    tablview.backgroundColor = [UIColor clearColor];
    tablview.tag  =5200;
    tablview.contentOffset = CGPointMake(0, 64);
    [self.view addSubview:tablview];
    
    
}

#pragma mark - 表示图数据源方法
//返回行数
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}

//返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *More_CELL_ID = @"More_CELL_ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:More_CELL_ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:More_CELL_ID];
        
        //(cell.height - 30)/2 上下居中
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(KscreenWidth - 100, (cell.height - 30)/2, 100, 30)];
        label.tag = 5100;
        label.textColor = [UIColor whiteColor];
        //让字体靠右
        label.textAlignment  =NSTextAlignmentRight;
        [cell.contentView addSubview:label];
        
    }
    cell.backgroundColor = [UIColor clearColor];
    UILabel *label =  [cell.contentView viewWithTag:5100];
    if (indexPath.row == 1) {
        label.hidden = NO;
         label.text = [self getCache];
    }else{
        label.hidden = YES;
    }
    
    /*
     那缓存
     */
    cell.imageView.image = [UIImage imageNamed:_images[indexPath.row]];
    cell.textLabel.text = _titles[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    /*系统
     图片添加
     文字的添加
     */
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1) {
        
        //弹出警告视图  UIAlertControllerStyleAlert从中间弹出
        UIAlertController *controler = [UIAlertController alertControllerWithTitle:@"警告" message:@"是否清楚缓存" preferredStyle:UIAlertControllerStyleAlert];
        //增加按钮(类方法去创建一个按钮)
        UIAlertAction  *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //清除缓存
            
            [self _cleanCache];
            
        }];
        //handle  点击按钮的所作的一些操作
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //取消的操作
        }];
        //给controler增加按钮
        [controler addAction:action1];
        [controler addAction:action2];
        
        //模态弹出一个视图控制器
        [self presentViewController:controler animated:YES completion:nil];
        
    }
}

//自己写的得到缓存的方法(在返回单元格的方法里面不能写太多的代码-->抽象成方法)
- (NSString *)getCache{
    //存储总的图片的大小
   long long sum = 0;//
    
    
//    NSHomeDirectory();//阿道沙盒的路径;
    //获取一个目标文件夹的路径
    NSString *path = [NSString stringWithFormat:@"%@%@",NSHomeDirectory(),@"/Library/Caches/default/com.hackemist.SDWebImageCache.default/"];
    
    //文件管理者的类  -->创建一个(文件)管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    //sub 子的概念  subpaths子路径(集合)  刚才获取的目标文件的路径;
   NSArray *subPath = [manger subpathsAtPath:path];
//    NSLog(@"%@",subPath);
    
    for (NSString *subP1 in subPath) {
        
        //第一次运行for拿到的是第一张图片的名字path没有变 重新创建爱你了一个新的字符串并且和subPoen1拼接到一快
      NSString *imagePath =  [path stringByAppendingString:subP1];
        NSDictionary *dic = [manger attributesOfItemAtPath:imagePath error:nil];
//        NSLog(@"%@",dic);
        //拿到图片的大小;
        [dic fileSize];
        //加载所有的缓存;
        sum+=[dic fileSize];//
    }
    //sum
    //在Android  或者  windows电脑里面   1KB = 1024B
    //在MAC  或者IOS系统里面  1KB = 1000B;
    
    NSString *str11 = [NSString stringWithFormat:@"%.2f M",sum/(1000.0*1000.0)];
    
    
    return str11;
}

- (void)_cleanCache{

    //SDImageCache (创建了一个清楚缓存的对象)
    [[SDImageCache sharedImageCache] clearDisk];
    UITableView *tabelvi = [self.view viewWithTag:5200];
    [tabelvi reloadData];
    
}


@end
