//
//  LeftViewController.h
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "SelectedAdressViewController.h"

@protocol LeftViewControllerDelegate <NSObject>

- (void)didTableView:(UITableView *)tableView clickIndexPath:(NSIndexPath *)indexPath;

@end
@interface LeftViewController : SelectedAdressViewController

@property (nonatomic, weak) id<LeftViewControllerDelegate>delegate;

@end
