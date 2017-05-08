//
//  goodsDetailViewController.m
//  TNTLoveFreshBee
//
//  Created by 张木锋 on 2016/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//http://m.beequick.cn/show/productDetail?city_id=2&dealer_id=12140&location_hash=9c9f26RjdvbOus8%2FU62hHezdKN2s4%2FVEX0q79AnQOb8d65U6we9zwsgN%2Ft&zchtid=12140&g_imei=867992028023869&location_time=1476455740&shopId=12140&__v=android5.8&g_ipAddress=192.168.31.125&androidnewwebview=true&GPS_LatLng=116.342036%2C40.061602&location=116.342036%2C40.061602&bigids=2%2C0&id=115903&g_platform=ANDROID&g_mac=683e342348e0&disabled=1&random=-979798904&g_screen_pixels=1080x1920&g_screen_points=1080x1920&delivery_type=0&zchtauth=ce15f6n6h94FApM9BNZlHirzeVl5rC%252BOWYfkgCuHbyjlPArMk&__d=d14jyDobSxt2feIyrPUvSTms4Vv7Af8GkQthPlIYn%2F9IPZXr%2Bt86AJeF2SZpcPklB2kCA15RqhnlhSX8UdKHa0iij6uYnrjG20wzrPT%2B2TSAsY7lOAOYpsfa%2FhJx3VAXZ1zY

#import "GoodsDetailViewController.h"

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //需要解析数据
    self.navigationItem.title = @"水果";
    
    [self setupGoodsDetailView];
}
- (void)setupGoodsDetailView {
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    webView.scalesPageToFit = YES;
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(2);
        make.right.offset(-2);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    NSURL *URL = [NSURL URLWithString:@"http://m.beequick.cn/show/productDetail?city_id=2&dealer_id=12140&location_hash=9c9f26RjdvbOus8%2FU62hHezdKN2s4%2FVEX0q79AnQOb8d65U6we9zwsgN%2Ft&zchtid=12140&g_imei=867992028023869&location_time=1476455740&shopId=12140&__v=android5.8&g_ipAddress=192.168.31.125&androidnewwebview=true&GPS_LatLng=116.342036%2C40.061602&location=116.342036%2C40.061602&bigids=2%2C0&id=115903&g_platform=ANDROID&g_mac=683e342348e0&disabled=1&random=-979798904&g_screen_pixels=1080x1920&g_screen_points=1080x1920&delivery_type=0&zchtauth=ce15f6n6h94FApM9BNZlHirzeVl5rC%252BOWYfkgCuHbyjlPArMk&__d=d14jyDobSxt2feIyrPUvSTms4Vv7Af8GkQthPlIYn%2F9IPZXr%2Bt86AJeF2SZpcPklB2kCA15RqhnlhSX8UdKHa0iij6uYnrjG20wzrPT%2B2TSAsY7lOAOYpsfa%2FhJx3VAXZ1zY"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [webView loadRequest:request];
    
}
@end
