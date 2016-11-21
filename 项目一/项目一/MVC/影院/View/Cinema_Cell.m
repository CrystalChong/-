//
//  Cinema_Cell.m
//  项目一
//
//  Created by Crystal on 16/7/18.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Cinema_Cell.h"

@implementation Cinema_Cell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        
        [self _creatSubViews];
        
    }
    return self;
}

- (void)_creatSubViews{
    //标题  长虹影城;
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:CGRectZero];
    //设置文字的颜色
    titlelabel.textColor = [UIColor colorWithRed:1.000 green:0.659 blue:0.362 alpha:1.000];
    titlelabel.tag = 4200;
    [self.contentView addSubview:titlelabel];
    
    UILabel *addresslabel = [[UILabel alloc]initWithFrame:CGRectZero];
    addresslabel.textColor = [UIColor redColor];
    addresslabel.tag = 4201;
    [self.contentView addSubview:addresslabel];
    
    UILabel *ratingLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    ratingLabel.textColor = [UIColor orangeColor];
    ratingLabel.tag = 4202;
    [self.contentView addSubview:ratingLabel];
}

-(void)setModel:(Cinema_Model *)model{
    
    _model = model;
    //告诉屏幕需要布局
    [self setNeedsLayout];
    
}
-(void)layoutSubviews{
    //self.frame 在这个地方   就有值了
    UILabel *titlelabel = [self.contentView viewWithTag:4200];
    UILabel *addresslabel = [self.contentView viewWithTag:4201];
    UILabel *ratingLabel =  [self.contentView viewWithTag:4202];
    
    //在这没有使用frame  如果想要适配各种屏幕的时候最好  使用self.frame;
    titlelabel.frame = CGRectMake(20, 10, 200, 30);
    addresslabel.frame = CGRectMake(20, 50, self.frame.size.width - 20, 30);
    ratingLabel.frame  = CGRectMake(self.frame.size.width - 100, 10, 100, 30);
    //赋值文字
    titlelabel.text = _model.name;
    addresslabel.text = _model.address;
    ratingLabel.text = _model.grade;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
