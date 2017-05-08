//
//  NewshopCell.m
//  shouCangShop
//
//  Created by Book on 16/10/15.
//  Copyright © 2016年 qau. All rights reserved.
//

#import "NewshopCell.h"
#import "Masonry.h"
@interface NewshopCell ()


@property(nonatomic,weak)UILabel *labname;
@property(nonatomic,weak)UILabel *labtime;
@property(nonatomic,weak)UILabel *labaddress;
@property(nonatomic,weak)UILabel *labdistance;
@property(nonatomic,weak)UIButton *bt;
@end

@implementation NewshopCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
        
    }
    return self;
}

-(void)setupUI{
    
    UILabel *labname = [[UILabel alloc]init];
    labname.font = [UIFont systemFontOfSize:15];
    labname.textColor = [UIColor blackColor];
    [self.contentView addSubview:labname];
    [labname mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(25);
    }];
    
    
    UILabel *labtime = [[UILabel alloc]init];
    labtime.font = [UIFont systemFontOfSize:9];
    labtime.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:labtime];
    [labtime mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(labname.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
    }];
    
    
    
    UILabel *labaddress = [[UILabel alloc]init];
    labaddress.font = [UIFont systemFontOfSize:9];
    labaddress.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:labaddress];
    [labaddress mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(labtime.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
    }];
    
    
    UILabel *labdistance = [[UILabel alloc]init];
    labdistance.font = [UIFont systemFontOfSize:9];
    labdistance.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:labdistance];
    [labdistance mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.top.equalTo(self.contentView.mas_top).offset(35);
    }];

    UIButton *bt = [[UIButton alloc]init];
    [self.contentView addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.top.equalTo(labdistance.mas_bottom).offset(10);
        
    }];
    [bt addTarget:self action:@selector(btnClik:) forControlEvents:UIControlEventTouchUpInside];

    
    
    _labname = labname;
    _labtime = labtime;
    _labaddress = labaddress;
    _labdistance = labdistance;
    _bt = bt;
    
}



-(void)setMode:(model *)mode{
    
    _mode = mode;
    _labname.text = mode.name;
    _labtime .text = mode.time;
    _labaddress.text = mode.address;
    _labdistance.text = [NSString stringWithFormat:@"%@m",mode.distance.description];
    
//    _labdistance.text = [NSString stringWithFormat:@"%@",mode.distance];
    
    if (mode.select) {
        _bt.titleLabel.text = @"+收藏";
        [_bt setImage:[UIImage imageNamed:@"012"] forState:UIControlStateNormal];
        [_bt setImage:[UIImage imageNamed:@"012"] forState:UIControlStateHighlighted ];
        
    }else{
        _bt.titleLabel.text = @"已收藏";
       [_bt setImage:[UIImage imageNamed:@"013"] forState:UIControlStateNormal];
       [_bt setImage:[UIImage imageNamed:@"013"] forState:UIControlStateHighlighted ];
    }
    
}


-(void)btnClik:(UIButton *)sender{

    _mode.select = !_mode.select;
    if ([self.delegate respondsToSelector:@selector(newshopCell:andWith:)]) {
        [self.delegate newshopCell:self andWith:_mode ];
    }

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
