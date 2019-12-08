//
//  TabbarSecondVC.m
//  TabbarVCDemo
//
//  Created by 党玉华 on 2018/12/8.
//  Copyright © 2019 Person. All rights reserved.
//

#import "TabbarSecondVC.h"
#import "BaseNavigationController.h"
#import "FirstVC.h"
#import "SecondVC.h"

@interface TabbarSecondVC ()<UIGestureRecognizerDelegate>

@end

@implementation TabbarSecondVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
    
    [self setupTabbar];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sss) name:@"ggg" object:nil];
    
    //滑动手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)sss{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setupTabbar{
    [UITabBar appearance].translucent = NO;//不透明
    // 去掉tab黑色分割线
    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.shadowImage = [[UIImage alloc]init];
    
    FirstVC *vc = [[FirstVC alloc]init];
    vc.isLeftAllow = YES;
    BaseNavigationController *navClub = [[BaseNavigationController alloc] initWithRootViewController:vc];
    BaseNavigationController *navVideo = [[BaseNavigationController alloc] initWithRootViewController:[[SecondVC alloc]init]];
    
    [self addChildVC:navClub title:@"vc3" image:@"" selectedImage:@""];
    [self addChildVC:navVideo title:@"vc4" image:@"" selectedImage:@""];
}

-(void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self selectedTapTabBarItems:childVC.tabBarItem];
    [self unSelectedTapTabBarItems:childVC.tabBarItem];
    [self addChildViewController:childVC];
}
//tab字体颜色
-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName,[UIColor orangeColor],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
}
-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13], NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
}

@end
