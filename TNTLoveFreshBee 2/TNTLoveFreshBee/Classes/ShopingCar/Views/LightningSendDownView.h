//
//  LightningSendDownView.h
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol didLightningSendDownViewCommitDelegate <NSObject>
@optional
- (void)didLightningSendDownViewCommit;
@end
@interface LightningSendDownView : UIView
@property(weak,nonatomic) id<didLightningSendDownViewCommitDelegate>delegate;
@end
