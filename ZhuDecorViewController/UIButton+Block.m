//
//  UIButton+Block.m
//  Instagram
//
//  Created by 朱煜松 on 18/6/17.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

static char onclickKey;

@implementation UIButton (Block)

- (void)onclickWithBlock:(OnclickBlock)block {
    if (![self getOnclickBlock]) {
        [self addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self setOnclickBlock:block];
}

- (void)onclick:(UIButton *)sender {
    OnclickBlock block = [self getOnclickBlock];
    if (block) {
        block(sender);
    }
}

- (OnclickBlock)getOnclickBlock {
    OnclickBlock block = (OnclickBlock)objc_getAssociatedObject(self, &onclickKey);
    return block;
}

- (void)setOnclickBlock:(OnclickBlock)block {
    objc_setAssociatedObject(self, &onclickKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
