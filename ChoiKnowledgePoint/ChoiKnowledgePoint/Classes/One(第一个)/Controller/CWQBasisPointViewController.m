//
//  CWQBasisPointViewController.m
//  Knowledgepoints
//
//  Created by cai on 17/6/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

/*
 1.数组中的元素完全倒叙 ( reverse背面；相反)
 
 
 */
#import "CWQBasisPointViewController.h"

@interface CWQBasisPointViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

/** 数据源 */
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation CWQBasisPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupView];
}
-(void)setupView{
    
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
}
#pragma mark --<UITableViewDelegate>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        // 1. 数组中的元素完全倒叙
        [self resverArray];
        
    } else if (indexPath.row == 1){
        
        // 2.字符串
        [self knowledgePointString];
    }
    
}
#pragma mark --懒加载
-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
-(NSMutableArray *)dataSource{
    
    if (!_dataSource ) {
        
        _dataSource = [NSMutableArray arrayWithArray:@[
                                                       @"1.数组中的元素完全倒叙",
                                                       @"字符串",
                                                       @"结构体",
                                                       ]];
    }
    return _dataSource;
}
#pragma mark --3.结构体
-(void)structDemo{
    
    //   自定义的结构体
    struct Test {
        int ID;
        CGFloat  height;
        __unsafe_unretained NSArray *group;
    };
    typedef struct Test Test;
    
    //    封装数据
    Test tmpTest;
    tmpTest.height = 80.0;
    tmpTest.ID = 100;
    tmpTest.group = @[@"你猜我是谁",
                      @"你就是猜不着"];
    //    NSLog(@"id==%d,height==%f",tmpTest.ID,tmpTest.height);
    
    NSValue *customValue = [NSValue valueWithBytes:&tmpTest objCType:@encode(struct Test)];
    //    取出数据
    Test tmpTest1;
    [customValue getValue:&tmpTest1];
    NSLog(@"id==%d,height==%f,group==%@",tmpTest1.ID,tmpTest1.height,tmpTest1.group);
    
    
}

#pragma mark --1.数组中的元素完全倒叙
/**
 * 1.数组中的元素完全倒叙
 */
-(void)resverArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
    NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
    
    CSLog(@"reversedArray----%@",reversedArray);
}
#pragma mark --2.字符串
-(void)knowledgePointString{
    
    // 把c的字符串转化为oc的字符串
    NSString *str = [NSString stringWithUTF8String:"hello world"];
    
    CSLog(@"str--%@",str);
    
    NSString *str1 = @"hello";
    const char *p = [str1 UTF8String]; // 将OC的字符串转化为C的字符串
    
    // 结构体点转换字符串
//    NSString *str2 = NSStringFromCGPoint(point);
    
    // 3 字符串大小的转换 uppercase 大写
    NSString *str3_1 = [@"abc" uppercaseString];
    CSLog(@"%@",str3_1); // ABC
   
     NSString *str3_2 = [@"BCD" lowercaseString];
 
    NSString *str3_3 = @"12366";
    NSString *str3_4 = @"22367";
    NSComparisonResult  result1 = [str3_3 caseInsensitiveCompare:str3_4];
    // 两个字符串内容比较
    // NSComparisonResult result = {NSOrderedAscending, NSOrderedSame，NSOrderedDescending}
    // NSOrderedAscending    右边 > 左边  == -1
    // NSOrderedSame         内容相同     ==  0
    // NSOrderedDescending   左边 > 右边  ==  1

    
    CSLog(@"result1--  %ld",(long)result1); // ABC

}




@end
