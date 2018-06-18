//
//  IconViewCell.h
//
//
//  Created by ZhuRose on 2018/6/18.
//  Copyright © 2018年 ZhuRose. All rights reserved.
//

#import "IconViewCell.h"

@interface IconViewCell ()

@property (nonatomic, strong) UIImageView *iconView1;
@property (nonatomic, strong) UIImageView *iconView2;
@property (nonatomic, strong) UIImageView *iconView3;

@end

@implementation IconViewCell
- (void)createIconView1 {
    UIImageView *iconView1 = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView1];
    iconView1.tag = 10;
    //layout
    iconView1.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:iconView1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView1 addConstraint:height];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:iconView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView1 addConstraint:width];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:iconView1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.contentView addConstraint:centerY];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:iconView1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    iconView1.backgroundColor = [UIColor colorWithHexString:@"#ff0000" alpha:1];
    iconView1.layer.cornerRadius = 50;
    iconView1.image = [UIImage imageNamed:@""];
    iconView1.layer.borderWidth = 1;
    iconView1.layer.borderColor = [UIColor colorWithHexString:@"#000000" alpha:1].CGColor;
    //assign
    _iconView1 = iconView1;
}

- (void)createIconView2 {
    UIImageView *iconView2 = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView2];
    iconView2.tag = 11;
    //layout
    iconView2.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *itemView = [self.contentView viewWithTag:10];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:iconView2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView2 addConstraint:height];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:iconView2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView2 addConstraint:width];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:iconView2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.contentView addConstraint:centerY];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:iconView2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:itemView attribute:NSLayoutAttributeRight multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    iconView2.backgroundColor = [UIColor colorWithHexString:@"#00ff00" alpha:1];
    iconView2.layer.cornerRadius = 50;
    iconView2.image = [UIImage imageNamed:@""];
    iconView2.layer.borderWidth = 1;
    iconView2.layer.borderColor = [UIColor colorWithHexString:@"#000000" alpha:1].CGColor;
    //assign
    _iconView2 = iconView2;
}

- (void)createIconView3 {
    UIImageView *iconView3 = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView3];
    iconView3.tag = 12;
    //layout
    iconView3.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *itemView = [self.contentView viewWithTag:11];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:iconView3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView3 addConstraint:height];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:iconView3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [iconView3 addConstraint:width];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:iconView3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.contentView addConstraint:centerY];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:iconView3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:itemView attribute:NSLayoutAttributeRight multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    iconView3.backgroundColor = [UIColor colorWithHexString:@"#0000ff" alpha:1];
    iconView3.layer.cornerRadius = 50;
    iconView3.image = [UIImage imageNamed:@""];
    iconView3.layer.borderWidth = 1;
    iconView3.layer.borderColor = [UIColor colorWithHexString:@"#000000" alpha:1].CGColor;
    //assign
    _iconView3 = iconView3;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createIconView1];
        [self createIconView2];
        [self createIconView3];
    }
    return self;
}

@end