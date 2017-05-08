//
//  shopc.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "shopc.h"

@interface shopc ()

@end

@implementation shopc
-(instancetype)initWithStyle:(UITableViewStyle)style{

    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *im = [[UIImageView alloc]init];
    im.image = [UIImage imageNamed:@"016"];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableHeaderView = im;

    self.tableView.showsVerticalScrollIndicator = NO;
}


@end
