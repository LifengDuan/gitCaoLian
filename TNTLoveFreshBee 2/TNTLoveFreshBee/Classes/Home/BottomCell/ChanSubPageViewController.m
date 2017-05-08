//
//  ChanSubPageViewController.m
//  TNTLoveFreshBee
//
//  Created by 张木锋 on 2016/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
// http://m.beequick.cn/show/active?city_id=2&location_hash=9e93e3AkRcDusYYRO1EaqN3I6CaPs7NOmX9l4MHzCZBdBwziO4U2uMqm1u&zchtid=12064&g_imei=867992028023869&location_time=1476448722&shopId=12064&__v=android5.8&g_ipAddress=192.168.2.3&androidnewwebview=true&id=20580&g_mac=683e342348e0&show_reload=1&g_screen_points=1080x1920&zchtauth=ce15f6n6h94FApM9BNZlHirzeVl5rC%252BOWYfkgCuHbyjlPArMk&hide_cart=0&__d=d14jyDobSxt2feIyrPUvSTms4Vv7Af8GkQthPlIYn%2F9IPZXr%2Bt86AJeF2SZpcPklB2kCA15RqhnlhSX%2BUNeEbR%2Fx3vuZn%2BmS2U83%2FfTwiTXbtdDpPFuVrMuM%2FhIr3VlKZ1zY&isGotoNative=0&trackid=category1%7C20580&cityid=2&GPS_LatLng=116.342721%2C40.064711&location=116.342721%2C40.064711&bigids=2%2C0&name=%E6%B0%B4%E6%9E%9C&g_platform=ANDROID&random=1109461137&activitygroup=xianguoshengyan&g_screen_pixels=1080x1920&delivery_type=0

#import "ChanSubPageViewController.h"
#import "Masonry.h"

@implementation ChanSubPageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //需要解析数据
    self.navigationItem.title = @"水果";
    [self setupUIChanSubPageView];
}

- (void)setupUIChanSubPageView {
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    [self.view addSubview:webView];
    
    webView.scalesPageToFit = YES;
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(2);
        make.right.offset(-2);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    NSURL *URL = [NSURL URLWithString:@"http://m.beequick.cn/show/active?city_id=2&location_hash=9e93e3AkRcDusYYRO1EaqN3I6CaPs7NOmX9l4MHzCZBdBwziO4U2uMqm1u&zchtid=12064&g_imei=867992028023869&location_time=1476448722&shopId=12064&__v=android5.8&g_ipAddress=192.168.2.3&androidnewwebview=true&id=20580&g_mac=683e342348e0&show_reload=1&g_screen_points=1080x1920&zchtauth=ce15f6n6h94FApM9BNZlHirzeVl5rC%252BOWYfkgCuHbyjlPArMk&hide_cart=0&__d=d14jyDobSxt2feIyrPUvSTms4Vv7Af8GkQthPlIYn%2F9IPZXr%2Bt86AJeF2SZpcPklB2kCA15RqhnlhSX%2BUNeEbR%2Fx3vuZn%2BmS2U83%2FfTwiTXbtdDpPFuVrMuM%2FhIr3VlKZ1zY&isGotoNative=0&trackid=category1%7C20580&cityid=2&GPS_LatLng=116.342721%2C40.064711&location=116.342721%2C40.064711&bigids=2%2C0&name=%E6%B0%B4%E6%9E%9C&g_platform=ANDROID&random=1109461137&activitygroup=xianguoshengyan&g_screen_pixels=1080x1920&delivery_type=0"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [webView loadRequest:request];
}

@end
