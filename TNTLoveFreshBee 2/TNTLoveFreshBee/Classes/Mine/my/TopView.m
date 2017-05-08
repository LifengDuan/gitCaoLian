//
//  TopView.m
//  我的订单
//
//  Created by 王朝阳 on 2016/10/15.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import "TopView.h"
#import "Masonry.h"
#import "CZAdditions.h"

@interface TopView ()

// 黄线视图
@property (nonatomic, weak) UIView *redColorL;

// 记录被选中的按钮
@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation TopView {

    // 数组,存放3个按钮的数组
    NSArray<UIButton *> *_btnsArr;

}

- (void)viewDidLoad {
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
      [self setupUI];
    }
    return self;
}
#pragma mark - categoryBtnClick:
// 点击分类按钮时调用
- (void)categoryBtnClick:(UIButton *)sender {
    
    
    
    NSLog(@"分类按钮被点了");
    // 1.获取按钮所在集合中的索引
    _pageNumber = [_btnsArr indexOfObject:sender];
    
    // 2.发送事件,让scrollView滚动!
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    // 3.让黄线动起来!
    self.offset_X = sender.bounds.size.width * _pageNumber;
    
    
    // 4.修改按钮状态!
    _selectedBtn.selected = NO;
    sender.selected = YES;
    _selectedBtn = sender;
    
}

#pragma mark - 重写偏移量的set方法,让黄线偏移
- (void)setOffset_X:(CGFloat)offset_X {
    
    _offset_X = offset_X;
    
    // MARK: - 1.更新黄线约束
    
    // 1.更新黄线的约束,中心的x值
    [_redColorL mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_btnsArr[0]).offset(offset_X);
        
    }];
    
    // 2.强制布局子控件
#warning - newMethod 需要通过动画修改布局时,给layoutIfNeed添加动画代码!
    [UIView animateWithDuration:.3 animations:^{
        
        [self layoutIfNeeded];
    }];
    
    // MARK: - 2.修改按钮的状态!
    // 1.计算通过偏移量得出对应的索引值
    NSInteger idx = offset_X / _btnsArr[0].bounds.size.width + 0.5;
    NSLog(@"%zd", idx); // 1 ~ 1.9   + 0.5  1.5
    
    // 2.修改按钮的状态
    // - 取消之前的
    _selectedBtn.selected = NO;
    // - 设置当前的
    _btnsArr[idx].selected = YES;
    // - 记录当前的
    _selectedBtn = _btnsArr[idx];
    
    
    
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    // MARK: - 1.添加3个按钮
    // 1.确定按钮标题
    NSArray<NSString *> *titlesArr = @[@"全部订单", @"待付款", @"待收货", @"待评价"];
    
    // 2.遍历创建按钮
    [titlesArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 2.1 创建按钮
        UIButton *btn = [UIButton cz_textButton:obj fontSize:14 normalColor:[UIColor cz_colorWithHex:0x555555] selectedColor:[UIColor cz_colorWithHex:0x000000]];
        
        // 2.2 添加按钮监听事件
        [btn addTarget:self action:@selector(categoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 2.3 如果是第0个按钮,设置个初始选中状态,记得赋值!
        if (idx == 0) {
            btn.selected = YES;
            _selectedBtn = btn;
        }
        
        
        [self addSubview:btn];
        
    }];
    
    // 3.布局按钮的约束
    [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(self);
        
    }];
    
    // 4.赋值,记录3个按钮
    _btnsArr = self.subviews;
    
    // MARK: - 2.添加黄色的线条
    // 1.创建视图 黄色线
    UIView *redColorL = [[UIView alloc] init];
    redColorL.backgroundColor = [UIColor redColor];
    
    [self addSubview:redColorL];
    
    [redColorL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.bottom.equalTo(_btnsArr[0]);
        make.height.mas_equalTo(4);
        make.centerX.equalTo(_btnsArr[0]);
        
    }];
    
    // 2.记录成员变量
    _redColorL = redColorL;
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
