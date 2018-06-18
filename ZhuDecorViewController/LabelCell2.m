//
//  LabelCell2.h
//
//
//  Created by ZhuRose on 2018/6/18.
//  Copyright © 2018年 ZhuRose. All rights reserved.
//

#import "LabelCell2.h"

@interface LabelCell2 ()

@property (nonatomic, strong) UILabel *mLabel;

@end

@implementation LabelCell2
- (void)createMLabel {
    UILabel *mLabel = [[UILabel alloc] init];
    [self.contentView addSubview:mLabel];
    mLabel.tag = 10;
    //layout
    mLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:mLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    [mLabel addConstraint:width];
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:mLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.contentView addConstraint:centerX];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:mLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.contentView addConstraint:centerY];
    //params
    mLabel.backgroundColor = [UIColor colorWithHexString:@"#2345ab" alpha:1];
    mLabel.text = @"你好";
    mLabel.textColor = [UIColor colorWithHexString:@"#000000" alpha:1];
    mLabel.alpha = 1;
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
