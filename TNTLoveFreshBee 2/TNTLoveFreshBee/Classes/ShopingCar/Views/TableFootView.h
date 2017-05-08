//
//  TableFootView.h
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TableFootViewDelegate <NSObject>
- (void)didTableFootViewCommit;

@end
@interface TableFootView : UIView
@property (nonatomic, weak) id<TableFootViewDelegate>delegate ;
@property (nonatomic, assign) CGFloat sumMoney;
@end
