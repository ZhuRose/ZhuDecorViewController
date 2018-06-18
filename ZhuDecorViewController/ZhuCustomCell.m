//
//  ZhuCustomCell.m
//  ZhuDecorViewController
//
//  Created by 朱煜松 on 18/6/17.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import "ZhuCustomCell.h"

@implementation ZhuCustomCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [self cellWithTableView:tableView identifier:NSStringFromClass(self)];
}

+ (instancetype)unreuseCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return [self cellWithTableView:tableView identifier:[NSString stringWithFormat:@"%@_%ld_%ld", NSStringFromClass(self), (long)indexPath.section, (long)indexPath.row]];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier {
    ZhuCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

@end
