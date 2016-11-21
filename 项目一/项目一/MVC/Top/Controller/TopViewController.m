//
//  TopViewController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "TopViewController.h"
#import "TOP_MODEL.h"
#import "Top_250_CELL.h"
#import "Top_Detaile_VCTRL1.h"

//生命一个全局的字符串  标识单元格
static NSString *top_CELL_ID = @"top_CELL_ID";
@interface TopViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, strong)NSMutableArray *array;
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self loadData];
    //创建视图
    [self _creatSubViews];
    
    
}

- (void)_creatSubViews{

    //UICollectionViewLayout只作为一个父类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];//alloc  init
    
    //布局:
    /*
     (1)自己的size
     (2)行最小的间距
     (3)列之间最小的间距
     (4)滑动方向
    */
    //大小  CGszie
    layout.itemSize = CGSizeMake(100, 140);
    //(当 为垂直滑动的时候   minimumLineSpacing代表行之间最小的间距)行之间最小的间距 Line
    layout.minimumLineSpacing = 10;
    //当我为垂直方向的华东的时候 minimumInteritemSpacing  列与列之间的最小间距
    layout.minimumInteritemSpacing = 10;
    
    //滑动方向(垂直方向)
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //创建collectionView
   UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    collectionview.dataSource = self;
    collectionview.delegate = self;
    [collectionview registerClass:[Top_250_CELL class] forCellWithReuseIdentifier:top_CELL_ID];
    [self.view addSubview:collectionview];
}

/*
 
{ "subjects": [
 {
 "rating": {
 "max": 10,
 "average": 9.6,
 "stars": "50",
 "min": 0
 },
 "title": "肖申克的救赎",
 "images": {
 "small": "https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480747492.jpg",
 "large": "https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p480747492.jpg",
 "medium": "https://img3.doubanio.com/view/movie_poster_cover/spst/public/p480747492.jpg"
 },
 */
- (void)loadData{
    _array = [NSMutableArray array];//对数组初始化(盛放moDEl)
  NSDictionary *dic =  [JsonDataSeverice ObjectOfJSONWithname:@"top250.json"];
    NSArray *array = dic[@"subjects"];
    NSLog(@"asdfasdfasdfads");
    for (NSDictionary *dic1 in array) {
        //创建一个model
        TOP_MODEL *model = [[TOP_MODEL alloc]init];
        //使用kvc赋值
        [model setValuesForKeysWithDictionary:dic1];
        [_array addObject:model];
    }
    
}

//单元格的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _array.count;
}
//返回单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //(1)去重用池里面寻找  找到就返回一个cell  找不到  就去创建一个  根据注册的单元格创建
    Top_250_CELL *cell = [collectionView dequeueReusableCellWithReuseIdentifier:top_CELL_ID forIndexPath:indexPath];
    cell.model = _array[indexPath.item];

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//修改离上下左右的距离
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //创建一个  Edg  离上下左右的距离
    return UIEdgeInsetsMake(0, 5, 0, 5);

}
//不选中的时候调用这个方法
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

}

//选中的时候调用这个方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",indexPath.item);
    
    Top_Detaile_VCTRL1 *topDetail = [[Top_Detaile_VCTRL1 alloc]init];
    //PUSH一定要拿到导航控制器
    [self.navigationController pushViewController:topDetail animated:YES];
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
