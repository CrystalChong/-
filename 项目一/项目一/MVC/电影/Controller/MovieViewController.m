//
//  MovieViewController.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "MovieViewController.h"
#import "CInema_CELL_MODEL.h"
#import "Movie_Cell_List.h"

#import "PosetView.h"


//静态修饰符;(只调用一次)
static NSString *identify = @"MovieViewController_CELL_ID";


@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSMutableArray *muarray;
//创建一个全局的tableView出来
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)PosetView *postView;//在这上面放一些collectiuoNVeiw
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    /*
    
//    [NSJSONSerialization JSONObjectWithData:<#(nonnull NSData *)#> options:<#(NSJSONReadingOptions)#> error:&error];
    
    //int* 整型的指针变量  * 指针运算符   a 指针变量;
    // int * *a;
    */
    /*
    //http://img3.douban.com/img/celebrity/large/5486.jpg
    
    UIImageView *imageViw = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    NSURL *url = [NSURL URLWithString:@"http://img3.douban.com/img/celebrity/large/5486.jpg"];

    [imageViw sd_setImageWithURL:url];
    [self.view addSubview:imageViw];
    NSLog(@"%@",dic);
    
    */
    
    //加载数据
    [self _loadData];
    /*
     1.创建一个tableView
     2.自定义CELL(view)出来
     3.星星视图;
     4.翻转动画;
     */
    [self _creatTablView];
    //创建导航项
    [self _creatNavItem];
    //创建一个UIView
    [self _cretUIView];
    
}
- (void)_cretUIView{
    //全部的视图都在自定义类里面去写   (不会来了)
    _postView = [[PosetView alloc]initWithFrame:self.view.bounds];
    
    
    _postView.array = _muarray;

    [self.view addSubview:_postView];
    
}

