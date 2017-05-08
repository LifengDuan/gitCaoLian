//
//  LFBCollectView.h
//  TNTLoveFreshBeen
//
//  Created by Book on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LFBCollectView;

@protocol lFBCollectViewDelegate <NSObject>

-(void)lFBCollectView:(LFBCollectView *)collec andwith:(UIButton *)btncoll;

@end

@interface LFBCollectView : UIView
@property(nonatomic,weak)id<lFBCollectViewDelegate> delegate;
@property(nonatomic,weak)UIButton *bt1;
@property(nonatomic,weak)UIButton *bt2;
@end
