
//
//  CWQHomeController.m
//  Knowledgepoints
//
//  Created by cai on 17/6/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQHomeController.h"
#import "XMGInfiniteScrollView.h"
#import "CWQHomeSubOneViewController.h" // 时间类型
#import "CWQBasisPointViewController.h" // 基础知识
#import "CWQCollectionViewController.h"  // collectionView


@interface CWQHomeController ()<infiniteScrollViewDelete,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIScrollView *scrollView;

/** 轮播图 */
@property(nonatomic,strong)XMGInfiniteScrollView *infiniteScrollView;

@property(nonatomic,strong)UITableView *tableView;

/** 数组 */
@property(nonatomic,strong)NSArray* dataArray;

@end

@implementation CWQHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CWQGlobalBg;
    
    [self setupView];

    
}

-(void)setupView{
    
    [self.view addSubview:self.scrollView];
    self.scrollView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    // 轮播图
    [self.scrollView addSubview:self.infiniteScrollView];
    self.infiniteScrollView.sd_layout.topSpaceToView(self.scrollView,0).leftSpaceToView(self.scrollView,0).rightSpaceToView(self.scrollView,0).heightIs(150);
    
    // 添加tableview
    [self.scrollView addSubview:self.tableView];
    self.tableView.sd_layout.topSpaceToView(self.infiniteScrollView,0).leftSpaceToView(self.scrollView,0).rightSpaceToView(self.scrollView,0).bottomSpaceToView(self.scrollView,0);
    
    [self.scrollView setupAutoContentSizeWithBottomView:self.tableView bottomMargin:10];
    
}
#pragma mark ---<UITableViewDelegate>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID  = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        CWQHomeSubOneViewController *vc = [CWQHomeSubOneViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (indexPath.row == 1){
        
        CWQBasisPointViewController *vc = [[CWQBasisPointViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 2){
        
        CWQBasisPointViewController *vc = [[CWQBasisPointViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3){
        
        CWQCollectionViewController *vc = [[CWQCollectionViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        
       
    }
}
#pragma mark ---infiniteScrollViewDelete
-(void)clickImageTag:(NSInteger)tag{
    
    NSLog(@"tag is --%ld",(long)tag);
    
}
-(XMGInfiniteScrollView *)infiniteScrollView{
    
    if (!_infiniteScrollView) {
        
        _infiniteScrollView = [[XMGInfiniteScrollView alloc]init];
        _infiniteScrollView.delegate = self;
        // 本地图片
        _infiniteScrollView.images = @[
                                  [UIImage imageNamed:@"img_00"],
                                  [UIImage imageNamed:@"img_01"],
                                  [UIImage imageNamed:@"img_02"],
                                  [UIImage imageNamed:@"img_03"],
                                  [UIImage imageNamed:@"img_04"]
                                  ];
//        // 网络加载图片
        _infiniteScrollView.isWebImage = NO;
//        _infiniteScrollView.images = @[
//                                 @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
//                                 @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
//                                 @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
//                                 
//                                 ];
        
        // 两种方式加载pageController
//        _infiniteScrollView.currentColor = [UIColor orangeColor];
//        _infiniteScrollView.otherColor = [UIColor grayColor];
        
        _infiniteScrollView.currentImage = @"pageControlCurrentDot";
        _infiniteScrollView.otherImage = @"pageControlDot";
    }
    return _infiniteScrollView;
}
#pragma mark --懒加载
-(UIScrollView *)scrollView{
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}
-(NSArray *)dataArray{
    
    if (!_dataArray) {
        
        _dataArray = @[@"时间日期",@"基础语意",@"网易头条",@"collectionView"
                       ];
    }
    return _dataArray;
}
-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = CWQRGBColor(239, 239, 239);
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
    
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
