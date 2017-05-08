//
//  LFBMView.h
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBMineModel.h"
@interface LFBMView : UIView

-(instancetype)initMenu:(NSArray <LFBMineModel *>*)mens WithLine:(BOOL)line andWith:(NSUInteger)DefaultRowNumbers;


@end
