//
//  CWQHomeSubOneViewController.m
//  Knowledgepoints
//
//  Created by cai on 17/6/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

/**
 - yyy --代表 年（2017）
 - MM --代表 月 （06）
 - dd  -- 代表 日 （16）
 - HH --代表 时 (13)
 - mm --代表 分 （22）
 - ss --  代表秒 （14）
 - yyy-MM-dd HH:mm:ss   -----> 2017-06-16 13:22:14
 */

/*
 1. NSString转NSDate
 2. NSDate转NSString

 */

#import "CWQHomeSubOneViewController.h"

@interface CWQHomeSubOneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *oneLB;
@property (weak, nonatomic) IBOutlet UILabel *twoLB;
@property (weak, nonatomic) IBOutlet UILabel *threeLb;

/** button */
@property(nonatomic,strong)UIButton *myButton;

@end

@implementation CWQHomeSubOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.view.backgroundColor = CWQGlobalBg;
 
    self.oneLB.text = [self getCurrentTime];
    
    self.twoLB.text = [self getCurrentTimestamp];
    
    NSString *currentStamp = [self getCurrentTimestamp];

    self.threeLb.text =  [self SetTime:currentStamp];
    
    
//    [self addtime];
#pragma mark -- 初始化button方法
    [self initializeButton];
}


/**
 * NSString转NSDate
 */
-(NSDate *)stringToDateWithDateString:(NSString *)DateString{
    
    // 需要转换的字符串
    NSString *dateString = @"2017-06-30 11:35:20";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [formatter dateFromString:dateString];
    
    NSLog(@"date------%@",date);
    
    return  date;
    
}


/**
 *NSDate转NSString
 *
 */
+ (NSString *)stringFromDate:(NSDate *)date
{
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //输出currentDateString
    NSLog(@"%@",currentDateString);
    return currentDateString;
}
/**
 * 获取当前系统时间
 
 @return 字符串
 */
-(NSString*)getCurrentTime {
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyy-MM-dd HH:mm:ss"];
    
    NSString*dateTime = [formatter stringFromDate:[NSDate date]];
    
    NSLog(@"当前时间是===%@",dateTime);
    // 当前时间是===2017-06-16 13:22:14
    
    return dateTime;
    
}




/**
 * 当前时间戳

 @return <#return value description#>
 */
-(NSString*)getCurrentTimestamp{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    return timeString;
    
}

/**
 * 把时间戳转化为时间

 @param time 时间
 @return string
 */
-(NSString*)SetTime:(NSString*)time{
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyy-MM-dd HH:mm:ss"];
    
    int timeval = [time intValue];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeval];
    
    // NSLog(@"1296035591  = %@",confromTimesp);
    
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
}

-(void)time{
    
    // 1、获取当前时间
    NSDate *now = [NSDate date];
    NSDateFormatter *nowFormate = [[NSDateFormatter alloc] init];
    nowFormate.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *nowTime = [nowFormate stringFromDate:now];
    NSLog(@"nowTime = %@",nowTime);
    
    // 2、拿现在的时间和过去时间或者将来时间对比，计算出相差多少天，多少年，多少秒等等；
    NSDate *beforTime = [nowFormate dateFromString:@"2014-06-14 19:25:00"];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //世纪
    NSInteger era  = kCFCalendarUnitEra;
    
    //年
    NSInteger year = kCFCalendarUnitYear;
    
    //月
    NSInteger month = kCFCalendarUnitMonth;
    
    //小时
    NSInteger hour = kCFCalendarUnitHour;
    
    //分钟
    NSInteger minute = kCFCalendarUnitMinute;
    
    //秒
    NSInteger second = kCFCalendarUnitSecond;
    
    NSDateComponents *compsEra = [calender components:era fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsYear = [calender components:year fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsMonth = [calender components:month fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsHour = [calender components:hour fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsMinute = [calender components:minute fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsSecond = [calender components:second fromDate:beforTime toDate:now options:0];
    
    NSLog(@"相差世纪个数 = %ld",[compsEra era]);
    NSLog(@"相差年个数 = %ld",[compsYear year]);
    NSLog(@"相差月个数 = %ld",[compsMonth month]);
    NSLog(@"相差小时个数 = %ld",[compsHour hour]);
    NSLog(@"相差分钟个数 = %ld",[compsMinute minute]);
    NSLog(@"相差秒个数 = %ld",[compsSecond second]);
    
    // 3、获取时间戳（相对于1970年）
    CGFloat timestamp = now.timeIntervalSince1970;
    NSLog(@"距离1970年有多少秒 = %f",timestamp);
    
    // 4、计算距离现在有多少秒
    CGFloat sinceNow = beforTime.timeIntervalSinceNow;
    NSLog(@"距离现在有多少秒 = %f",fabs(sinceNow));
    
}


/**
 * 在当前时间加上一个半小时：
 */
-(void)addtime{
    
    
    
//    NSDate *today = [[NSDate alloc] init];
    
    
    NSDate *today = [self stringToDateWithDateString:@"2017-06-30 11:57:57"];
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    
    
//    [offsetComponents setHour:1];
//    
//    [offsetComponents setMinute:30];
    
//    [offsetComponents setMonth:1];
    
    [offsetComponents setYear:1];
    
    // Calculate when, according to Tom Lehrer, World War III will end
    
    NSDate *endOfWorldWar3 = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSString *time = [formatter stringFromDate:endOfWorldWar3];

    

}
#pragma mark -- button 布局

-(void)initializeButton{
    
    [self.view addSubview:self.myButton];
  
   
    self.myButton.sd_layout.topSpaceToView(self.view,200).leftSpaceToView(self.view,10).widthIs(100).heightIs(40);
    
    [self.myButton setTitleEdgeInsets:UIEdgeInsetsMake(0,-self.myButton.imageView.size.width, 0, self.myButton.imageView.size.width)];
    
    [self.myButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.myButton.titleLabel.bounds.size.width, 0, -self.myButton.titleLabel.bounds.size.width)];
    
//    [self.myButton setTitleEdgeInsets:UIEdgeInsetsMake(0,-self.myButton.imageView.size.width, 0, self.myButton.imageView.size.width)];
// 02 向左40
//    [self.myButton setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
// 03 向右40
//    [self.myButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 40)];
    //
//     [self.myButton setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
}


#pragma mark --懒加载
-(UIButton *)myButton{
    
    if (!_myButton ) {
        
        _myButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_myButton setTitle:@"密码" forState:UIControlStateNormal];
        [_myButton setImage:[UIImage imageNamed:@"remberPassword"] forState:UIControlStateNormal];
        _myButton.backgroundColor =[UIColor orangeColor];
        
    }
    return _myButton;
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
