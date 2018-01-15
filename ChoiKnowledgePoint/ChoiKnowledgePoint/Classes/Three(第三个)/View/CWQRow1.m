//
//  CWQRow1.m
//  ChoiKnowledgePoint
//
//  Created by cai on 17/11/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQRow1.h"

@implementation CWQRow1

-(void)setProgress:(CGFloat)progress{
    
    _progress = progress;
    
    NSLog(@"progress-----%f",progress);
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGFloat radius = rect.size.width *0.5;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat endAngle = -M_PI_2 + M_PI *2 *_progress;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 2 startAngle: -M_PI_2 endAngle:endAngle clockwise:YES];
    
//    [path closePath];
    
    [path stroke];
}


@end
