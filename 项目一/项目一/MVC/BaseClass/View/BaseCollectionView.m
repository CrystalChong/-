//
//  BaseCollectionView.m
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "BaseCollectionView.h"


/*
 
    相同点:(1)单元格的数量和图片-->数据相同;
          (2)CollectioNVeiw的分页效果相同;\
            (3)离左右边距计算方式相同
    不同点:(分别按到子类中趋去实现)
    (1)大小  可以从外边传一个itemWidth;
    (2)单元格的协议方法返回单元格的方法不一样;(自定义复写返回单元格的方法)
    (3)单元格的点击效果不同
 
 */

@implementation BaseCollectionView
//就是因为咱么在外边创建爱你collectioNVeiw的时候  一直在用initWithFrame:Layout
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self  =[super initWithFrame:frame collectionViewLayout:layout];
    if (self != nil) {
        //设置代理
        self.dataSource = self;
        self.delegate  = self;
        
        //隐藏水平方向的滚动条
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
    
}

//返回单元格的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _data.count;
}

//返回单元格(在子类中复写)
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;{

    return nil;

}
//决定  单元格居中显示
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
   CGFloat edg = ( KscreenWidth - self.itemWIdth)/2;

//    NSLog(@"%f,%f",edg,KscreenWidth);
   //让单元格在显示的时候就居中显示
    
    //(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    return UIEdgeInsetsMake(0, edg, 0, edg);
}

/*
#warning 分页的效果方法还没有写  别忘了回来;
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    
//    CGFloat f = targetContentOffset->x;
//    
//    CGFloat itemWidth = self.itemWIdth;
//    NSInteger i =  (f + itemWidth/2)/itemWidth;
//    
//    targetContentOffset->x = i * itemWidth;
    
    //单元格的宽度
    CGFloat itemWidth = self.itemWIdth;
    
    //x方向偏移量
    CGFloat targetx  = targetContentOffset->x;
    
    //计算是第几个单元格
    NSInteger i = (targetx +itemWidth/2)/itemWidth;
    
    //偏移得到指定单元格的中间位置
    targetContentOffset->x = i*itemWidth;
    
    //  scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
}

 */
//返回单元格的尺寸(刚开始的时候在父类中调用的)
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(self.itemWIdth, self.height);
//}
/*
 
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView; 滑动scroLview的时候一直调用
 - (void)scrollViewDidZoom:(UIScrollView *)scrollView;滑动视图缩放的时候回调用功能这个
 - (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;{
    //在一个UYIscorView里面添加了一个名字叫  View的视图  
    return  View;//就能在ScrollView里面对View进行放大缩小了
 
 }
 
 */

/**将要结束拖拽的时候调用这个方法
 *  @param scrollView          UICollectioNView  (UIscroview  : 被拖动的滑动视图)
 *  @param velocity            视图滑动的速度
 *  @param targetContentOffset 目标偏移量
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);{
//    targetContentOffset.x;
   // targetContentOffset->x;//访问结构体指针的时候  用一个(指针运算符)
    
    //能达到单元格的item的宽度
    CGFloat itemWitdh1 = self.itemWIdth;
    
  //  NSLog(@"-----%f",targetContentOffset->x);
    
    //滑动到第几个单元格
    NSInteger index  = (targetContentOffset->x +(itemWitdh1/2)) / itemWitdh1;
    
    //重新计算最终索引
    targetContentOffset->x = index *itemWitdh1;
    
    //滑动到索引值的地方的速度;  UIScrollViewDecelerationRateFast很快  还有一个Nomal
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    NSLog(@"%ld",index);
    //用一个而程序保护
    if(index <0){
        
        index = 0;
    }else if (index>=_data.count){
        
        index = _data.count - 1;
    }
    
    
    
    //只有通过点语法  和  KVC赋值的方式  才能触发  监听;
    self.currentIndex = index;
    
}

//实现单元格的大小  (相当于 collectioNVeiw.itesuize = cgsizemake(100,100))
//collectioNVeiw.itesuize = cgsizemake(100,100);
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.itemWIdth, self.height);
}



@end
