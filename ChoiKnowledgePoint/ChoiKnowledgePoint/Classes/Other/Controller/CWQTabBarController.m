//
//  CWQTabBarController.m
//  Knowledgepoints
//
//  Created by cai on 17/6/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQTabBarController.h"
#import "CWQNavigationController.h"
#import "CWQHomeController.h"
#import "CWQTwoViewController.h"
#import "CWQThreeViewController.h"
#import "CWQFourViewController.h"
#import "CWQFiveViewController.h"

#import "CWQTabBar.h"

@interface CWQTabBarController ()

@end

@implementation CWQTabBarController

+(void)initialize{
    
    // 通过appearance统一设置所有UITabBarItem属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加子控制器
    [self setupChildVc:[CWQHomeController new] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVc:[[CWQTwoViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[CWQThreeViewController alloc] init] title:@"动画" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildVc:[[CWQFourViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    
    // 更换tabBar
    //    self.tabBar = [[XMGTabBar alloc] init];
//    [self setValue:[[CWQTabBar alloc] init] forKeyPath:@"tabBar"];
    
}


/**
 * 初始化自控制器
 */
-(void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    CWQNavigationController *nav = [[CWQNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
