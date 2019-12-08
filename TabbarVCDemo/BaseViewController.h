//
//  BaseViewController.h
//  VideoAndLiveDemo
//
//  Created by 党玉华 on 2018/12/8.
//  Copyright © 2019 党玉华. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

-(void)YHPushVC:(UIViewController *)vc;
-(void)YHPopVC;
-(void)YHPopTheVC:(Class)aClass;
-(void)YHPopToRootVC;

@end

NS_ASSUME_NONNULL_END
