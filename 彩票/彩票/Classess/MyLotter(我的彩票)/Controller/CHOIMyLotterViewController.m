//
//  CHOIMyLotterViewController.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIMyLotterViewController.h"

#import "CHOISettingViewController.h"

@interface CHOIMyLotterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation CHOIMyLotterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     UIImage *image = _loginBtn.currentBackgroundImage;
    
     image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 注意按钮的图片只能通过代码去拉伸
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
    
    [self setUpNav];
    
}

- (void)setUpNav
{
    // 设置左右两边的按钮
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    
    // 自适应尺寸
    [btn sizeToFit];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 左边
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 右边
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOrigeRender:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(settting)];
    
}

- (void)settting
{
    NSLog(@"点击设置");
    // 跳转到我们的设置界面
    
    CHOISettingViewController *vc = [[CHOISettingViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
