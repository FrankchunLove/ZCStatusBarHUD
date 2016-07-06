//
//  ViewController.m
//  ZCStatusBarHUDExample
//
//  Created by 周文春 on 16/7/6.
//  Copyright © 2016年 Frank_chun. All rights reserved.
//

#import "ViewController.h"
#import "ZCStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)showMsg {

    
    [ZCStatusBarHUD showMessage:@"没有事情做的哦" image:nil];
}

- (IBAction)success {
    [ZCStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error {
    [ZCStatusBarHUD showError:@"加载失败"];
    
}
- (IBAction)loading {
    [ZCStatusBarHUD showLoading:@"加载中..."];
    
}

- (IBAction)hide {
    [ZCStatusBarHUD hide];
}

@end
