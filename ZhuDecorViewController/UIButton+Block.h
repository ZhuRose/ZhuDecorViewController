//
//  UIButton+Block.h
//  Instagram
//
//  Created by 朱煜松 on 18/6/17.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnclickBlock)(UIButton * button);

@interface UIButton (Block)

- (void)onclickWithBlock:(OnclickBlock)block;

@end
