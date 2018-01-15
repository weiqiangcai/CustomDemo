//
//  CWQThreeViewController.m
//  Knowledgepoints
//
//  Created by cai on 17/6/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQThreeViewController.h"
#import "CWQName.h"
#import "CWQTableViewHeaderView.h"
#import "CWQSection0ViewController.h"

@interface CWQThreeViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation CWQThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}
#pragma mark --<UITableViewDelegate>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary *dict = self.dataArray[section];
    NSArray *array = dict[@"key"];
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSDictionary *dict = self.dataArray[indexPath.section];
    NSArray *array = dict[@"key"];
    CWQName *name = array[indexPath.row];
    cell.textLabel.text = name.title;
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSDictionary *dict = self.dataArray[section];
    
    NSString *headerTitle = dict[@"title"];
    
    
    return headerTitle;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSDictionary *dict = self.dataArray[section];
    
    NSString *headerTitle = dict[@"title"];
    
    CWQTableViewHeaderView *headerView = [CWQTableViewHeaderView tableViewHeaderView];
    
    headerView.title = headerTitle;
    
    return headerView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) { // 第一组
        
        if (indexPath.row == 0) {
           
        } else if (indexPath.row == 1){
           
        }
        [self pushVC:indexPath.row];
    }else if (indexPath.section == 1){ // 第二组
        
    }
    
}

-(void)pushVC:(NSInteger )type{
    
    CWQSection0ViewController *vc = [[CWQSection0ViewController alloc]init];
    vc.type = type;
    [self.navigationController pushViewController:vc animated:YES];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
#pragma mark --懒加载
-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CWQScreenBounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(NSMutableArray *)dataArray{
    
    if (!_dataArray ) {
        
        CWQName *name1 = [CWQName initWithTitle:@"基本图形绘制"];
        CWQName *name2 = [CWQName initWithTitle:@"重绘-下载进度"];
        CWQName *name3 = [CWQName initWithTitle:@"画饼图"];
        CWQName *name4 = [CWQName initWithTitle:@"柱状图"];
        CWQName *name5 = [CWQName initWithTitle:@"绘制文字和图片"];
        CWQName *name6 = [CWQName initWithTitle:@"模仿UIImageView"];
        CWQName *name7 = [CWQName initWithTitle:@"雪花(定时器)"];
        CWQName *name8 = [CWQName initWithTitle:@"图形上下文状态栈"];
        CWQName *name9 = [CWQName initWithTitle:@"矩阵操作"];
        NSArray *array1 = [NSArray arrayWithObjects:name1,name2,name3,name4,name5,name6,name7,name8,name9, nil];
        
        NSDictionary *dict1 = @{@"title":@"Quartz2D",@"key":array1};
        NSDictionary *dict2 = @{@"title":@"Quartz2D演练",@"key":array1};
        NSDictionary *dict3 = @{@"title":@"核心动画",@"key":array1};
        _dataArray = [NSMutableArray arrayWithObjects:dict1,dict2,dict3, nil];
        
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
