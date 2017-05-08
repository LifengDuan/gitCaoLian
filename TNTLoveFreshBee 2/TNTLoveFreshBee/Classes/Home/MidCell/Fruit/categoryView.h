//
//  categoryView.h
//  自定义cell
//
//  Created by Steve on 2016/10/12.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@class categoryView;

@protocol categoryViewDelegate <NSObject>

@optional

-(void)categoryView:(categoryView *)categoView viewTag:(NSInteger)viewtag;

@end





@interface categoryView : UIView

@property (nonatomic, strong) NSArray *viewDataArr;

@property (nonatomic, weak) id<categoryViewDelegate> delegate;
@end
