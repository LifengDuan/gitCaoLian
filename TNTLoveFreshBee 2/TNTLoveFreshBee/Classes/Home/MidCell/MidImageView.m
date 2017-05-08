//
//  MidImageView.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/15.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "MidImageView.h"
#import "BaseHomeModel.h"
//#import "m"

@implementation MidImageView
{
    NSArray *_pictArr;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

-(void)setupUI
{
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i < 2; i++)
    {
        UIImageView *image = [[UIImageView alloc] init];
        
        [self addSubview:image];
        [arrM addObject:image];
    }
    
    _pictArr = arrM.copy;
    
    [arrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [arrM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(0);
    }];
    
}

-(void)setModelArr:(NSArray *)modelArr
{
    _modelArr = modelArr;
    
    [modelArr enumerateObjectsUsingBlock:^(BaseHomeModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [_pictArr[idx] sd_setImageWithURL:[NSURL URLWithString:obj.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
        
    }];
}

@end
