//
//  Index_CELL.m
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Index_CELL.h"

@implementation Index_CELL
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //创建子视图
        CGFloat width = self.width*.95;
        //让imageView居中并且缩小CGRectMake((self.width -width)/2, 0, width, self.height)
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width -width)/2, 0, width, self.height)];
        imageView.tag = 1700;
        [self.contentView addSubview:imageView];
    }
    return self;
    
}
-(void)setModel:(CInema_CELL_MODEL *)model{
    _model = model;
    
    
    UIImageView *imageView  = [self.contentView viewWithTag:1700];
    //加载图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:_model.images[@"small"]]];
    
    
}


@end
