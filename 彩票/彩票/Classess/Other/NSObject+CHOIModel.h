//
//  NSObject+CHOIModel.h
//  彩票
//
//  Created by virgilChoi on 2018/2/6.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CHOIModel)

// 快速进行字典转模型
+(instancetype)objcDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
