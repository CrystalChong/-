//
//  Movie_Cell_List.h
//  项目一
//
//  Created by Crystal on 16/7/15.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CInema_CELL_MODEL.h"

@interface Movie_Cell_List : UITableViewCell
@property (nonatomic, strong)CInema_CELL_MODEL *model;
@property (weak, nonatomic) IBOutlet UIImageView *imageView_ZC;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratinglabel;
@property (weak, nonatomic) IBOutlet StartView *startView1;

@end
