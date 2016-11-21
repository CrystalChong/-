//
//  PosetView.m
//  项目一
//
//  Created by Crystal on 16/7/23.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "PosetView.h"
#import "CInema_CELL_MODEL.h"


@implementation PosetView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
       //创建那些子视图
        //(1)创建大的CollectioNVeiw
        [self _creatBig_colectioNView];
        //(4)创建一个标题
        [self _creatTItlView];
        
        //(4)创建手势
        [self _cratGEsTure];
        
        //(4)创建一个遮罩视图
         [self _creatMaskView];
        //(1)创建头视图
        [self _creat_HeadView];
       
        //(3)创建一个小的collectioNVeiw;
        [self _creatIndexCollectionview];
        
        //给  big_collectioNViw  设置一个监听;
        /**
// name:  点语法  或者  KVC给name 属性赋值
        Observer:观察者  self指的是PostView 在监听  -->  bigCollectioNView--->监听属性:()
         */
        /*
         NSKeyValueObservingOptionNew  新值
         NSKeyValueObservingOptionOld  旧值
         */
        [bigCollectioNView  addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        
        //想让小的  滑动的时候也有反映
        [index_colleView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

/**
 *  @param keyPath 属性名
 *  @param object  被监听的对象
 *  @param change  字典类型  new 新值
 *  @param context 上下文  先不去管他
 */
//每次滑动collectionview  就会自动调用功能这个方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSLog(@"-0------------%@",change);
    //change[@"new"]  拿到的一个新值是一个NSnumber类型
    NSInteger index = [change[@"new"] integerValue];
    
    //根据第几个单元格  拿出第几个MOdel;
    CInema_CELL_MODEL *model = _array[index];
    titlLabel.text = model.title;
    
    
    
    //创建一个indexPath 出来        Item  Collectionveiw里面的一个属性
    NSIndexPath *indepath = [NSIndexPath indexPathForItem:index inSection:0];
    /*
    //UICollectionViewScrollPositionCenteredHorizontally  水平居中显示
    [index_colleView scrollToItemAtIndexPath:indepath  atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    */
    //isKindOfClass:  判断某一个对象是否属于某一个类  &&  且
    if([object isKindOfClass:[Big_collectioNView class]]&& indepath.item != index_colleView.currentIndex){
        //让小的动
        [index_colleView scrollToItemAtIndexPath:indepath  atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //点语法  index_colleView也会触发  监听
        index_colleView.currentIndex = index;
    }else if ([object isKindOfClass:[Index_ColelctioNView class]] && indepath.item != bigCollectioNView.currentIndex){
        //让大的动
        [bigCollectioNView scrollToItemAtIndexPath:indepath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //如果在这里不修改 currentIndex  第一次点击的时候不会翻转(再一次让  collectionview滑到中间显示)
        //点语法  也会触发 监听;
        bigCollectioNView.currentIndex = index;
    }
}
#pragma mark  - 创建手势
- (void)_cratGEsTure{
    
    /**/
    //轻触屏幕  继承与   UIGestureRecognizer 手势的父类
    //UITapGestureRecognizer(轻触屏幕)
    //轻扫屏幕
    //创建一个轻扫手势
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_swipGesture)];
   /*
    UISwipeGestureRecognizerDirectionRighu有
    UISwipeGestureRecognizerDirectionLeft做
    UISwipeGestureRecognizerDirectionUp桑
    UISwipeGestureRecognizerDirectionDown下
    */
    //往下话的时候会调用方法
    swip.direction =  UISwipeGestureRecognizerDirectionDown;
    //添加一个手势
    [bigCollectioNView addGestureRecognizer:swip];

}
#pragma mark - 创建标题
- (void)_creatTItlView{
    
    titlLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bigCollectioNView.frame), KscreenWidth, 40)];
    //把一张图片变换成颜色
    titlLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_bg_all@2x"]];
    //因为北京眼色是黑色
    titlLabel.textColor = [UIColor whiteColor];
    //居中显示
    titlLabel.font = [UIFont systemFontOfSize:20];
    titlLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titlLabel];
    
}

#pragma mark  - 轻扫屏幕的时候会调用这个方法
- (void)_swipGesture{
    
//    //拿到头视图上面的btn
//    UIButton *btn = [headView viewWithTag:1610];
//    //在内部调用luodali 不需要申明
//    [self luodaliAction:btn];
    //因为在_mask_view_black方法里没有用到参数control
    [self _mask_view_black:nil];

}

