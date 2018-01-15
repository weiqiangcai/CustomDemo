//
//  CWQRow0.m
//  ChoiKnowledgePoint
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQRow0.h"

@implementation CWQRow0

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 绘图的步骤1.获取上下文 2.创建路径（描述路径）3.把路径添加到上下文 4.渲染上下文
// 为什么要在这个方法里面绘图，因为只有在这个方法里才能获取跟view的layer相关联的上下文
// 什么时候调用，当这个view显示的时候才会调用drawRect:这个方法
// rect 是这个view的bounds
- (void)drawRect:(CGRect)rect {
    
    // 1原始方法
//    [self drawLine];
    
    // 2 贝塞尔
//    [self drawline2];
    
    
    // 3
//    [self drawline3];
    
    
    // 4
//    [self drawUIBezierPathState];
    
    // 5 画圆 贝塞尔
    [self Huayuan];
    
}
-(void)Huayuan{
    
    //bezierPathWithArcCenter 圆心
    //radius 半径
    //clockwise yes:顺时针 no 逆时针
    
    CGPoint center = CGPointMake(125, 125);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:50 startAngle:0 endAngle:M_PI clockwise:YES];
    
    
    [path addLineToPoint:center];
    
    
    [[UIColor orangeColor] set];
    
    // 封闭 ！==[path closePath]+[path stroke];
    // 填充，必须是一个完整的封闭路径，默认就会自动关闭路径
//    [path fill];
    
    // 关闭封闭路径
    [path closePath];
    
    [path stroke];
    
}

- (void)drawUIBezierPathState
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 50)];
    
    [path addLineToPoint:CGPointMake(200, 200)];
    
    
    path.lineWidth = 10;
    [[UIColor redColor] set];
    
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:CGPointMake(0, 0)];
    
    [path1 addLineToPoint:CGPointMake(30, 60)];
    [[UIColor greenColor] set];
    
    path1.lineWidth = 3;
    
    [path1 stroke];
}
-(void)drawline3{
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ref, 30, 90);
    
    CGContextAddLineToPoint(ref, 60, 30);
    
    CGContextAddLineToPoint(ref, 90, 90);
    
    CGContextAddLineToPoint(ref, 30, 90);
    
    
    // 设置图形状态 一定要在渲染之前
    // 颜色
    [[UIColor redColor]setStroke];
    
    // 线宽
    CGContextSetLineWidth(ref, 3);
    
    // 设置链接样式
    CGContextSetLineJoin(ref, kCGLineJoinBevel);
    // 设置顶角样式
    CGContextSetLineCap(ref, kCGLineCapRound);
    
    
    CGContextStrokePath(ref);
}

-(void)drawline2{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(30, 90)];
    
    [path addLineToPoint:CGPointMake(60, 30)];
    
    [path addLineToPoint:CGPointMake(90, 90)];
    
    [path addLineToPoint:CGPointMake(30, 90)];
    
    path.lineWidth = 2;
    
    [[UIColor redColor] set];
    
    [path stroke];
}

-(void)drawLine{
    // 获取图形上下文
    // CG coreGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2 描述路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    
    // 3 设置起点
    CGPathMoveToPoint(path, NULL, 30, 90);
    // 4 添加一根线到某个点
    CGPathAddLineToPoint(path, NULL, 60, 30);
    // 5
    CGPathAddLineToPoint(path, NULL, 90, 90);
    
    CGPathAddLineToPoint(path, NULL, 30, 90);
    
    // 设置颜色
    [[UIColor redColor] setStroke];
    
    // 把路径添加到上下文
    CGContextAddPath(ctx, path);
    // 渲染上下文
    CGContextStrokePath(ctx);
    
    
}

@end
