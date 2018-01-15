//
//  CWQMenuViewController.m
//  Knowledgepoints
//
//  Created by cai on 17/8/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQMenuViewController.h"
#import "CWQMenuLb.h"

@interface CWQMenuViewController ()
@property (weak, nonatomic) IBOutlet CWQMenuLb *menuLb;

@end

@implementation CWQMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    // 这里的是自定义
//     [self.menuLb addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
    
}
-(void)labelClick{
    
    [self.menuLb becomeFirstResponder];
    
    // 2.下回menuControllerview
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    UIMenuItem *ding = [[UIMenuItem alloc]initWithTitle:@"顶" action:@selector(ding:)];
    UIMenuItem *repay = [[UIMenuItem alloc]initWithTitle:@"回复" action:@selector(repay:)];
     UIMenuItem *report = [[UIMenuItem alloc]initWithTitle:@"举报" action:@selector(report:)];
    
    menu.menuItems = @[ding,repay,report];
    
    [menu setTargetRect:self.menuLb.bounds inView:self.menuLb];
    [menu setMenuVisible:YES animated:YES];
    
    
}
- (void)ding:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__ , menu);
}

- (void)repay:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__ , menu);
}

- (void)report:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__ , menu);
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
