//
//  SuperMarketViewController.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "SuperMarketViewController.h"

#import "Goods.h"


#define viewH [UIScreen mainScreen].bounds.size.height
#define viewW [UIScreen mainScreen].bounds.size.width

@interface SuperMarketViewController ()
@property (nonatomic,strong) UITableView *leftTableView;

@property (nonatomic,strong) UITableView *rightTableView;

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,assign) BOOL isScrollDown;

@property (nonatomic,strong) NSMutableArray *sectionData;
@property (nonatomic,strong) NSMutableArray *rowData;
@end

@implementation SuperMarketViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _selectIndex = 0;
    _isScrollDown = YES;
    
//    [self loadData];
//    [self setupLeftTableView];
//    [self setupRightTableView];
    
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}


/**
 *  解析数据
 */
+ (void)loadSupermarketData:(CompleteBlock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"supermarket" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    SuperMarketViewController *source = [SuperMarketViewController mj_objectWithKeyValues:json];
    SuperMarketData *superMarketData = source.data;
    for (NSInteger i = 0; i < superMarketData.categories.count; i++) {
        ProductCategory *catgeory = superMarketData.categories[i];
        NSArray *productsArr = superMarketData.products[catgeory.id];
        catgeory.products = [Goods mj_objectArrayWithKeyValuesArray:productsArr];
    }
    complete(superMarketData,nil);
}


@end


@implementation SuperMarketData

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"categories":NSStringFromClass([ProductCategory class])};
}

@end


@implementation ProductCategory


+ (NSDictionary *)mj_objectClassInArray {
    return @{@"products":NSStringFromClass([Goods class])};
}
@end






















