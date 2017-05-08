//
//  MineQuestionController.m
//  SubOthersDetail
//
//  Created by 张木锋 on 2016/10/16.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "MineQuestionController.h"
#import "Masonry.h"
@implementation MineQuestionController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"常见问题";
    
    [self setupWebViewUI];
}

- (void)setupWebViewUI {
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    webView.scalesPageToFit = YES;
    
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
    
    NSURL *URL = [NSURL URLWithString:@"http://m.beequick.cn/show/webview/p/qa?city_id=2&location_hash=3b05d2ld1%2FQMqQ%2Bp1gprUg%2B6L04WqW9l3sxIUD9uYpmNuCFITOO%2BoK8sGo&zchtid=12140&g_imei=867992028023869&location_time=1476551591&shopId=12140&__v=android5.8&g_ipAddress=192.168.31.125&androidnewwebview=true&GPS_LatLng=116.342028%2C40.061596&location=116.342028%2C40.061596&bigids=2%2C0&g_platform=ANDROID&g_mac=683e342348e0&random=-983512227&g_screen_pixels=1080x1920&g_screen_points=1080x1920&delivery_type=0&zchtauth=ce15f6n6h94FApM9BNZlHirzeVl5rC%252BOWYfkgCuHbyjlPArMk&__d=d14jyDobSxt2feIyrPUvSTms4Vv7Af8GkQthPlIYn%2F9IPZXr%2Bt86AJeF2SZpcPklB2kCA15Rqhnlhyf%2BV9%2BBbhmni%2FjInL%2FF30U2%2B%2FT722PY5IK%2FP1vJp8zbpUZ52AoeZ1zY"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [webView loadRequest:request];
    
}
@end

