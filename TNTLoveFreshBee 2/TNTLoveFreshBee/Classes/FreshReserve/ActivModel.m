//
//  ActivModel.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "ActivModel.h"
#import "DetailHomeModel.h"

@implementation ActivModel

+(instancetype)activeModelWith:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"goods"])
    {
        NSArray *dictArr = value;
        NSMutableArray *arrM = [NSMutableArray array];
        [dictArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DetailHomeModel *model = [DetailHomeModel detailWithDict:obj];
            [arrM addObject:model];
        }];
        [super setValue:arrM.copy forKey:key];
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
