//
//  MidFreshBtnCell.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "MidFreshBtnCell.h"
#import "Masonry.h"
#import "FreshBtnView.h"

#define MidFreshBtn_count 4

@interface MidFreshBtnCell ()
@property (nonatomic, strong) NSArray<FreshBtnView *> *btnArr;

@end

@implementation MidFreshBtnCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
// 设置Cell界面
- (void)setupUI
{
    // 循环添加四个按钮
    NSMutableArray<FreshBtnView *> *arrM = [NSMutableArray array];
    for (NSInteger i = 0; i < MidFreshBtn_count; i++)
    {
        FreshBtnView *btn = [[FreshBtnView alloc] init];
        [self addSubview:btn];
        [arrM addObject:btn];
    }
    self.btnArr = arrM.copy;
    
    // 水平布局
    [arrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [arrM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.contentView);
    }];
    
}

-(void)setBtnModel:(NSArray *)btnModel
{
    _btnModel = btnModel;
    [self.btnArr enumerateObjectsUsingBlock:^(FreshBtnView *obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         obj.model = btnModel[idx];
     }];
    self.btnArr = btnModel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
