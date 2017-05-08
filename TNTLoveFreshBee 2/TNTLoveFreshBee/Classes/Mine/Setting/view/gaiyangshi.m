//
//  gaiyangshi.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "gaiyangshi.h"

@implementation gaiyangshi
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        [self setupUI];
        
    }

    return self;
}
-(void)setupUI{

    UILabel *lableLfet = [[UILabel alloc]init];
    [self.contentView addSubview:lableLfet];
    [lableLfet mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    UIImageView *ima = [[UIImageView alloc]init];
    [self.contentView addSubview:ima];
    [ima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
//        make.left.equalTo(self.contentView.mas_right).offset(30);
        make.height.width.mas_equalTo(7);
    }];
    UILabel *lableright = [[UILabel alloc]init];
    [self.contentView addSubview:lableright];
    [lableright mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.center.equalTo(self.contentView);
//        make.left.equalTo(self.contentView.mas_left).offset(100);
//        make.right.equalTo(self.contentView.mas_right).offset(-100);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
//         make.top.equalTo(self.contentView.mas_top).offset(10);
        
        
    }];
    
    _leftText = lableLfet;
    _image = ima;
    _centerText = lableright;
}
-(void)setName:(NSString *)name{

    _name = name;

    _image.image = [UIImage imageNamed:name];
}
-(void)setLb:(NSString *)lb{

    _lb = lb;
    _leftText.text = lb;

}
-(void)setCenterlb:(NSString *)centerlb{

    _centerlb = centerlb;

    _centerText.text = centerlb;

}
//
//-(void)setImage:(UIImageView *)image{
//
//    _image = image;
//    
//    
//}
@end
