//
//  Image_Browser_CELL.h
//  项目一
//
//  Created by Crystal on 16/7/20.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <UIKit/UIKit.h>

//<UIScrollViewDelegate>签订协议  只能在.h文件中   因为自定的cell  UIview  
@interface Image_Browser_CELL : UICollectionViewCell<UIScrollViewDelegate>
@property (nonatomic, copy)NSString *imageUrl;
@end
