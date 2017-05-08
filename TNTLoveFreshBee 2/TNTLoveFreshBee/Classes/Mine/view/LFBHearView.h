//
//  LFBHearView.h
//  TNTLoveFreshBeen
//
//  Created by Book on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LFBHearView;

@protocol LFBHearViewDelegate <NSObject>

-(void)LFBHearView:(LFBHearView *)lFBHearView andwithbt:(UIButton *)btn;

@end


@interface LFBHearView : UIView
@property(nonatomic,weak)id<LFBHearViewDelegate> delegate;
@end
