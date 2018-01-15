//
//  CWQName.m
//  ChoiKnowledgePoint
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQName.h"

@implementation CWQName

+(instancetype)initWithTitle:(NSString *)title{
    
    CWQName *name = [[self alloc]init];

    name.title = title;
    
    return name;
}


@end
