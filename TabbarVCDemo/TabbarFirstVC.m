//
//  TabbarFirstVC.m
//  TabbarVCDemo
//
//  Created by 党玉华 on 2018/12/8.
//  Copyright © 2019 Person. All rights reserved.
//

#import "TabbarFirstVC.h"
#import "BaseNavigationController.h"
#import "FirstVC.h"
#import "SecondVC.h"

@interface TabbarFirstVC ()

@end

@implementation TabbarFirstVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabbar];
}
-(void)setupTabbar{
    [UITabBar appearance].translucent = NO;//不透明
    // 去掉tab黑色分割线
    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.shadowImage = [[UIImage alloc]init];
    
    FirstVC *vc = [[FirstVC alloc]init];
    vc.isRightAllow = YES;
    BaseNavigationController *navClub = [[BaseNavigationController alloc] initWithRootViewController:vc];
    BaseNavigationController *navVideo = [[BaseNavigationController alloc] initWithRootViewController:[[SecondVC alloc]init]];
    
    [self addChildVC:navClub title:@"vc1" image:@"" selectedImage:@""];
    [self addChildVC:navVideo title:@"vc2" image:@"" selectedImage:@""];
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
