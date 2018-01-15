//
//  UILabel+CWQLabel.h
//  
//
//  Created by cai on 17/11/7.
//
//

#import <UIKit/UIKit.h>

@interface UILabel (CWQLabel)


/**
 * 快速创建label

 @param font 字体
 @param textColor 颜色
 @return label
 */
+(instancetype)initLabelFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text;

@end
