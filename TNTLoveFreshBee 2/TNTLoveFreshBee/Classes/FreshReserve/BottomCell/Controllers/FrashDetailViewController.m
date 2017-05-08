//
//  FrashDetailViewController.m
//  TNTLoveFreshBee
//
//  Created by 王朝阳 on 2016/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//
/*
 http://m.beequick.cn/show/active?city_id=2&location_hash=9e93e3AkRcDusYYRO1EaqN3I6CaPs7NOmX9l4MHzCZBdBwziO4U2uMqm1u&zchtid=12064&g_imei=867992028023869&location_time=1476448722&shopId=12064&__v=android5.8&g_ipAddress=192.168.2.3&androidnewwebview=true&id=20580&g_mac=683e342348e0&show_reload=1&g_screen_points=1080x1920&zchtauth=ce15f6n6h94FApM9BNZlHirzeVl5rC%252BOWYfkgCuHbyjlPArMk&hide_cart=0&__d=d14jyDobSxt2feIyrPUvSTms4Vv7Af8GkQthPlIYn%2F9IPZXr%2Bt86AJeF2SZpcPklB2kCA15RqhnlhSX%2BUNeEbR%2Fx3vuZn%2BmS2U83%2FfTwiTXbtdDpPFuVrMuM%2FhIr3VlKZ1zY&isGotoNative=0&trackid=category1%7C20580&cityid=2&GPS_LatLng=116.342721%2C40.064711&location=116.342721%2C40.064711&bigids=2%2C0&name=%E6%B0%B4%E6%9E%9C&g_platform=ANDROID&random=1109461137&activitygroup=xianguoshengyan&g_screen_pixels=1080x1920&delivery_type=0
 */
#import "FrashDetailViewController.h"

@interface FrashDetailViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation FrashDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置webView的代理
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:_webView];
    _webView.delegate = self;
    // 加载网页数据
    NSURL *URL = [NSURL URLWithString:@"http://m.beequick.cn/show/productDetail?city_id=2&dealer_id=10114&location_hash=f27a60yNKR5DCcIhZoUvaZSwJz8Fm%2BBidE9Ez2ZoE8DTa9jv4AmhKBpHdV&zchtid=12140&g_imei=862915032222511&location_time=1476588661&shopId=12140&__v=android5.8&g_ipAddress=192.168.2.10&androidnewwebview=true&GPS_LatLng=116.342675%2C40.064762&location=116.342675%2C40.064762&bigids=2%2C0&id=115878&g_platform=ANDROID&g_mac=8cebc6e30942&disabled=1&random=-1271015499&g_screen_pixels=1080x1812&g_screen_points=1080x1812&delivery_type=0&zchtauth=869902MMvJ0DHvd1gJhK1yAaNmS%252BTZ7Gq00wKtu9VD3aD%252BrTY&__d=d14jyDobSxt2K7Rk%2BqN5H2%2F4twnwAPdVxV41PVdNlqZGPZXr%2Bt86AJeF2SZpcPklB2kCA15Rqhnlhyb%2FUdeBZRjx3fyfzeqQ3kowrfT72mCA4oW%2FO16YqM%2BKpE4v3VoaZ17a"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [_webView loadRequest:request];
    
//    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
