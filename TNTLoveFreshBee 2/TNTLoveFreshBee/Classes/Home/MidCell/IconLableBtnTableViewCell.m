//
//  IconLableBtnTableViewCell.m
//  CeShi_02
//
//  Created by 赵世得 on 2016/10/13.
//  Copyright © 2016年 Zh. All rights reserved.
//

#import "IconLableBtnTableViewCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "IconLabelView.h"
#import "BaseHomeModel.h"

@interface IconLableBtnTableViewCell ()
//存放图片的地址的数组
@property (nonatomic, strong) NSArray<NSString *> *imgArr;

//存放label的数组
//@property (nonatomic, weak) NSArray<NSString *> *labArr;
//@property (nonatomic, weak) NSString *addressImg;
//@property (nonatomic, weak) NSString *textLab;
@property (nonatomic, strong) NSArray<IconLabelView *> *viewArr;

@property (nonatomic, strong) NSArray *btnArr;

@end
@implementation IconLableBtnTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setUI{
    
    NSMutableArray<IconLabelView *> *viewArrM = [NSMutableArray array];
    
    
    for (NSInteger i = 0; i < 4; i ++)
    {
        IconLabelView *buttonView = [[IconLabelView alloc] init];

//        buttonView.model = self.btnArr[i];
        
        [self.contentView addSubview:buttonView];
        buttonView.tag = i + 100;
        buttonView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
        
        [buttonView addGestureRecognizer:tap];
        [viewArrM addObject:buttonView];
        
    }
    [viewArrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [viewArrM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.contentView);
    }];
    self.viewArr = viewArrM.copy;
}

- (void)clickAction
{
    if (self.click != nil) {
        self.click(self.tag);
    }
}

-(void)setModel:(NSArray *)model
{
    _model = model;
    [self.viewArr enumerateObjectsUsingBlock:^(IconLabelView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        obj.model = model[idx];
    }];
    self.btnArr = model;
}



@end
