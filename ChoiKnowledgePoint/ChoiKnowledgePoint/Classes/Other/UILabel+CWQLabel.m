//
//  UILabel+CWQLabel.m
//  
//
//  Created by cai on 17/11/7.
//
//

#import "UILabel+CWQLabel.h"

@implementation UILabel (CWQLabel)

/**
 * 快速创建label
 
 @param font 字体
 @param textColor 颜色
 @return label
 */
+(instancetype)initLabelFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text{
    
    UILabel *label = [[UILabel alloc]init];
    label.font = font;
    label.textColor = textColor;
    label.text = text;
    return label;
}

@end
