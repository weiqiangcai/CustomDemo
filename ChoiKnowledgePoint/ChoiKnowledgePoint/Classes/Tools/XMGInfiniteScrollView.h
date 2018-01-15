//
//  XMGInfiniteScrollView.h
//  06-03-分页
//
//  Created by MJ Lee on 15/5/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol infiniteScrollViewDelete <NSObject>
/**
 * 点击图片事件
 */
@optional
-(void)clickImageTag:(NSInteger)tag;

@end

@interface XMGInfiniteScrollView : UIView
@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic, readonly) UIPageControl *pageControl;
@property (assign, nonatomic, getter=isScrollDirectionPortrait) BOOL scrollDirectionPortrait;

//*************圆点设置**********

/** 其他圆点颜色 */
@property(nonatomic,strong)UIColor* otherColor;
/** 当前圆点颜色 */
@property (nonatomic, strong) UIColor *currentColor;

/** 其他圆点图片 */
@property(nonatomic,strong)NSString *otherImage;
/** 当前圆点图片 */
@property(nonatomic,strong)NSString* currentImage;

/** 是否网络图片 */
@property(nonatomic,assign,getter=isWebImage)BOOL isWebImage;

@property(nonatomic,weak)id <infiniteScrollViewDelete>delegate;


@end
