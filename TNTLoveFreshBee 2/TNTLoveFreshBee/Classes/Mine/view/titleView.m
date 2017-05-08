//
//  titleView.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "titleView.h"

@interface titleView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *icon;


@property (nonatomic, strong) UILabel *textlab;
@end

@implementation titleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self  = [super initWithFrame:frame]) {
    }
    return self ;
}

- (instancetype)initWithTitleLabel:(NSString *)titleLabel icon:(UIImage *)icon boder:(BOOL)boder{
    if (self = [super init]) {
        [self setupUI];
        self.userInteractionEnabled = YES;
        if (boder) {
            self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor grayColor]);
            self.layer.borderWidth = 1;
            
        }
        self.titleLabel.text = titleLabel;
        self.icon.image = icon;
        self.icon.userInteractionEnabled = YES;
    }
    return self;
}

-(instancetype)initWithTitleLabel:(NSString *)titleLabel text:(NSString *)lab boder:(BOOL)boder{
    if (self = [super init]) {
        [self setupUILab];
        self.userInteractionEnabled = YES;
        if (boder) {
            self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor grayColor]);
            self.layer.borderWidth = 1;
            
        }
        self.titleLabel.text = titleLabel;
        self.textlab.text = lab;


    }
        return self;
}

-(void)setupUI{
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_titleLabel];
    
    _icon = [[UIImageView alloc]init];
    _icon.contentMode = UIViewContentModeCenter;
    [self addSubview:_icon];
    _icon.userInteractionEnabled = YES;
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-5);;
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_icon.mas_bottom).offset(3);
        make.leading.trailing.equalTo(self);
        make.height.mas_equalTo(15);
    }];
    
}

-(void)setupUILab{
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_titleLabel];

    _textlab = [[UILabel alloc]init];
    _textlab.textAlignment = NSTextAlignmentCenter;
    _textlab.textColor = [UIColor blackColor];
    _textlab.font = [UIFont systemFontOfSize:15];
    [self addSubview:_textlab];
    [_textlab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(2);
        
    }];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textlab.mas_bottom).offset(12);
        make.leading.trailing.equalTo(self);
        make.height.mas_equalTo(15);
    }];


}
@end
