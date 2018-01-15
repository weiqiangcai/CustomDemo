//
//  CWQSection0ViewController.m
//  ChoiKnowledgePoint
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQSection0ViewController.h"
#import "CWQRow0.h"
#import "CWQRow1.h"

@interface CWQSection0ViewController ()

@property(nonatomic,strong)CWQRow1 *row1;

@end

@implementation CWQSection0ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupView];
    
}

-(void)setupView{
    
    if (_type == 0) {
        [self animationRow0];
    } else if (_type == 1){
        [self animationRow1];
    }
}

/**
 * row1
 */
-(void)animationRow1{
    
    _row1 = [[CWQRow1 alloc]initWithFrame:CGRectMake(50, 64, 200, 200)];
    _row1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_row1];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 300, 200, 20)];
    slider.maximumValue =1.0;
    slider.minimumValue = 0.0;
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}
-(void)slider:(UISlider *)sender{
    
    NSLog(@"%f",sender.value);
    
    _row1.progress = sender.value;
    
}

-(void)animationRow0{
    
    CWQRow0 *row0 = [[CWQRow0 alloc]initWithFrame:CGRectMake(0, 64, CWQScreenW, CWQScreenH)];
    row0.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:row0];
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
