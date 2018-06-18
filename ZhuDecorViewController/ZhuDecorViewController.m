//
//  ZhuDecorViewController.m
//  ZhuDecorViewController
//
//  Created by 朱煜松 on 18/6/17.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import "ZhuDecorViewController.h"
#import "ZhuContentView.h"

@interface ZhuDecorViewController ()
@property (nonatomic, strong)NSLayoutConstraint *headerView_heightConstraint;
@property (nonatomic, strong)NSLayoutConstraint *footerView_heightConstraint;
@property (nonatomic, strong)NSLayoutConstraint *footerView_bottomConstraint;
@end

@implementation ZhuDecorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createHeaderView];
    [self createFooterView];
    [self createContentView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)createHeaderView {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:headerView];
    //layout
    headerView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *headerView_topConstraint = [NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *headerView_leftConstraint = [NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *headerView_rightConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *headerView_heightConstraint = [NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self.view addConstraints:@[headerView_topConstraint, headerView_leftConstraint, headerView_rightConstraint]];
    [headerView addConstraint:headerView_heightConstraint];
    //assign
    _headerView = headerView;
    _headerView_heightConstraint = headerView_heightConstraint;
}

- (void)createFooterView {
    UIView *footerView = [[UIView alloc] init];
    [self.view addSubview:footerView];
    //layout
    footerView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *footerView_leftConstraint = [NSLayoutConstraint constraintWithItem:footerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *footerView_rightConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:footerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *footerView_bottomConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:footerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *footerView_heightConstraint = [NSLayoutConstraint constraintWithItem:footerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self.view addConstraints:@[footerView_leftConstraint, footerView_rightConstraint, footerView_bottomConstraint]];
    [footerView addConstraint:footerView_heightConstraint];
    //assign
    _footerView = footerView;
    _footerView_heightConstraint = footerView_heightConstraint;
    _footerView_bottomConstraint = footerView_bottomConstraint;
}

- (void)createContentView {
    ZhuContentView *contentView = [[ZhuContentView alloc] init];
    contentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contentView];
    //layout
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *contentView_topConstraint = [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *contentView_leftConstraint = [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *contentView_rightConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *contentView_bottomConstraint = [NSLayoutConstraint constraintWithItem:_footerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.view addConstraints:@[contentView_topConstraint, contentView_leftConstraint, contentView_rightConstraint, contentView_bottomConstraint]];
    //assign
    _contentView = contentView;
}

@end
