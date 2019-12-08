//
//  BaseNavigationController.m
//  VideoAndLiveDemo
//
//  Created by 党玉华 on 2018/12/8.
//  Copyright © 2019 党玉华. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBaseNav];
}

-(void)setupBaseNav{
    //去除导航栏黑线
    self.navigationBar.shadowImage = [[UIImage alloc]init];
    [self.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    //配置导航栏颜色
    self.navigationBar.backgroundColor = self.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
