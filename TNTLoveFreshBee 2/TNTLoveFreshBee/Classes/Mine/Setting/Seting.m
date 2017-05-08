//
//  Seting.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "Seting.h"
#import "gaiyangshi.h"
#import "aboutWe.h"

@interface Seting ()

@end

@implementation Seting


-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    UIView *ui = [[UIView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-49 , [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    ui.backgroundColor = [UIColor redColor];
    [self.view addSubview:ui];
}
//改组的样式
-(instancetype)initWithStyle:(UITableViewStyle)style{

    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
//        UIView *ui = [UIView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
      self.navigationItem.title = @"设置";
//        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -59, 0);
//    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView registerClass:[gaiyangshi class] forCellReuseIdentifier:@"cell"];
//    设置自己的返回箭头
    UIImage *backButtonImage = [[UIImage imageNamed:@"v2_goback"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //解决箭头后面的文字
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:[[UIImage alloc]init]style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;
}



// 加载数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 3;
    }else{
    
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    gaiyangshi *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0:
      cell.lb = @"分享给朋友";
      cell.name = @"icon_go";
        return cell;
        
        case 1:
       cell.lb = @"关于我们";
       cell.name = @"icon_go";
       return cell;
        case 2:
                
        cell.lb = @"清理缓存";
        return cell;
         
        }
    }
    cell.centerlb = @"退出当前账号";
    
    return cell;
}
//
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0&&indexPath.row == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"分享" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [self presentViewController:alert animated:YES completion:nil];
        [alert addAction:[UIAlertAction actionWithTitle:@"朋友圈" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"111");
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"333");
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"QQ空间" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"333");
            
        }]];
        
    }else if(indexPath.section == 0&&indexPath.row == 1){
        
    
        aboutWe *vc = [[aboutWe alloc]init];

        [self.navigationController pushViewController:vc animated:YES];
    
    }else if (indexPath.section == 0&&indexPath.row == 2){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"数据已经清空" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"111");
        }]];
    
    }else{
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"退出成功" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"111");}]];
        
    }
    

}
@end
