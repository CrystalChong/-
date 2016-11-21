//
//  Index_ColelctioNView.m
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Index_ColelctioNView.h"
#import "Index_CELL.h"

static NSString *Index_CELL_ID = @"Index_CELL_ID";
@implementation Index_ColelctioNView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        //注册
        [self registerClass:[Index_CELL class] forCellWithReuseIdentifier:Index_CELL_ID];
        
    }
    return self;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //重用池
    Index_CELL *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Index_CELL_ID forIndexPath:indexPath];

    //传数据
    cell.model = self.data[indexPath.item];

    return cell;
}

//单元格被选择的时候调用这个方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

//    if (indexPath.item != self.currentIndex) {
//        <#statements#>
//    }
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    //通过  点语法  
    self.currentIndex = indexPath.item;
    
}



@end
