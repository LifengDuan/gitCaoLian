//
//  newShop.m
//  shouCangShop
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 qau. All rights reserved.
//

#import "newShop.h"
#import "model.h"
#import "NewshopCell.h"
static NSString *ID = @"newcell";
@interface newShop ()<NewshopCellDelegate>
@property(nonatomic,strong)NSMutableArray *arrm;
@end

@implementation newShop
//更改样式
-(instancetype)initWithStyle:(UITableViewStyle)style{

    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"新增商铺";
    [self.tableView registerClass:[NewshopCell class] forCellReuseIdentifier:ID];
    if (_arrmodel == nil) {
        [self loadData];
    }
    
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"v2_goback"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
}

-(void)newshopCell:(NewshopCell *)shopcell andWith:(model *)mode{

    NSMutableArray *arm = [NSMutableArray array];
    [_arrmodel enumerateObjectsUsingBlock:^(model *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.index == mode.index) {
           
            obj.select = mode.select;
            
        }
        [arm addObject:obj];
    }];
    _arrmodel = arm.copy;
//
    [self.tableView reloadData];
}

//数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _arrmodel.count;
    }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NewshopCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    model *mo = _arrmodel[indexPath.row];
    cell.mode =mo;
    mo.index = indexPath.row;
    cell.delegate = self;
    
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 100;
}

//加载数据
-(void)loadData{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"shopData.plist" withExtension:nil];
    NSArray *arr = [NSArray arrayWithContentsOfURL:url];
    NSMutableArray *arrm = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        model *mo = [[model alloc] init];
        [mo setValuesForKeysWithDictionary:obj];
        [arrm addObject:mo];
        
    }];
    
    _arrmodel = arrm.copy;
}


-(void)viewWillDisappear:(BOOL)animated
{

    if (self.myBlock) {
        self.myBlock(self.arrmodel);
    }
   
    
}
-(void)setArrmodel:(NSArray *)arrmodel{

    _arrmodel = arrmodel;
    [self.tableView reloadData];

}
@end
