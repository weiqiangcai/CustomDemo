//
//  CWQTableViewHeaderView.m
//  ChoiKnowledgePoint
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CWQTableViewHeaderView.h"

@interface CWQTableViewHeaderView()

@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@end

@implementation CWQTableViewHeaderView

+(instancetype)tableViewHeaderView{
    
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}

-(void)setTitle:(NSString *)title{
    
    _title = title;
    
    _titleLb.text = title;
    
}

@end