#pragma  mark - 创建一个大的colectionView
- (void)_creatBig_colectioNView{
    
    //创建一个而布局对象(没必要设置itemSize)
    UICollectionViewFlowLayout *layout  =[[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    //水平高华东
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //UICollectionView
    //100是头视图的高度
    bigCollectioNView = [[Big_collectioNView alloc]initWithFrame:CGRectMake(0, 100, KscreenWidth, KscreenHeight - 100- 49-40) collectionViewLayout:layout];
    bigCollectioNView.itemWIdth = KscreenWidth / 4 *3;//让collectionview的单元格  和屏幕的四分之三一样宽;
    [self addSubview:bigCollectioNView];
}

#pragma mark  -创建一个遮罩视图
- (void)_creatMaskView{
    //UIview
    //UIbutton
    //和屏幕一样大(使用button的父类不使用button也是可以的)
    mask_view = [[UIControl alloc]initWithFrame:self.bounds];
    //
    mask_view.backgroundColor = [UIColor colorWithWhite:.1 alpha:.6];
    
//    [button   addta];
    //给遮罩视图一个事件
    mask_view.hidden = YES;//开始的时候就隐藏掉
    [mask_view addTarget:self action:@selector(_mask_view_black:) forControlEvents: UIControlEventTouchUpInside];
    
    //在打的collectionvirw上面  头视图的下面
    [self addSubview:mask_view];
    //把mask-View放到  头视图的下面
    //[self insertSubview:mask_view belowSubview:headView];
    
    
}
#pragma mark - mask_view调用的方法
- (void)_mask_view_black:(UIControl *)control{
    //拿到头视图上面的btn
    UIButton *btn = [headView viewWithTag:1610];
    //在内部调用luodali 不需要申明
    [self luodaliAction:btn];
    

    
}

#pragma mark  - 创建头视图
- (void)_creat_HeadView{
    //头视图
    headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, 100)];

    [self addSubview:headView];
    
    //放背景图片  (下拉图片)
    UIImageView *image_BG  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100-30, KscreenWidth, 30)];
    image_BG.image = [UIImage imageNamed:@"indexBG_home@2x.png"];
    //刚开始的时候这个btn的frme可以随便给;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0,0, 30, 30)];
    //和imageView的中心点重叠;
    btn.center = image_BG.center;
    //正常状态下显示这张图片
    btn.tag = 1610;
    [btn setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    //选中状态下的图片
    [btn setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(luodaliAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [headView addSubview:image_BG];
    //以为我想用  btn.center
    [headView addSubview:btn];
    
}
#pragma mark - 创建colectionview
- (void)_creatIndexCollectionview{
    
    //创建一个而布局对象(没必要设置itemSize)
    UICollectionViewFlowLayout *layout  =[[UICollectionViewFlowLayout alloc]init];
//    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    //水平高华东
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //UICollectionView
    //100是头视图的高度
    index_colleView = [[Index_ColelctioNView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, 100-30) collectionViewLayout:layout];
    index_colleView.itemWIdth = 70;

    [headView addSubview:index_colleView];
    
}
//点击收缩按钮的时候回调用这个方法
- (void)luodaliAction:(UIButton *)btn{
   
    btn.selected =! btn.selected;
    //Block'实现动画
    [UIView animateWithDuration:.3 animations:^{
    if (btn.selected == YES) {
            headView.transform  =CGAffineTransformMakeTranslation(0, 64);
        mask_view.hidden = NO;
    }else{
        //回复原来状态
        headView.transform = CGAffineTransformIdentity;
        mask_view.hidden = YES;
        }
       }];
    
}
#pragma mark - 数据传送;
-(void)setArray:(NSArray *)array{
    
    _array = array;

    //拿到第一个显示的文字
  CInema_CELL_MODEL *model =   _array[0];
    titlLabel.text = model.title;
    //获取到数据刷新表视图
    bigCollectioNView.data = _array;//获取到数据的时候就刷新一下表视图;
    [bigCollectioNView reloadData];
    //获取到数据刷新表视图
    index_colleView.data = _array;
    [index_colleView reloadData];
}



@end
