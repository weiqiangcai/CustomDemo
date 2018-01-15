//
//  UIView+CWQExtension.h
//  Knowledgepoints
//
//  Created by cai on 17/6/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CWQExtension)

@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;



/**
 * 判断一个控件是否真正显示在主窗口
 */
-(BOOL)isShowingOnKeyWindow;

@end
