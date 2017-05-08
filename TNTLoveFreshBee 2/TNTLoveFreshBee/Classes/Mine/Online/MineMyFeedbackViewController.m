//
//  MineMyFeedbackViewController.m
//  SubOthersDetail
//
//  Created by 张木锋 on 2016/10/15.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "MineMyFeedbackViewController.h"
#import "Masonry.h"
#import "MineFeedBackOnlineController.h"
#import "MineQuestionController.h"
//#import "MineFeedBackController.h"

#define FeedbackCellID @"FeedbackCell"

@interface MineMyFeedbackViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MineMyFeedbackViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"客服/反馈";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupWebViewUI];
}

- (void)setupWebViewUI {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.sectionHeaderHeight = 20;
    
    tableView.sectionFooterHeight = 0;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:FeedbackCellID];
    
    tableView.rowHeight = 50;
    
    tableView.separatorInset = UIEdgeInsetsZero;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:FeedbackCellID];
    
    if (indexPath.section == 0) {
        
        cell.textLabel.text = @"在线客服";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.imageView.image = [UIImage imageNamed:@"author"];
        
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        cell.detailTextLabel.text = @"9点到22点实时回复";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        cell.textLabel.text = @"意见反馈";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.imageView.image = [UIImage imageNamed:@"feedBack_service"];
        
        cell.detailTextLabel.text = @"1-2个工作日内反馈";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        cell.textLabel.text = @"常见问题";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.imageView.image = [UIImage imageNamed:@"normal_question"];
        
        cell.detailTextLabel.text = @"配送时间,优惠券和退款流程等";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        cell.textLabel.text = @"客服电话";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.imageView.image = [UIImage imageNamed:@"icon_exclamationmark"];
        
        cell.detailTextLabel.text = @"400-8484-842";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
        cell.detailTextLabel.textColor = [UIColor blueColor];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        [self setupNavigationBarUI];
        [self.navigationController pushViewController:[[MineFeedBackOnlineController alloc] init] animated:YES];
    }
//    if (indexPath.section == 1 && indexPath.row == 0) {
//        
//        [self setupNavigationBarUI];
//        [self.navigationController pushViewController:[[MineFeedBackController alloc] init] animated:YES];
//    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        [self setupNavigationBarUI];
        [self.navigationController pushViewController:[[MineQuestionController alloc] init] animated:YES];
    }
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.layoutMargins = UIEdgeInsetsZero;
}
- (void)setupNavigationBarUI {
    
    // 1.把系统的返回按钮覆盖
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 2.设置导航条的条样式为默认样式
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    // 3.设置按钮的背景图片和状态
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"v2_goback"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}
@end
