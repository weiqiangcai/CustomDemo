//
//  XMGInfiniteScrollView.m
//  06-03-分页
//
//  Created by MJ Lee on 15/5/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGInfiniteScrollView.h"

static int const ImageViewCount = 3;

@interface XMGInfiniteScrollView() <UIScrollViewDelegate>
@property (weak, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation XMGInfiniteScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 滚动视图
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        // 图片控件
        for (int i = 0; i<ImageViewCount; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [scrollView addSubview:imageView];
        }
        
        // 页码视图
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        [self addSubview:pageControl];
        _pageControl = pageControl;
        
        
        // 5.单页的时候是否隐藏pageControl
        self.pageControl.hidesForSinglePage = YES;
        
        // 6.设置pageControl的图片
//        [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
//        [self.pageControl setValue:[UIImage imageNamed:@"other"]  forKeyPath: @"_pageImage"];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    if (self.isScrollDirectionPortrait) {
        self.scrollView.contentSize = CGSizeMake(0, ImageViewCount * self.bounds.size.height);
    } else {
        self.scrollView.contentSize = CGSizeMake(ImageViewCount * self.bounds.size.width, 0);
    }
    
    for (int i = 0; i<ImageViewCount; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        
        if (self.isScrollDirectionPortrait) {
            imageView.frame = CGRectMake(0, i * self.scrollView.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        } else {
            imageView.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        }
    }
    
    
    CGFloat pageW = 80;
    CGFloat pageH = 20;
    CGFloat pageX = self.scrollView.frame.size.width - pageW-20;
    CGFloat pageY = self.scrollView.frame.size.height - pageH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    // 这个方法可以根据页数返回UIPageControl合适的大小
//    CGSize pageSize = [self.pageControl sizeForNumberOfPages:_images.count];
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    
    // 设置页码
    self.pageControl.numberOfPages = images.count;
    self.pageControl.currentPage = 1;
    
    // 设置内容
    [self updateContent];
    
    // 开始定时器
    [self startTimer];
}
#pragma mark --设置圆点
-(void)setOtherColor:(UIColor *)otherColor{
    
    _otherColor = otherColor;
    
    self.pageControl.pageIndicatorTintColor = otherColor;
}
-(void)setCurrentColor:(UIColor *)currentColor{
    
    _currentColor = currentColor;
    
    self.pageControl.currentPageIndicatorTintColor = currentColor;
}
// 图片代替
-(void)setOtherImage:(NSString *)otherImage{
    
    _otherImage = otherImage;
    
    [self.pageControl setValue:[UIImage imageNamed:otherImage]  forKeyPath: @"_pageImage"];
    
    //        [self.pageControl setValue:[UIImage imageNamed:@"other"]  forKeyPath: @"_pageImage"];
}
-(void)setCurrentImage:(NSString *)currentImage{
    
    _currentImage = currentImage;
    
    [self.pageControl setValue:[UIImage imageNamed:currentImage] forKey:@"_currentPageImage"];
    
//    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
}
#pragma mark - <UIScrollViewDelegate>
/**
 * 只有scrollView  在滚动就会调用这个方法
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 找出最中间的那个图片控件
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        
        CGFloat distance = 0;
        if (self.isScrollDirectionPortrait) {
            distance = ABS(imageView.frame.origin.y - scrollView.contentOffset.y);
        } else {
            distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);
        }
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    self.pageControl.currentPage = page;
    
    NSLog(@"page-是-- %ld",(long)page);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateContent];
}
/**
 *scrollView 结束了滚动动画以后就会调用这个方法（比如：(void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated）方法执行完毕的动画后）
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updateContent];
}

#pragma mark - 内容更新
-(void)firstUpdateContent{
    UIImageView *imageView = self.scrollView.subviews[0];
//    index = 0;
    imageView.tag = 0;
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)];
    [imageView addGestureRecognizer:tap];
    
    
    if (self.isWebImage) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.images[0]]];
    } else {
        imageView.image = self.images[0];
    }

    
    // 设置偏移量在中间
    if (self.isScrollDirectionPortrait) {
        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.frame.size.height);
    } else {
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    }
}
- (void)updateContent
{
    // 设置图片
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        NSInteger index = self.pageControl.currentPage;
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }
        imageView.tag = index;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)];
        [imageView addGestureRecognizer:tap];
        
        
        if (self.isWebImage) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.images[index]]];
        } else {
        imageView.image = self.images[index];    
        }
        
    }
    
    // 设置偏移量在中间
    if (self.isScrollDirectionPortrait) {
        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.frame.size.height);
    } else {
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    }
}

-(void)clickImage:(UITapGestureRecognizer *)tap{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickImageTag:)]) {
        [self.delegate clickImageTag:tap.view.tag];
    }
}

#pragma mark - 定时器处理
- (void)startTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(next) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)next
{
    if (self.isScrollDirectionPortrait) {
        [self.scrollView setContentOffset:CGPointMake(0, 2 * self.scrollView.frame.size.height) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(2 * self.scrollView.frame.size.width, 0) animated:YES];
    }
}
@end
