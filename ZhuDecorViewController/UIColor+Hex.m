//
//  UIColor+Hex.m
//  ZhuDecorViewController
//
//  Created by 朱煜松 on 18/6/18.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    // 删除字符串中的空格
    NSString * colorStr = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // 判断字符串是否合法
    if (![colorStr hasPrefix:@"#"] || [colorStr length] != 7) {
        return [UIColor clearColor];
    }
    // 如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    colorStr = [colorStr substringFromIndex:1];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //red
    NSString * redStr = [colorStr substringWithRange:range];
    //green
    range.location += 2;
    NSString * greenStr = [colorStr substringWithRange:range];
    //blue
    range.location += 2;
    NSString * blueStr = [colorStr substringWithRange:range];
    // Scan values 将十六进制转换成二进制
    unsigned int r, g, b;
    [[NSScanner scannerWithString:redStr] scanHexInt:&r];
    [[NSScanner scannerWithString:greenStr] scanHexInt:&g];
    [[NSScanner scannerWithString:blueStr] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
