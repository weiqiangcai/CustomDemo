//
//  NSObject+CHOIModel.m
//  彩票
//
//  Created by virgilChoi on 2018/2/6.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NSObject+CHOIModel.h"
#import <objc/runtime.h>
@implementation NSObject (CHOIModel)

+(instancetype)objcDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict{
    
    id objc = [[self alloc]init];
    
    // 遍历模型中的属性
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for (int i = 0; i< count; i++) {
        Ivar ivar = ivars[i];
        
        NSString *ivarName = @(ivar_getName(ivar));
        // 截取字符串，从第一个位置开始 eg: _ID ==>截取后就是 ID
        ivarName = [ivarName substringFromIndex:1];
        
        // 需要有外界通知内部，模型中属性名对应字典里面的key
        id value = dict[ivarName];
        if (value == nil) {
            if (mapDict) {
                
                NSString *key = mapDict[ivarName];
                value = mapDict[key];
            }
        }
        [objc setValue:value forKey:ivarName];
    }
    
    return  objc;
}
+(instancetype)objcDict1:(NSDictionary *)dict mapDict1:(NSDictionary *)mapDict{
    
    id objc = [[self alloc]init];
    
    // 遍历模型中的属性
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for (int i = 0; i< count; i++) {
        
        Ivar ivar = ivars[i];
        
        NSString *ivarName = @(ivar_getName(ivar));
        ivarName = [ivarName substringFromIndex:1];
        
        id value = dict[ivarName];
        if (value == nil) {
            if (mapDict) {
                NSString *key = mapDict[ivarName];
                value = mapDict[key];
            }
        }
        [objc setValue:value forKey:ivarName];
    }
    
    return objc;
}
@end
