//
//  ZCStatusBarHUD.h
//  ZCStatusBarHUD
//
//  Created by 周文春 on 16/7/6.
//  Copyright © 2016年 周文春. All rights reserved.
//  1.2.5 1.13.1 大版本号.功能更新版本号.BUG修复版本号



#import <UIKit/UIKit.h>

@interface ZCStatusBarHUD : NSObject
/**
 *  显示普通信息
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *  隐藏
 */
+ (void)hide;
@end
