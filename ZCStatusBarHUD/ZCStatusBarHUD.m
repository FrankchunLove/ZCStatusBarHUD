//
//  ZCStatusBarHUD.m
//  ZCStatusBarHUD
//
//  Created by 周文春 on 16/7/6.
//  Copyright © 2016年 周文春. All rights reserved.
//

#import "ZCStatusBarHUD.h"

#define ZCMessageFont [UIFont systemFontOfSize:12]
/** 消息停留时间 */
static CGFloat const ZCMessageDuration = 2.0;
/** 消息显示\隐藏动画时间 */
static CGFloat const ZCAnimationDuration = 0.25;
@implementation ZCStatusBarHUD

/** 全局的窗口 */
static UIWindow * window_;
/** 定时器 */
static NSTimer * timer_;

/**
 * 初始化窗口
 */
+ (void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, 20);

    //显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:ZCAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}
/**
 *  显示普通信息
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    
    //显示窗口
    [self showWindow];
    
    //添加按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = ZCMessageFont;
    
    if (image){
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    
    //定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZCMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];

}
/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}
/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZCStatusBarHUD.bundle/check"]];
}
/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZCStatusBarHUD.bundle/error"]];
}
/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    
    //添加文字
    UILabel * lable = [[UILabel alloc]init];
    lable.font = ZCMessageFont;
    lable.frame = window_.bounds;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = msg;
    lable.textColor = [UIColor whiteColor];
    [window_ addSubview:lable];
    
    
    //添加圈圈
    UIActivityIndicatorView * loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName: ZCMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];

}
/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:ZCAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}
@end
