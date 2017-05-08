//
//  oneView.h
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class oneView;

@protocol oneViewDelegate <NSObject>

-(void)oneView:(oneView *)oneview ;
@end


@interface oneView : UIView
@property(nonatomic,weak)id<oneViewDelegate> delegate;
@end
