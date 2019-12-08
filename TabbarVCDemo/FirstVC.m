//
//  FirstVC.m
//  TabbarVCDemo
//
//  Created by 党玉华 on 2018/12/8.
//  Copyright © 2019 Person. All rights reserved.
//

#import "FirstVC.h"
#import "TabbarSecondVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isRightAllow) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"跳转" style:0 target:self action:@selector(ddd)];
    }
    if (self.isLeftAllow) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:0 target:self action:@selector(ggg)];
    }
}
-(void)ddd{
    TabbarSecondVC *vc = [[TabbarSecondVC alloc] init];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)ggg{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ggg" object:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
