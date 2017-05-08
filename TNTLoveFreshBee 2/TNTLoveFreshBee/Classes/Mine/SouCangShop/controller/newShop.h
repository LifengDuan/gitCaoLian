//
//  newShop.h
//  shouCangShop
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 qau. All rights reserved.
//

#import <UIKit/UIKit.h>
@class newShop;

@protocol newShopDelegate <NSObject>

-(void)newShop:(newShop *)news andWith:(NSArray *) modele;

@end

@interface newShop : UITableViewController
@property (nonatomic,copy) void (^myBlock)(NSArray*);
@property(nonatomic,strong)NSArray *arrmodel;

@property(nonatomic,weak)id<newShopDelegate> delegate;
@end
