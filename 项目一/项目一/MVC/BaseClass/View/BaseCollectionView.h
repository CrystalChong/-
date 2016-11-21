//
//  BaseCollectionView.h
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)NSArray *data;//数据
@property (nonatomic, assign)CGFloat itemWIdth;
//标示着  我的单元格滑动到第几个;
@property (nonatomic, assign)NSInteger currentIndex;
@end
