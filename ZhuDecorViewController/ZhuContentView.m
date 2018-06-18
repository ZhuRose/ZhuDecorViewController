//
//  ZhuContentView.m
//  ZhuDecorViewController
//
//  Created by 朱煜松 on 18/6/17.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import "ZhuContentView.h"

@interface ZhuContentView ()

@property (nonatomic, strong, readwrite) ZhuContentAdapter *adapter;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZhuContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setAdapter:[[ZhuContentAdapter alloc] init]];
        [self createTableView];
    }
    return self;
}

- (void)setAdapter:(ZhuContentAdapter *)adapter {
    _adapter = adapter;
    _tableView.dataSource = _adapter;
    _tableView.delegate = _adapter;
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] init];
    [self addSubview:tableView];
    //layout
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *tableView_topConstraint = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *tableView_leftConstraint = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *tableView_rightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:tableView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *tableView_bottomConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:tableView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self addConstraints:@[tableView_topConstraint, tableView_leftConstraint, tableView_rightConstraint, tableView_bottomConstraint]];
    //params
    tableView.tableFooterView = [[UIView alloc] init];
    //assign
    _tableView = tableView;

}

@end
