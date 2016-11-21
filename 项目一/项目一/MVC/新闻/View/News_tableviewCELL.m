//
//  News_tableviewCELL.m
//  项目一
//
//  Created by Crystal on 16/7/18.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "News_tableviewCELL.h"

@implementation News_tableviewCELL

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
       
        [self _creatSubViews];
        
    }
    return self;
}
//创建子视图
- (void)_creatSubViews{
    //海报
    UIImageView *imagePoster = [[UIImageView alloc]initWithFrame:CGRectZero];
    imagePoster.tag = 2001;
    [self.contentView addSubview:imagePoster];
    //类型标示图像
    UIImageView *typeImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    typeImageView.tag =  2002;
    [self.contentView addSubview:typeImageView];
    //创建一标题
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:CGRectZero];
    titlelabel.tag = 2003;
    [self.contentView addSubview:titlelabel];
    
    //创建一个summary
    UILabel *summary = [[UILabel alloc]initWithFrame:CGRectZero];
    summary.tag = 2004;
    [self.contentView addSubview:summary];
    
    
}
//如果在外边给model赋值就会调用这个方法
-(void)setModel:(News_model *)model{
    
    _model = model;
    //要求重新布局
    [self setNeedsLayout];
    
}
-(void)layoutSubviews{
    UIImageView *imagePoster = [self.contentView viewWithTag:2001];
    UIImageView *typeImageView = [self.contentView viewWithTag:2002];
    UILabel *titlelabel = [self.contentView viewWithTag:2003];
    UILabel *summary = [self.contentView viewWithTag:2004];
    
    
    imagePoster.frame = CGRectMake(5, 5, 70, 80);
    titlelabel.frame = CGRectMake(80, 5, 200, 30);
    //表示类型;
    typeImageView.frame = CGRectMake(CGRectGetMaxX(imagePoster.frame)+5, self.frame.size.height - 40, 30, 30);
    summary.frame = CGRectMake(CGRectGetMaxX(typeImageView.frame), self.frame.size.height - 40, 200, 30);
    //创建一个URL
    NSURL *url = [NSURL URLWithString:_model.image];
    [imagePoster sd_setImageWithURL:url];
    
    titlelabel.text = _model.title;
    
    summary.text = _model.summary;
   /*
    if (<#condition#>) {
      <#statements#>
    }
    */
    
    /**
     x = 3;
     y= 4;
     *  3>4?X:Y;三木运算
     */
    //把nsnumber类型的和字符传类型都能转化成  int类性的值;
    NSInteger i = [_model.type integerValue];
    typeImageView.image = i?[UIImage imageNamed:@"sctpxw"]:[UIImage imageNamed:@"scspxw"];
    //Code will never be executed 代码将会永远不执行
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
