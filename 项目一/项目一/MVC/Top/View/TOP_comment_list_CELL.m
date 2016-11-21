//
//  TOP_comment_list_CELL.m
//  项目一
//
//  Created by Crystal on 16/7/22.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "TOP_comment_list_CELL.h"

@implementation TOP_comment_list_CELL

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        //在这个方法里面不能给frame 因为没有穿过来
        [self _creatSubViews];
    }
    return self;
}

- (void)_creatSubViews{
    //成放头像
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    imageView.tag = 3212;
    [self.contentView addSubview:imageView];
    
    //显示评论内容
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.tag = 3213;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor whiteColor];
    
    [self.contentView addSubview:label];
}

-(void)setModel:(Top_Comment_list_model *)model{
    
    _model = model;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    //头像
    UIImageView *imageView  = [self.contentView viewWithTag:3212];
    UILabel *label = [self.contentView viewWithTag:3213];
    label.backgroundColor = [UIColor darkGrayColor];
    imageView.frame = CGRectMake(5, 5, 60, 60);
    label.frame = CGRectMake(70, 5, self.width - 70, self.height - 5);
    //设置用户头像
    //设置圆角
    label.layer.cornerRadius = 5;
    label.layer.borderWidth = 3;
    label.layer.borderColor  = [UIColor orangeColor].CGColor;
    label.clipsToBounds = YES;
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:_model.userImage]];
    label.text = _model.content;
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
