//
//  MineFeedBackOnlineController.m
//  SubOthersDetail
//
//  Created by 张木锋 on 2016/10/16.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "MineFeedBackOnlineController.h"
#import "Masonry.h"

@implementation MineFeedBackOnlineController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"在线客服";
  
    [self setupWebViewUI];
}

- (void)setupWebViewUI {
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    webView.scalesPageToFit = YES;
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
    
    NSURL *URL = [NSURL URLWithString:@"http://www.sobot.com/chat/pc/index.html?sysNum=b30965e4b4114126a6a202aafce04fc5&partnerId=18867527099&tel=18867527099"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [webView loadRequest:request];
    
}
@end
