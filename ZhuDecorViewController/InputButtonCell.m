//
//  InputButtonCell.h
//
//
//  Created by ZhuRose on 2018/6/18.
//  Copyright © 2018年 ZhuRose. All rights reserved.
//

#import "InputButtonCell.h"

@interface InputButtonCell ()

@property (nonatomic, strong) UITextField *mInput;
@property (nonatomic, strong) UIButton *mButton;

@end

@implementation InputButtonCell
- (void)createMInput {
    UITextField *mInput = [[UITextField alloc] init];
    [self.contentView addSubview:mInput];
    mInput.tag = 10;
    //layout
    mInput.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:mInput attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [mInput addConstraint:width];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:mInput attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.contentView addConstraint:centerY];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:mInput attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    [self.contentView addConstraint:left];
    //params
    mInput.backgroundColor = [UIColor grayColor];
    mInput.text = @"嘿嘿";
    mInput.font = [UIFont systemFontOfSize:16];
    mInput.textColor = [UIColor colorWithHexString:@"#544588" alpha:1];
    mInput.placeholder = @"这是提示文本";
    mInput.secureTextEntry = NO;
    //assign
    _mInput = mInput;
}

- (void)createMButton {
    UIButton *mButton = [[UIButton alloc] init];
    [self.contentView addSubview:mButton];
    mButton.tag = 11;
    //layout
    mButton.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *itemView = [self.contentView viewWithTag:10];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:mButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [mButton addConstraint:height];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:mButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:40];
    [self.contentView addConstraint:top];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:mButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-40];
    [self.contentView addConstraint:right];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:mButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-40];
    [self.contentView addConstraint:bottom];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:mButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:itemView attribute:NSLayoutAttributeRight multiplier:1 constant:40];
    [self.contentView addConstraint:left];
    //params
    mButton.backgroundColor = [UIColor grayColor];
    [mButton setTitle:@"嘿嘿" forState:UIControlStateNormal];
    [mButton onclickWithBlock:^(UIButton *button) {
        NSLog(@"hello");
    }];
//    [mButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [mButton setTitleColor:[UIColor colorWithHexString:@"#544588" alpha:1] forState:UIControlStateNormal];
    mButton.enabled = NO;
    mButton.titleLabel.font = [UIFont systemFontOfSize:10];
    //assign
    _mButton = mButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createMInput];
        [self createMButton];
    }
    return self;
}

@end
