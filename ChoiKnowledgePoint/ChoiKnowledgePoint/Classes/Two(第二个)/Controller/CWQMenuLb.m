//
//  CWQMenuLb.m
//  Knowledgepoints
//
//  Created by cai on 17/8/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQMenuLb.h"

@implementation CWQMenuLb

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setupView];
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
    
        [self setupView];
    }
    return self;
}
-(void)setupView{
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
}
-(BOOL)canBecomeFirstResponder{
    
    
    return  YES;
}

/**
 * label 能执行那些操作（如copy ，paste）
 @return yes 支持这些操作
 */
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    if (action == @selector(cut:) || action == @selector(copy:) || action == @selector(paste:)) return YES;
    
    return NO;
}
- (void)copy:(UIMenuController *)menu
{
    // 将自己的文字复制到粘贴板
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.text;
}

- (void)paste:(UIMenuController *)menu
{
    // 将粘贴板的文字 复制 到自己身上
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    self.text = board.string;
}

- (void)labelClick
{
    // 1.label要成为第一响应者(作用是:告诉UIMenuController支持哪些操作, 这些操作如何处理)
    [self becomeFirstResponder];
    
    // 2.显示MenuController
    UIMenuController *menu = [UIMenuController sharedMenuController];
    // targetRect: MenuController需要指向的矩形框
    // targetView: targetRect会以targetView的左上角为坐标原点
    [menu setTargetRect:self.bounds inView:self];
    //    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}


@end
