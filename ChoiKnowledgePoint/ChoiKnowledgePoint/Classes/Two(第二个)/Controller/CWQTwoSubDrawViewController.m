//
//  CWQTwoSubDrawViewController.m
//  Knowledgepoints
//
//  Created by cai on 17/7/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQTwoSubDrawViewController.h"
#import "CWQLineView.h"
@interface CWQTwoSubDrawViewController ()

@property(nonatomic,strong)CWQLineView *lineView;

@property(nonatomic,strong)UIScrollView *scrollView;


@end

@implementation CWQTwoSubDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = CWQGlobalBg;
    
    _lineView = [[CWQLineView alloc]init];
    _lineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_lineView];// 高50
    
    _lineView.sd_layout.topSpaceToView(self.view,70).leftSpaceToView(self.view,15).rightSpaceToView(self.view,15).heightIs(350);
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
