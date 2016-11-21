//
//  Big_collectioNView.m
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Big_collectioNView.h"
#import "Big_CELL.h"
/*
 (1)大小  可以从外边传一个itemWidth;
 (2)单元格的协议方法返回单元格的方法不一样;(自定义复写返回单元格的方法)
 (3)单元格的点击效果不同
 */
static NSString *Big_CollectioNVeiw_CELL_ID = @"Big_CollectioNVeiw_CELL_ID";
@implementation Big_collectioNView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        //先注册一下
//        [_colectionview   regiclass;];
        [self registerClass:[Big_CELL class] forCellWithReuseIdentifier:Big_CollectioNVeiw_CELL_ID];
//        self.itemWIdth
    }
    
    return self;
}



//返复写父类中的方法(父类中的同一个方法就不实现了);
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   Big_CELL *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Big_CollectioNVeiw_CELL_ID forIndexPath:indexPath];
    
    cell.model = self.data[indexPath.item];
//    return nil;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    //[cell flipView];
    //根据一个eindexPath拿到相对应位置的cell;

    //判断一下  是否属于当前显示的单元格
    if (indexPath.item != self.currentIndex) {
        
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //修改当前值(如果不修改  当前页永远不等于  indepath.item)
        self.currentIndex = indexPath.item;
        
    }else if (indexPath.item == self.currentIndex){//为当前页的话  实现翻页功能;
        
            Big_CELL *cell = (Big_CELL *)[collectionView cellForItemAtIndexPath:indexPath];
         [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            [cell flipView];
    
    }

}

//当单元格不显示的时候会调用这个方法
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //先拿到  不想显示的cell(强制转化成 咱们自己的类型)
    Big_CELL *cell1 = (Big_CELL *)cell;
    [cell1 recover];//让cell自己调用自己的方法在自己的内部调用恢复原状 的方法;
}









@end
