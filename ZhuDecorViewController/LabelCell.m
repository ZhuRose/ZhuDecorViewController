//
//  LabelCell.h
//
//
//  Created by ZhuRose on 2018/6/18.
//  Copyright © 2018年 ZhuRose. All rights reserved.
//

#import "LabelCell.h"

@interface LabelCell ()

@property (nonatomic, strong) UILabel *mLabel;

@end

@implementation LabelCell
- (void)createMLabel {
    UILabel *mLabel = [[UILabel alloc] init];
    [self.contentView addSubview:mLabel];
    mLabel.tag = 10;
    //layout
    mLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:mLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self.contentView addConstraint:top];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:mLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    [self.contentView addConstraint:right];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:mLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.contentView addConstraint:bottom];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:mLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self.contentView addConstraint:left];
    //params
    mLabel.text = @"123";
    mLabel.font = [UIFont systemFontOfSize:20];
    mLabel.textColor = [UIColor colorWithHexString:@"#ff0000" alpha:1];
    mLabel.textAlignment = NSTextAlignmentCenter;
    //assign
    _mLabel = mLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createMLabel];
    }
    return self;
}

@end