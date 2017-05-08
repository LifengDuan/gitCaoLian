//
//  LFBMView.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LFBMView.h"
#import "LFBMineModel.h"
#import "titleView.h"
@interface LFBMView ()
@property (nonatomic, strong) NSArray *mens;
@property (nonatomic, strong) titleView *titleIconView;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) NSInteger tag1;
@property (nonatomic, strong) NSMutableArray *arrm;
@end

@implementation LFBMView{
 NSInteger _DefaultRowNumbers ;
}
- (instancetype)initMenu:(NSArray <LFBMineModel *>*)mens WithLine:(BOOL)line andWith:(NSUInteger)DefaultRowNumbers{
    
    if (self = [super init]) {
        _DefaultRowNumbers = DefaultRowNumbers;
        
        _DefaultRowNumbers = _DefaultRowNumbers == 3 ?3:4;
        
        self.backgroundColor = [UIColor whiteColor];
        self.mens = mens;
        _arrm = [NSMutableArray array];
        for (LFBMineModel *title in mens) {
            titleView *titleIconView;
            if (DefaultRowNumbers == 3) {
                titleIconView = [[titleView alloc]initWithTitleLabel:title.title text:title.labtext boder:line];
                _titleIconView = titleIconView;
            }else{
                titleIconView = [[titleView alloc]initWithTitleLabel:title.title icon:title.icon boder:line];
//                titleIconView.backgroundColor = [UIColor redColor];
                _titleIconView = titleIconView;
            }

            titleIconView.tag = title.tag;
            _tag1 = title.tag;
            titleIconView.userInteractionEnabled = YES;
            [_arrm addObject:titleIconView];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleIconViewClick:)];
            [titleIconView addGestureRecognizer:tap];
            
            [self addSubview:titleIconView];
        }
    
    }
//    [self shado];
    return self;
}
-(void)clikBtn{


}

- (void)titleIconViewClick:(titleView *)sender{
    [_arrm enumerateObjectsUsingBlock:^(titleView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%zd",obj.tag);
        if (obj.tag == 4 ) {
            NSNotification *yue = [NSNotification notificationWithName:@"yue" object:nil];
            
            [[NSNotificationCenter defaultCenter] postNotification:yue];
        }

    }];
    if (_tag1 == 11) {
        NSNotification *me = [NSNotification notificationWithName:@"me" object:nil];
        
        [[NSNotificationCenter defaultCenter] postNotification:me];

    }

}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / _DefaultRowNumbers;
    if (self.mens.count % _DefaultRowNumbers) {
        CGFloat height = self.bounds.size.height / ((self.mens.count / _DefaultRowNumbers)+1);
        _height = height;
    }else{
    
        CGFloat height = self.bounds.size.height / (self.mens.count / _DefaultRowNumbers);
             _height = height;

    }
    
    for (int i = 0; i < self.subviews.count; ++i) {
        titleView *titleIconView = self.subviews[i];
        CGFloat viewX = (i % _DefaultRowNumbers) * width;
        CGFloat viewY = (i / _DefaultRowNumbers) * _height;
        titleIconView.frame = CGRectMake(viewX, viewY, width, _height);

    }
    

}


@end
