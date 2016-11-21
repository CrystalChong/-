//
//  News_tableviewCELL.h
//  项目一
//
//  Created by Crystal on 16/7/18.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News_model.h"

/**
 {
 "id" : 1491552,
 "type" : 1,
 "image" : "http://img31.mtime.cn/mg/2012/06/28/112005.28198250.jpg",
 "title" : "《小律师有大作为》宣传海报",
 "summary" : "小律师有大作为,TNT,律政剧"
 }
 */
@interface News_tableviewCELL : UITableViewCell

@property (nonatomic, strong)News_model *model;




@end