- (void)_creatNavItem{
    
    /*
     创建一个baseView歘来
     让baseview显示在导航栏上(UIbabritem)
     创建两个button放在baseView上面
     让其中一个Abtn暂时隐藏
     当我翻转的时候让另外一个Bbtn隐藏
     让Abtn显示出来
     */
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
//    [baseView setBackgroundColor:[UIColor whiteColor]];
    
    
    //创建列表btn
    UIButton *btn_list = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    btn_list.tag = 1001;
    btn_list.hidden = YES;
    //给按妞设置图片用setimage  setbackgroundimage;  
    [btn_list setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];//正常状态显示的背景图片
    [btn_list setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];//正常状态下现实的图片  和背景图片不一样
    [btn_list addTarget:self action:@selector(_btnanimation:) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:btn_list];
    
    
    UIButton *btn_Post = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    btn_Post.tag = 1002;
    //给按妞设置图片用setimage  setbackgroundimage;
    [btn_Post setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];//正常状态显示的背景图片
    [btn_Post setImage:[UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateNormal];//正常状态下现实的图片  和背景图片不一样
    [btn_Post addTarget:self action:@selector(_btnanimation:) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:btn_Post];
    
//    btn_Post.hidden = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:baseView];
    
    
}

- (void)_btnanimation:(UIButton *)btn{
    
    
    //customView  拿到的就是一个  baseview;
    UIView *baseView = self.navigationItem.rightBarButtonItem.customView;
    UIButton *btn_list = [baseView viewWithTag:1001];
    UIButton *btn_post = [baseView viewWithTag:1002];
   
    //翻转动画的封装;
    [self _flipAnimationWithView:baseView :btn_list.hidden];
    [self _flipAnimationWithView:self.view :btn_list.hidden];
    //修改隐藏状态
    btn_list.hidden =! btn_list.hidden;
    btn_post.hidden =! btn_post.hidden;
    
    _tableView.hidden =! _tableView.hidden;
    _postView.hidden = ! _postView.hidden;
    //翻转动画;
    
    /**
     FromView:从这个视图翻转到toView
     duration 时间
     options:动画效果
     completion:动画完成之后要做的操作;
     */
    /*
//    [UIView transitionFromView:bt
//                        toView:bt
//                      duration:<#(NSTimeInterval)#>
//                       options:<#(UIViewAnimationOptions)#>
//                    completion:<#^(BOOL finished)completion#>];
    */
    /**
     WithView 自己翻自己
     duration:时间
     animations在你做动画的过程中  需要做的操作;
     */
  //翻转动画封装方法;
//    [self _flipAnimationWithView:baseView  ];
//    [self _flipAnimationWithView:_tableView];
    
    
}

//把动画效果封装起来;
- (void)_flipAnimationWithView:(UIView *)view :(BOOL)isLeft{
    
    //判断是否从做或者从右翻转;使用三目运算
    //如果为真 option = UIViewAnimationOptionTransitionFlipFromRight
    //如果为假就执行 option = UIViewAnimationOptionTransitionFlipFromLeft
  UIViewAnimationOptions option =  isLeft?UIViewAnimationOptionTransitionFlipFromRight:UIViewAnimationOptionTransitionFlipFromLeft;
    //动画执行翻转
    [UIView transitionWithView:view
                      duration:.3
                       options:option
                    animations:nil
                    completion:nil];
}
//+ (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion
//
//+ (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion


- (void)_creatTablView{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //设置代理数据源协议;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 100;
    _tableView.hidden = YES;
    _tableView.backgroundColor  = [UIColor clearColor];
    [self.view addSubview:_tableView];//两个条件已经满足了其中一个;
    //设置分割线样式的属性 UITableViewCellSeparatorStyleNone
     _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //创建一个nib文件
    UINib *nib = [UINib nibWithNibName:@"Movie_Cell_List" bundle:nil];
    //刚才重用池要寻找  如果找不到就根据一个而模板去创建一个
    //模板就是我注册的文件;
    [_tableView registerNib:nib forCellReuseIdentifier:identify];
    
}
//加载数据
- (void)_loadData{
    NSDictionary *dic  = [JsonDataSeverice ObjectOfJSONWithname:@"us_box.json"];
    NSArray *array = dic[@"subjects"];
    //出事话全局数组
    _muarray = [NSMutableArray array];
    for (NSDictionary *dicT in array) {
        //通过subject拿到dicT里面的字典;
        NSDictionary *dic3 = dicT[@"subject"];
        /*
        CInema_CELL_MODEL *model = [[CInema_CELL_MODEL alloc]init];
//        model.images = [dic3 objectForKey:@"images"];
        model.images = dic3[@"images"];
        model.year = dic3[@"year"];
        model.title  = dic3[@"title"];
        model.rating = dic3[@"rating"];
         */
        //创建一个模型对象出来;
        CInema_CELL_MODEL *model = [[CInema_CELL_MODEL alloc]init];
        /*
        //KVC  dic3 {title:@"SB"}
//        [model setValue:@"SB" forKey:@"title"];
        */
        //根据字典里面的KEY  去给model的属性赋值但是如果某些属性model里面没有就要实现一个而方法
        [model setValuesForKeysWithDictionary:dic3];
        /*
         如果dic里面有的key:model里面没有:就会自动调用
         -(void)setValue:(id)value forUndefinedKey:(NSString *)key
         :
        如果dic里面有的key:model也有:就会自动调用
         
         
         */
        [_muarray addObject:model];
    }
}
#pragma mark - 表示图数据源方法
//返回行数
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //(1)先加载数据(2)创建视图
    return _muarray.count;
}
//返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //根据标识符去重用池里面去寻找  如果找到了  把cell拿出来
    //如果说找不到:根据一个模板创建一个cell
    //需要用到模板  就需要注册一个单元格  或者一个nib文件出来
    Movie_Cell_List *cell = [tableView  dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    /*
    if (cell == nil) {
        //如果用了xib就不能再用这种方法
        //        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        
       cell = [[[NSBundle mainBundle]loadNibNamed:@"Movie_Cell_List" owner:self options:nil] lastObject];
        //jiazi XIB的方式
        
    }*/
    //把model值传入cell里面去;
    cell.model = _muarray[indexPath.row];

//    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

@end
