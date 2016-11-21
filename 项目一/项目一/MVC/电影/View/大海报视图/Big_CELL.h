//
//  Big_CELL.h
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CInema_CELL_MODEL.h"
@interface Big_CELL : UICollectionViewCell
@property (nonatomic, strong)CInema_CELL_MODEL *model;


-(void)flipView;//翻转单元格

- (void)recover;//让单元格复原
@end
