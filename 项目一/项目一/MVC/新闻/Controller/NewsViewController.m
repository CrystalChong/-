//
//  NewsViewController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "NewsViewController.h"
#import "News_model.h"
#import "News_tableviewCELL.h"
#import "Image_List_VCTRL.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *array;
//设置一张imageView作为下拉放大的图片
@property (nonatomic, strong)UIImageView *imageViewOne;
/*
 
 对象:strong  person   uiimage  uiiamgeView NSnumber(把基本数据类型给封装一下)对象
 基本数据类型: assign  int   nsinteger float  double  bool
 nsstring  :copy  (mutableCopy深拷贝  copy 浅拷贝)
 
 */
@property (nonatomic, strong)UITableView *tableview;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //JSON  
    [self loaData];
    //创建视图
    [self _creaTablView];
    
}
- (void)_creaTablView{
    
    _tableview = [[UITableView alloc]initWithFrame:self.view.bounds  style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.rowHeight = 90;
    
    
    
    //直接作为透视图
   
    //XY 坐标肯定没用
    UIView *HeaVeiw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, KHeadViewHeight)];
    HeaVeiw.backgroundColor = [UIColor orangeColor];
    
    //XY坐标是有用的
    _imageViewOne = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, KHeadViewHeight)];
     News_model *model = _array[0];
    NSString *imageUrl = model.image;
    //把字符创转化成url
    NSURL *url = [NSURL URLWithString:imageUrl];
    //通过第三方框架  加载图片
    [_imageViewOne sd_setImageWithURL:url];
    
    
    //设置头视图
    _tableview.tableHeaderView =HeaVeiw ;
    //
    [HeaVeiw addSubview:_imageViewOne];
    
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, KHeadViewHeight - 40, KscreenWidth, 40)];
    titleLabel.text = model.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //有几分白  有几分透明;
    titleLabel.backgroundColor = [UIColor colorWithWhite:.3 alpha:.7];
    [HeaVeiw addSubview:titleLabel];

    [self.view addSubview:_tableview];
    
}
#pragma mark - 表示图数据源方法
//返回行数
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count - 1;
}

//返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"tableview_CELL_ID";
    
    News_tableviewCELL *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[News_tableviewCELL alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.model = _array[indexPath.row + 1];
    return cell;
}


//加载数据
-(void)loaData{
    //初始化全局的数组
    _array = [NSMutableArray array];
    NSArray *arrNEws = [JsonDataSeverice ObjectOfJSONWithname:@"news_list.json"];
    //遍历数组  给model 赋值;
    for (NSDictionary *dic in arrNEws) {
        
        News_model *model = [[News_model alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [_array addObject:model];
    }
}
//表是集成与  滑动视图

//一旦滑动就会调用这个方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
   //
//    scroelView.contentOffset = CGPointMake(两张图片的宽度, 0);
    
  CGFloat f =  _tableview.contentOffset.y;
    NSLog(@"%f",f);
    if (f < -64) {
//        ABS(-10);
        //获取了你滑动了多少个点 -64-f
        CGFloat newheight = -64-f + KHeadViewHeight;
        //定义一个局部变量 (检测 高度变化的比例)
        //通过这个比例咱们知道  高度上  高变了多少倍
        CGFloat sclae = newheight / KHeadViewHeight;
        //获取到同比例 情况下的宽度变化
        CGFloat newWidth = KscreenWidth * sclae;
        
        _imageViewOne.frame  = CGRectMake((KscreenWidth - newWidth)/2, (f+64), newWidth, newheight);
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//当我点击单元格的时候会自动调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //就是咱们想要进入的下一个界面
    Image_List_VCTRL *vC = [[Image_List_VCTRL alloc]init];
    
    //PUSH  先要导航控制器self.navigationController  需要传入一个视图开工资器
    [self.navigationController  pushViewController:vC animated:YES];
    
}




@end
