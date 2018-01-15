//
//  CWQLineView.m
//  Knowledgepoints
//
//  Created by cai on 17/7/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQLineView.h"

@implementation CWQLineView

/**
 * 图形绘制的步骤：
 * 1.获取上下文
 * 2.创建路径（描述路径）
 * 3.把路径添加到上下文
 * 4.渲染上下文
 *
 */

// 通常在这个方法里里面绘制图形
// 为什么要在drawRect:里面绘制，只有在找个方法里面才能获取到跟view的layer相关联的图形上下文
// 什么时候调用：当这个view要显示的时候才会调用drawRect绘制图形
// 注意rect 是当前控件的bounds
- (void)drawRect:(CGRect)rect {

    // 最原始方法
//    [self drawline];
    // 2
//    [self drarect2];
    // 3
//    [self drawLine3];
    
    // 4
    [self drawCtxState];
}
#pragma mark 绘图的几种方式
// 最原始的方式
-(void)drawline{
    
    // 1.获取图形上下文
    // 目前我们所用的上下文都是以UIGraphics
    // CGContextRef Ref:引用 CG:目前使用到的类型和函数 一般都是CG开头 CoreGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    // 创建上下文
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 设置起点
    // path:跟那个路径设置起点
    CGPathMoveToPoint(path, NULL, 10, 10);
    
    // 添加一根线到某个点
    CGPathAddLineToPoint(path, NULL, 120, 10);
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path);
    
    // 4.渲染上下文
    CGContextStrokePath(ctx);
    
}
// 方法2
-(void)drarect2{
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 描述路径
    
    CGContextMoveToPoint(ctx, 10, 10);
    
    CGContextAddLineToPoint(ctx, 50, 10);
    
    // 渲染上下文
    
    CGContextStrokePath(ctx);
    
}
#pragma mark - 绘图第三种方式
- (void)drawLine3{
    
    // UIKit 已经封装了一些绘图的功能
    // 贝塞尔路径
    
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 设置起点
    [path moveToPoint:CGPointMake(10, 15)];
    // 添加一跟线到某个点
    [path addLineToPoint:CGPointMake(90, 0)];
    // 绘制路径 stroke (笔画)
    [path stroke];
    
    
}
#pragma mark --一些属性和方法
-(void)drawCtxState{
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    // 描述路径
    // 起点
    CGContextMoveToPoint(ctx, 50, 50);
    
    CGContextAddLineToPoint(ctx, 100, 50);
    
    // 设置起点
    CGContextMoveToPoint(ctx, 80, 50);
    
    // 默认下一根线的起点就是上一根线的终点
    CGContextAddLineToPoint(ctx, 100, 200);
    
    // 设置绘图状态 一定要在渲染之前
    // 颜色
    [[UIColor blueColor] setStroke];

    // 线宽
    CGContextSetLineWidth(ctx, 5);
    
    // 设置链接样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    // 设置顶角样式
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 渲染上下文
    
    CGContextStrokePath(ctx);
    
}
-(void)drawUIBezierPathState{
    
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
-(void)pathse{
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 描述路径
    // 设置起点
    CGContextMoveToPoint(ctx, 50, 50);
    
    // cpx:控制点的x
    CGContextAddQuadCurveToPoint(ctx, 150, 20, 250, 50);
    
    
    // 渲染上下文
    CGContextStrokePath(ctx);
}
@end
