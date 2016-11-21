//
//  Movie_Cell_List.m
//  项目一
//
//  Created by Crystal on 16/7/15.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Movie_Cell_List.h"

@implementation Movie_Cell_List

//z这个方法在我使用xib的时候回自动调用
- (void)awakeFromNib {
    // Initialization code
}

//一般咱们在不适用xib' 的时候会自动调用这个方法
//-(instancetype)init{
//
//}

-(void)setModel:(CInema_CELL_MODEL *)model{
    _model = model;
    
    //(1)我可以直接在这个地方修改label 图片的显示;
    //(2)需要在这个地方提醒一下
    
//    _imageView_ZC.image = [UIImage imageNamed:@""];
    
    
    [self setNeedsLayout];//提醒屏幕需要重新布局;
}
//布局子视图
-(void)layoutSubviews{
    //内部已经初始化了(在拖拽的时候)  不用再重新初始化
    // _imageView_ZC = [[UIImageView alloc]init];
    //    _imageView_ZC.image = _model.images[@"medium"];
    /*
    NSURL *url = [NSURL URLWithString:_model.images[@"medium"]];
    //根据路径  把路径所对应的文件转化成  data  存储在data里面
    NSData *data1 = [NSData dataWithContentsOfURL:url];//主线程一直卡在这个地方;
//    NSData *data = [NSData dataWithContentsOfFile:_model.images[@"medium"]];
    //通过data加载网络图片;
   UIImage *image1 = [UIImage imageWithData:data1];
    _imageView_ZC.image = image1;
    */
    NSURL *url = [NSURL URLWithString:_model.images[@"medium"]];
    //框架里面的一个实例方法sd_setImageWithURL
    [_imageView_ZC sd_setImageWithURL:url];//多线程操作(后面会将)
    
    //给标题赋值
    _titleLabel.text = _model.title;
    //字符串
    _yearLabel.text = _model.year;
    _ratinglabel.text= [NSString stringWithFormat:@"%.2f", [_model.rating[@"average"] floatValue]];
    _startView1.rating = [_model.rating[@"average"] doubleValue];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
