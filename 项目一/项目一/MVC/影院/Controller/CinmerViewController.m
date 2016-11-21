//
//  CinmerViewController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "CinmerViewController.h"
#import "Cinema_Model.h"
#import "Cinema_headView.h"
#import "Cinema_Cell.h"


@interface CinmerViewController ()<UITableViewDataSource,UITableViewDelegate>{

    BOOL isclick[30];
}
@property (nonatomic, strong)NSMutableDictionary *mu_dic;
@property (nonatomic, strong)NSArray * arrKeys;
@end

@implementation CinmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"影院";
    
    //加载数据
    [self loadData];
    //创建tableveiw
    [self _creatSubViews];
}

- (void)_creatSubViews{
    
    //创建一个tableview出来
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tag = 4100;
    //she  hanggao
    tableView.rowHeight = 80;
    //透明

    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//不显示分割线
    [self.view addSubview:tableView];
    
}

#pragma mark - 表示图数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arrKeys.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;//如果有尾视图 用小于0.01这种方式 去消除  尾视图
    
    /* 
     为什么表视图的尾视图也没有了;
     */
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    
//    return nil;
//}
//返回行数
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //isclick里面所有的元素默认为NO
    if (isclick[section] == NO) {
        return 0;
    }else{
        //str  城区的名字
        NSString *str = [_arrKeys objectAtIndex:section];
        NSArray *array = [_mu_dic objectForKey:str];
        
        return array.count;
    }
}


//返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify =@"Cinema_CELL_ID";
    Cinema_Cell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[Cinema_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    //(1)自定义cell
    //(2)头视图自定义
    //平铺的模式(显示出来头视图)
//    cell.model = _mu_dic[indexPath.row];
    //取出城区的名字
   NSString *str = _arrKeys[indexPath.section];
   NSArray *arr = _mu_dic[str];
    cell.model = arr[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //使用功能重用池(自定义headveiw)
    Cinema_headView *head  = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MY_HEAD_VIEW_ID"];
    if (head == nil) {
        
        head = [[Cinema_headView alloc]initWithReuseIdentifier:@"MY_HEAD_VIEW_ID"];
        
        
    }
    //自定义头视图
//    head.contentView.backgroundColor = [UIColor redColor];
    
    //给按钮设置标题
    [head.btn  setTitle:_arrKeys[section] forState:UIControlStateNormal];
    //给按钮添加点击的事件
    [head.btn addTarget:self action:@selector(headbtnAction:) forControlEvents: UIControlEventTouchUpInside];

    head.btn.tag = 4001 + section;
    return head;
    
}
-(void)headbtnAction:(UIButton *)btn{
    
    isclick[btn.tag - 4001] =! isclick[btn.tag- 4001];
    
    //舒心表视图
    UITableView *tableview = [self.view viewWithTag:4100];
//    [tableview reloadData];//刷新表视图(耗费性能)
    
    //创建一个范围  nsrange  <#NSUInteger loc#> 从哪一组开始  <#NSUInteger len#>  总共长度
    NSRange range = NSMakeRange(btn.tag - 4001, 1);
    
    NSIndexSet *set = [[NSIndexSet alloc]initWithIndexesInRange:range];
    //刷新某一组
    [tableview reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
   
    
}
//给透视图赋值一个而高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

//数据的加载
- (void)loadData{

   //创建了一个空的可变的字典(创建tableview的时候使用)
    _mu_dic = [NSMutableDictionary dictionary];
    
    //第一模块 解析所有的影院
    NSMutableArray *mu_arr  = [NSMutableArray array];
    //PCH文件有dataserver
   NSDictionary *dic = [JsonDataSeverice  ObjectOfJSONWithname:@"cinema_list.json"];
    NSArray *array = dic[@"cinemaList"];
    for (NSDictionary *dic1  in array) {
        
        //创建一个model出来
        Cinema_Model *model = [[Cinema_Model alloc]init];
//        model.districtId
        //使用kvc
        [model setValuesForKeysWithDictionary:dic1];
        [mu_arr addObject:model];
    }
    //第二模块
    /**
     "districtList" : [ {
     "name" : "东城区",
     "id" : "1029"
     },
     */
   NSDictionary *ditrict = [JsonDataSeverice ObjectOfJSONWithname:@"district_list.json"];
   NSArray *DIS_array = ditrict[@"districtList"];
    
    for (int i = 0; i<DIS_array.count ;i++){
        // 取到城区字典;
        NSDictionary *dic3 =DIS_array[i];
        //创建一个空的可变的数组(盛放所有电影院model)
        NSMutableArray *mu_arr_dis = [NSMutableArray array];
        for (int j = 0; j<mu_arr.count; j++) {
            Cinema_Model *model = [mu_arr objectAtIndex:j];
            //判断是否和dic3里面的id是一样的 如果一样就把model加在mu_arr_dis里面
            if ([dic3[@"id"] isEqualToString:model.districtId]) {
                
                [mu_arr_dis addObject:model];
            }
        }
        //最后用城区字典里面的key作为字典的key  把数组当做value
        [_mu_dic setValue:mu_arr_dis forKey:dic3[@"name"]];
        
//       eg: {
//        @"东城区":[加了国际,胖东来影城],
//        @"西城区":[加国际,东来影城],
//        }
    }
    //所有城区的名字(是以字符串的形式存放在数组里面;
    _arrKeys = [_mu_dic allKeys];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
