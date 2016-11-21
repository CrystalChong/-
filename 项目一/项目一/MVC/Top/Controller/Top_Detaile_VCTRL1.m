//
//  Top_Detaile_VCTRL.m
//  项目一
//
//  Created by Crystal on 16/7/22.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "Top_Detaile_VCTRL1.h"
#warning Bug   为什么不显示索引
#import "Top_headViwe_Model.h"
#import "Top_headView.h"
#import "Top_Comment_list_model.h"
#import "TOP_comment_list_CELL.h"



static NSString *top_Comment_CELL_ID = @"top_Comment_CELL_ID";
@interface Top_Detaile_VCTRL1 ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSMutableArray *muarray;
@property (nonatomic, strong)NSIndexPath *indexpath1;

@end

@implementation Top_Detaile_VCTRL1

- (void)viewDidLoad {
    [super viewDidLoad];
    //allocc创建
    //加载数据
    [self _loadData_LodaHeadView];
    //穿件子视图(表视图)
    [self _creatSubViews];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playVideo) name:@"PLAY_VIDEO" object:nil];
}

- (void)playVideo{

    //视频播放
    /*
     (1)添加一个类库  mediaplayer;
     (2)导入头文件
     (3)MPMoviewplaer,,,,,
     */
    
    //http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4
    
    NSURL *url  =[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"];
    
//    MPMoviePlayerViewController
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    //专门弹出视频播放的
    [self presentMoviePlayerViewControllerAnimated:player];
    
    
}

- (void)_creatSubViews{
    //创建界面tableView(加载评论列表)
    UITableView *tableVie = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableVie.dataSource = self;
    tableVie.delegate = self;
    //加到屏幕上区
    tableVie.backgroundColor = [UIColor clearColor];
    tableVie.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉分隔线;
    
    Top_headView *view = [self.view viewWithTag:3210];
    tableVie.tableHeaderView = view;
    tableVie.tag = 3211;//给tabvleview设置tag值
    [self.view addSubview:tableVie];
    
    
}

- (void)_loadData_LodaHeadView{
    //JsonDataSeverice咱们自己写的类
   NSDictionary *dic = [JsonDataSeverice ObjectOfJSONWithname:@"movie_detail.json"];
   //创建一个MOdel对象
    
    Top_headViwe_Model *model = [[Top_headViwe_Model alloc]init];
    //使用kvc给model属性赋值
    [model setValuesForKeysWithDictionary:dic];
    
    //设置一个属性 model   自定义视图  然后把这个视图作为  一头视图赋值给  tableView;
    Top_headView *headView = [[Top_headView alloc]initWithFrame:CGRectMake(0, 64, KscreenWidth, 300)];
    //不传之显示不出来
    headView.model = model;
    headView.tag = 3210;
    [self.view addSubview:headView];
    
    //评论列表的数据
    //JsonDataSeverice 自己定义的
   NSDictionary *dic_comment  = [JsonDataSeverice  ObjectOfJSONWithname:@"movie_comment.json"];
    //通过list拿到  评论数组(数组里面存放的是  字典)
    NSArray *array = dic_comment[@"list"];
    
    //初始化可变数组(评论的数组)(空的  可变数组)
    _muarray = [NSMutableArray array];
    //遍历数组
    for (NSDictionary *dic in array) {
        
        Top_Comment_list_model *model = [[Top_Comment_list_model alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [_muarray addObject:model];//加载表视图评论列表的数据
    }

}
#pragma mark - 表示图数据源方法
//返回行数
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _muarray.count;
}

//返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TOP_comment_list_CELL *cell = [tableView dequeueReusableCellWithIdentifier:top_Comment_CELL_ID];
    if (cell == nil) {
        cell = [[TOP_comment_list_CELL alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:top_Comment_CELL_ID];
    }
    cell.model = _muarray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    _indexpath = indexPath;
    
    _indexpath1 = indexPath;
//    [tableView reloadData];//舒心表视图(全部刷新)
    //<#(nonnull NSArray<NSIndexPath *> *)#>  传入一个数组  (放的都是indexPath)
    //刷新某一行
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationFade];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if(indexPath == _indexpath1){
        
        //返回文本的高度
      Top_Comment_list_model *model =  _muarray[_indexpath1.row];
        //拿到 点击的单元格的文本
        NSString *str = model.content;
        
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        //计算一条文本的高度
        //<#(nullable NSDictionary<NSString *,id> *)#>  文本的属性的字典
      CGRect rect =  [str boundingRectWithSize:CGSizeMake(KscreenWidth - 70, 9999999) options: NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        if (rect.size.height < 80) {
          
            return 90;
            
        }

        return rect.size.height + 40;
        
        
    }
    
    return 70;
}





@end
