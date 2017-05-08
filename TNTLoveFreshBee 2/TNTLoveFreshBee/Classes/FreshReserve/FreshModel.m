//
//  FreshModel.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FreshModel.h"
#import "BaseHomeModel.h"
#import "ActivModel.h"


@implementation FreshModel

+(instancetype)freshModelWith:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"more_activity"])
    {
        NSDictionary *dict = value;
        BaseHomeModel *model = [BaseHomeModel baseModelWithDict:dict];
        [super setValue:model forKey:key];
    }else if ([key isEqualToString:@"activ_detail"])
    {
        NSDictionary *dict = value;
        ActivModel *model = [ActivModel activeModelWith:dict];
        [super setValue:model forKey:key];
    }
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
