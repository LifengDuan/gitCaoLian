//
//  LFBVipCenterController.m
//  LFBVipCenter
//
//  Created by YVEN on 16/10/12.
//  Copyright © 2016年 YVEN. All rights reserved.
//

#import "LFBVipCenterController.h"
#import "Masonry.h"
#import "LFBVipCententHeaderView.h"
#import "LFBVipCenterViewCell.h"
#import "LFBVipCenterModel.h"

static NSString *cellID = @"vipCellID";
@interface LFBVipCenterController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *contentData;

@end

@implementation LFBVipCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    self.navigationItem.title = @"会员中心";
    self.tableView.showsVerticalScrollIndicator = NO;
    // 设置tableView的头部视图
    self.tableView.tableHeaderView = [[LFBVipCententHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 230)];
    
    [self.tableView registerClass:[LFBVipCenterViewCell class] forCellReuseIdentifier:cellID];
    
//    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    
//    self.tableView.rowHeight = 100;
    
    _contentData = [self loadContentData];
    
    // 设置预估行高"大概的行高"
    self.tableView.estimatedRowHeight = 400;
    // 自动调用尺寸
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LFBVipCenterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.content = _contentData[indexPath.row];
    
    return cell;
}

- (NSArray *)loadContentData {
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"LFBVipCenterContent.plist" withExtension:nil]];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[LFBVipCenterModel contentWithDict:dict]];
    }
    
    return arrM.copy;
}

@end