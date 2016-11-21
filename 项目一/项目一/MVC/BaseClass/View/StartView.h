//
//  StartView.h
//  StartView
//
//  Created by Crystal on 16/7/15.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartView : UIView{

    UIView *_yellowView;
    UIView *_grayView;
    CGFloat _yellowWidth;//表示黄色视图的一个宽度
}

@property (nonatomic, assign)double rating;
@end
