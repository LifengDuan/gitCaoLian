//
//  DetailHomeModel.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "DetailHomeModel.h"

@implementation DetailHomeModel

+(instancetype)detailWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"img"])
    {
        NSString *str = value;
        if ([str containsString:@"@"])
        {
            NSRange range = [str rangeOfString:@"@"];
            NSString *newStr = [str substringToIndex:range.location];
            [super setValue:newStr forKey:key];
        }
    }
}
@end
