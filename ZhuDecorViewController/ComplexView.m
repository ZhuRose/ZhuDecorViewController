//
//  ComplexView.h
//
//
//  Created by ZhuRose on 2018/6/18.
//  Copyright © 2018年 ZhuRose. All rights reserved.
//

#import "ComplexView.h"

@interface ComplexView ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@end

@implementation ComplexView
- (void)createIconView {
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    iconView.tag = 10;
    //layout
    iconView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:iconView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView addConstraint:height];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:iconView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView addConstraint:width];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:iconView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.contentView addConstraint:centerY];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:iconView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    iconView.backgroundColor = [UIColor colorWithHexString:@"#328520" alpha:1];
    //assign
    _iconView = iconView;
}

- (void)createLabel {
    UILabel *label = [[UILabel alloc] init];
    [self.contentView addSubview:label];
    label.tag = 11;
    //layout
    label.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *itemView = [self.contentView viewWithTag:10];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    [self.contentView addConstraint:top];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:itemView attribute:NSLayoutAttributeRight multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    label.backgroundColor = [UIColor colorWithHexString:@"#ff0000" alpha:1];
    label.text = @"123";
    label.font = [UIFont systemFontOfSize:20];
    //assign
    _label = label;
}

- (void)createView1 {
    UIView *view1 = [[UIView alloc] init];
    [self.contentView addSubview:view1];
    view1.tag = 12;
    //layout
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *itemView = [self.contentView viewWithTag:10];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:10];
    [view1 addConstraint:height];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [view1 addConstraint:width];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    [self.contentView addConstraint:bottom];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:itemView attribute:NSLayoutAttributeRight multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    view1.backgroundColor = [UIColor colorWithHexString:@"#00ffff" alpha:1];
    //assign
    _view1 = view1;
}

- (void)createView2 {
    UIView *view2 = [[UIView alloc] init];
    [self.contentView addSubview:view2];
    view2.tag = 13;
    //layout
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *itemView = [self.contentView viewWithTag:12];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [view2 addConstraint:height];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [view2 addConstraint:width];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    [self.contentView addConstraint:bottom];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:itemView attribute:NSLayoutAttributeRight multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    view2.backgroundColor = [UIColor colorWithHexString:@"#88ffff" alpha:1];
    //assign
    _view2 = view2;
}

- (instancetype)init {
    if (self = [super init]) {
        [self createIconView];
        [self createLabel];
        [self createView1];
        [self createView2];
    }
    return self;
}

@end
