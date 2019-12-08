//
//  BaseViewController.m
//  VideoAndLiveDemo
//
//  Created by 党玉华 on 2018/12/8.
//  Copyright © 2019 党玉华. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}
//设置视图滑动手势
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // rootViewController要关闭返回手势，否则有BUG
    if (self.navigationController.viewControllers.firstObject == self) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //被色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //状态栏文本颜色白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    //避免滚动视图顶部出现状态栏高度的空白以及push或者pop的时候页面有一个上移或者下移的异常动画的问题
    UITableView.appearance.estimatedRowHeight = 0;
    UITableView.appearance.estimatedSectionFooterHeight = 0;
    UITableView.appearance.estimatedSectionHeaderHeight = 0;
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //滑动手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)YHPushVC:(UIViewController *)vc{
    if (self.navigationController.viewControllers.firstObject != vc) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)YHPopVC{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)YHPopTheVC:(Class)aClass{
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:aClass]) {
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
}
-(void)YHPopToRootVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
