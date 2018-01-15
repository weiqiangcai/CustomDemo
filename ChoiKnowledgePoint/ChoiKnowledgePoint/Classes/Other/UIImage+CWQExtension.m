//
//  UIImage+CWQExtension.m
//  Knowledgepoints
//
//  Created by cai on 17/8/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIImage+CWQExtension.h"

@implementation UIImage (CWQExtension)

-(UIImage *)circleImage{
    
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 将图片画上去
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
