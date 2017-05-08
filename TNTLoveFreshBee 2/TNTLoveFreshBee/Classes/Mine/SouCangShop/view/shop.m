//
//  shop.m
//  shouCangShop
//
//  Created by Book on 16/10/15.
//  Copyright © 2016年 qau. All rights reserved.
//

#import "shop.h"
#import "Masonry.h"

@interface shop ()
@property(nonatomic,weak)UILabel *labname;
@property(nonatomic,weak)UILabel *labtime;
@property(nonatomic,weak)UILabel *labaddress;

@end

@implementation shop

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
    
    _labname = labname;
    _labtime = labtime;
    _labaddress = labaddress;
    
}



-(void)setMode:(model *)mode{
    
    _mode = mode;
    _labname.text = mode.name;
    _labtime .text = mode.time;
    _labaddress.text = mode.address;
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
