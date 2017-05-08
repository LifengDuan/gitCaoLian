//
//  ProductsViewController.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "RightViewController.h"
#import "Goods.h"
#import "RightCell.h"
#import "SuperMarketViewController.h"


@interface RightViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIImageView *tableFooterView;
@end

@implementation RightViewController

- (UIImageView *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_common_footer"]];
        _tableFooterView.frame = CGRectMake(0, 0, Width*0.75,70);
        _tableFooterView.contentMode = UIViewContentModeCenter;
    }
    return _tableFooterView;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view = [[UIView alloc]initWithFrame:CGRectMake(Width * 0.25, 0, Width * 0.75, Height)];
    
    [self bulidTableView];
}
- (void)bulidTableView{
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.contentInset = UIEdgeInsetsMake(105, 0, 120, 0);
    _tableView.tableFooterView = _tableFooterView;
    [self.view addSubview:_tableView];
    
    
    AnimationRefreshHeader *header = [AnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefeshData)];
    _tableView.mj_header = header;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)headerRefeshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_tableView.mj_header endRefreshing];
    });
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.supermarketSouce.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.supermarketSouce.categories[section].products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[RightCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.goods = self.supermarketSouce.categories[indexPath.section].products[indexPath.row];
    
    void(^animationBlock)(CGPoint point) = ^(CGPoint point){
        
        // - 1.创建图片框
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(0, 0, 70, 70);
//        imgView.alpha = 1.0;
        imgView.layer.cornerRadius = 35;
        imgView.layer.masksToBounds = YES;
        [imgView sd_setImageWithURL:[NSURL URLWithString:cell.goods.img]];
        
        imgView.center = point; // 点击加号按钮的位置!
        
        // - 获取主窗口
        UIWindow *keyW = [UIApplication sharedApplication].keyWindow;
        [keyW addSubview:imgView];
        
        // MARK: - 2.添加动画效果! 关键帧核心动画
        // - 1.创建动画对象
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        
        // - 2.设置属性
        // - 2.1 设置路径
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:point]; // 起点
        
        // 设置核心动画的代理
        anim.delegate = self;
        // - 2.3 设置图片框!
        // - 通过KVC的方式给核心动画绑定一个图片框进去! 核心动画特有的!其他的对象不可以!
        [anim setValue:imgView forKey:@"AXF_IMGV"];
        
        
        // - 3.添加
        [imgView.layer addAnimation:anim forKey:nil];
        
        // 参数1 结束点!
        // 参数2 控制点!
        CGPoint endP = CGPointMake(268, keyW.bounds.size.height); // 268
        CGPoint controlP = CGPointMake(point.x -200, point.y - 200); // 200 , 200
        [path addQuadCurveToPoint:endP controlPoint:controlP]; // 添加抛物线!
        
        [UIView animateWithDuration:0.6 animations:^{
            imgView.transform = CGAffineTransformScale(imgView.transform, 0.5, 0.5);
        } completion:^(BOOL finished) {
            [imgView removeFromSuperview];
        }];
        anim.path = path.CGPath;
        
        anim.duration = 0.7;
        
        
        // - 3.添加
        [imgView.layer addAnimation:anim forKey:nil];
        
    };
    
    cell.WillStartAnimation = animationBlock;

    return cell;
}
//// 核心动画动画的代理方法
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    
//    // 1.取出图片框
//    UIImageView *imgV = [anim valueForKey:@"MT_IMGV"];
//    //    NSLog(@"end ->%@  %@", anim, imgV);
//    
//    // 2.移除
//    [imgV removeFromSuperview];
//    
//    // 3.动画结束时,赋值给购物车视图!
//    _carView.shoppingCarList = _selectFoodList;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

#pragma mark - --- FlashViewControllerDelegate ---
- (void)didTableView:(UITableView *)tableView clickIndexPath:(NSIndexPath *)indexPath{
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.row] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

@end
