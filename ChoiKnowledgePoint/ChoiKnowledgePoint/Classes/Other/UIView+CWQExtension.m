//
//  UIView+CWQExtension.m
//  Knowledgepoints
//
//  Created by cai on 17/6/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIView+CWQExtension.h"

@implementation UIView (CWQExtension)

-(void)setSize:(CGSize)size{
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size{
    
    return self.frame.size;
}
-(void)setWidth:(CGFloat)width{
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)width{
    
    return self.frame.size.width;
}
-(void)setHeight:(CGFloat)height{
    
    CGRect frame= self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height{
    
    return self.frame.size.height;
}
-(void)setX:(CGFloat)x{
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x{
    
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y{
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    
}
-(CGFloat)y{
    return self.frame.origin.y;
}

-(BOOL)isShowingOnKeyWindow{
    
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以窗口左上角为坐标原点，计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect windowsBounce = keyWindow.bounds;
    
    // 主窗口的bounds和 self的矩形框 是否有重叠
    BOOL insertsects = CGRectIntersectsRect(windowsBounce, newFrame);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && insertsects;
    
    
    
    
}
@end
