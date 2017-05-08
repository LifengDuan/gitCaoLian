//
//  ViewController.m
//  shouCangShop
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 qau. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "shop.h"
#import "newShop.h"
static NSString *ID =@"shopID";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *arrmZanShi;
@property(nonatomic,weak)UITableView *tad;
@property(nonatomic,strong)NSArray *arrmodel;
//@property(nonatomic,strong)newShop *shop;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    if (_arrmZanShi == nil) {
        
        UIImageView *ui = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"011"]];
                self.view.backgroundColor = [UIColor whiteColor];
        _tad.tableFooterView = ui;
        _tad.userInteractionEnabled = NO;
        
    }else{
        
        _tad.tableFooterView = [[UIView alloc] init];
    }

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"店铺收藏";
    
    //解决箭头后面的文字
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:[[UIImage alloc]init]style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;
    

    
    //  试图中间的tableview
    UITableView *tab = [[UITableView alloc]init];
    tab.dataSource = self;
    tab.delegate = self;
    _tad = tab;
    tab.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tab];
    [tab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(0);
        make.right.left.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    
    
    
 
//数据源方法的注册
    [tab registerClass:[shop class] forCellReuseIdentifier:ID];
    
    
//    加载底部更多的试图
    UIView *vi = [[UIView alloc]init];
    vi.backgroundColor = [UIColor colorWithRed:254.0/255 green:212.0/255 blue:48.0/255 alpha:1];
    [self.view addSubview:vi];
    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(tab.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.left.equalTo(self.view.mas_left).offset(75);
        make.right.equalTo(self.view.mas_right).offset(-75);
    }];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clikUI)];
    [vi addGestureRecognizer:tap];
    
    
//    试图里的文字
    UILabel *tex = [[UILabel alloc]init];
      tex.font = [UIFont systemFontOfSize:12];
    tex.text = @"+ 新增店铺";
    [vi addSubview:tex];
    [tex mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(vi);
    }];
    
    
}


//点击事件的监听
-(void)clikUI{

    newShop *shop = [[newShop alloc] init];
    [shop setMyBlock:^(NSArray *modelArray) {
        NSLog(@"%zd",modelArray.count);
        _arrmodel = modelArray;
        [_tad reloadData];
    }];

    shop.arrmodel = _arrmodel;
    
    [self.navigationController pushViewController:shop animated:YES];

}


//加载数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

//   __block int i = 0;
    NSMutableArray *arrmZanShi = [NSMutableArray array];
    [_arrmodel enumerateObjectsUsingBlock:^(model *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.select == NO) {
            
        [arrmZanShi addObject:obj];
        }
    }];
    
    _arrmZanShi = arrmZanShi;
    

    return arrmZanShi.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    shop *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (_arrmZanShi != nil) {
        
        cell.mode = _arrmZanShi[indexPath.row];
    }
    
    return cell;
    
}
//代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;

}






@end
