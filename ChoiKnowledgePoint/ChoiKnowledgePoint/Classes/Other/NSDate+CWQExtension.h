//
//  NSDate+CWQExtension.h
//  Knowledgepoints
//
//  Created by cai on 17/7/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CWQExtension)


/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;

/*

 - (NSString *)create_time
 {
 // 日期格式化类
 NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
 // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
 fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
 // 帖子的创建时间
 NSDate *create = [fmt dateFromString:_create_time];
 
 if (create.isThisYear) { // 今年
 if (create.isToday) { // 今天
 NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
 
 if (cmps.hour >= 1) { // 时间差距 >= 1小时
 return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
 } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
 return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
 } else { // 1分钟 > 时间差距
 return @"刚刚";
 }
 } else if (create.isYesterday) { // 昨天
 fmt.dateFormat = @"昨天 HH:mm:ss";
 return [fmt stringFromDate:create];
 } else { // 其他
 fmt.dateFormat = @"MM-dd HH:mm:ss";
 return [fmt stringFromDate:create];
 }
 } else { // 非今年
 return _create_time;
 }
 }
 
*/

@end
