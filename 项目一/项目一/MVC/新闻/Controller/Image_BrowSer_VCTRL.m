//
//  Image_BrowSer_VCTRL.m
//  项目一
//
//  Created by Crystal on 16/7/20.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Image_BrowSer_VCTRL.h"
#import "Image_Browser_CELL.h"


static  NSString *Image_Browser_CELL_ID = @"Image_Browser_CELL_ID";
@interface Image_BrowSer_VCTRL ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>{
    
    BOOL isHidden;
}

@end

@implementation Image_BrowSer_VCTRL

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //创建一个UICOllectionView
    [self _creatCollectionview];
    
    
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(obseraction) name:@"Hidden_NAV_TAB" object:nil];
    
    
}

- (void)obseraction{
    
    
    //拿到导航栏和标签栏
//    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.navigationBar.hidden = !self.navigationController.navigationBar.hidden;
    self.tabBarController.tabBar.hidden  =! self.tabBarController.tabBar.hidden;
    
}

//创建一个UIcollectionview
- (void)_creatCollectionview{
    
    //UICollectionViewLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    
    /*布局的对象
     (1)cell的尺寸
     (2)行之间的(最小)见间距
     (3)列之间的(最小)间距
     (4)滑动的方向
     */
    //尺寸大小
    layout.itemSize = CGSizeMake(self.view.width, self.view.height);
    //行之间的最小间距
    layout.minimumLineSpacing = 0;
    //列之间的最小间距
    layout.minimumInteritemSpacing = 0;
    //滑动方向
    layout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
#warning  行之间或者列之间的自定义注释  line  :  行之间的间距
    /**
     如果为UICollectionViewScrollDirectionVertical
     line  :  行之间的间距
     .minimumInteritemSpacing :列之间的间距
     
     如果为UICollectionViewScrollDirectionHorizontal状态
     line:列之间的间距
     minimumInteritemSpacing :行与行之间的间距
     */
    
    //self.view.bounds 和屏幕一样大的collectionview
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
//    collectionview.backgroundColor = [UIColor redColor];
    //创建单元格的时候要签订数据源协议(返回单元格个数  返回一个cell)
    collectionview.dataSource = self;
    collectionview.delegate = self;
    //collectionView的一个分页属性  如果社会为YES的话  就会分页 以collecview的宽度为一页
    collectionview.pagingEnabled = YES;
    //[Image_Browser_CELL class]返回一个类
    [collectionview registerClass:[Image_Browser_CELL class] forCellWithReuseIdentifier:Image_Browser_CELL_ID];
    [self.view addSubview:collectionview];
    
    
    //<#(UICollectionViewScrollPosition)#>滑动的位置参数
    //collectionView  去调用  需要一个indepath参数  里面item
    [collectionview scrollToItemAtIndexPath:_indepath1 atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
    //取消自适应 (这句话也适用于  滑动视图和导航栏   automaticallyAdjustsScrollViewInsets取消自适应效果) automatic自动
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    

}

#pragma mark - 数据源协议
//返回单元格的个数的方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _array1.count;
}
//给你返回一个单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //自定义一个UIcollectionviewcell出来
   Image_Browser_CELL *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Image_Browser_CELL_ID forIndexPath:indexPath];
    
    /*
     {
     "id": 2238621,
     "image": "http://img31.mtime.cn/pi/2013/02/04/093444.29353753_1280X720.jpg",
     "type": 6
     }
     */
    //_array1[indexPath.item]  小字典
    cell.imageUrl = _array1[indexPath.item][@"image"];
    return cell;
    
}

//- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//   UIScrollView *scrollView =  [collectionView viewWithTag:2300];
//    scrollView.zoomScale = 1;
//}
//单元格结束显示的时候会调用这个方法
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    //当一个单元格完全结束显示的时候
    //想办法拿到ScrollView
    UIScrollView *scroView =  [cell viewWithTag:2300];
    scroView.zoomScale = 1;//回复原来的样子      给一个2  显示为原来的两倍
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
