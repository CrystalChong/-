//
//  Image_List_VCTRL.m
//  项目一
//
//  Created by Crystal on 16/7/19.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Image_List_VCTRL.h"
#import "Image_BrowSer_VCTRL.h"

//静态变量,标识单元格
static NSString *Image_LIst_ID = @"Image_LIst_ID";

@interface Image_List_VCTRL ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)NSArray *array;
@end

@implementation Image_List_VCTRL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据;
    [self _loadData];
    
    //创建UICOllectioNView
    
    [self _creatSubViews];
   
    
}
- (void)_creatSubViews{
    
    //创建一个布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    /*
     (1)尺寸
     (2)行间距
     (3)列间距
     (4)滑动方向
     */
    //设置尺寸  CGSizeMake创建一个尺寸
    layout.itemSize = CGSizeMake(100, 100);
    //设置 zuixiao 行间距
    layout.minimumLineSpacing = 10;
    //zuixiao  的列间距
    layout.minimumInteritemSpacing = 20;
    //滑动方向
    /*
     UICollectionViewScrollDirectionVertical,垂直方向
     UICollectionViewScrollDirectionHorizontal.水平方向
     */
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //创建collectionview  给一个frame(和当前屏幕一样大)  给一个布局对象
    UICollectionView *colectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    colectionView.dataSource  = self;
    colectionView.delegate = self;
    //注册  [UICollectionViewCell class]返回一个类
    [colectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:Image_LIst_ID];
    [self.view addSubview:colectionView];
    
}

//先写再去调用
- (void)_loadData{
    /*
     {
     "id": 2238621,
     "image": "http://img31.mtime.cn/pi/2013/02/04/093444.29353753_1280X720.jpg",
     "type": 6
     }
     */
    //解析数据ObjectOfJSONWithname是咱们自己写的方法 需要传入一个文件名字
    _array = [JsonDataSeverice ObjectOfJSONWithname:@"image_list.json"];
    
    
}
#pragma mark - 数据源协议
//返回单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //返回单元格的个数  arr有多少个字典  就会返回多少个单元格
    return _array.count;
}
//返回一个单元格(不适用MVC而且不自定义cell的方式--->代码很多)
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //去重用池里面去取  用collectionview去取(经过这个而方法之后  cell一定有值)
    //用了这个方法就必须去注册一个单元格
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Image_LIst_ID forIndexPath:indexPath];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:cell.bounds];
    
    //创建一个URL出来(在全局数组里面存放这的)  indexPath.item标志着第几个单元格
    NSString *imageURl = _array[indexPath.item][@"image"];
    //转化成url  根据一个字符串转化成url
    NSURL *url = [NSURL URLWithString:imageURl];
    [imageview sd_setImageWithURL:url];
    
    
    
    //修改圆角  数字(半径)
    imageview.layer.cornerRadius = 15;
    imageview.backgroundColor = [UIColor redColor];
    //给imageview加了一个边框
    imageview.layer.borderWidth = 5;
    //裁剪边框
    imageview.clipsToBounds = YES;
    
    //cell自带的属性  背景视图
    cell.backgroundView = imageview;

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"调用了%ld",indexPath.item);
    //创建一个视图控制器
    Image_BrowSer_VCTRL *image  = [[Image_BrowSer_VCTRL  alloc]init];
    image.array1 = _array;
    image.indepath1 = indexPath;
    [self.navigationController pushViewController:image animated:YES];
}
//修改边界距离
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //返回一个UIEdgeInsets类  离上左下右(0, 10, 0, 10)的距离
  return   UIEdgeInsetsMake(0, 10, 0, 10);
}

@end
