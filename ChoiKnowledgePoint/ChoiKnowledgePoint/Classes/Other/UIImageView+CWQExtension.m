//
//  UIImageView+CWQExtension.m
//  Knowledgepoints
//
//  Created by cai on 17/8/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIImageView+CWQExtension.h"
#import "UIImage+CWQExtension.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (CWQExtension)

- (void)setHeader:(NSString *)url
{
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}

@end
