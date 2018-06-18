//
//  ZhuCustomCell.h
//  ZhuDecorViewController
//
//  Created by 朱煜松 on 18/6/17.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Block.h"
#import "UIColor+Hex.h"

@interface ZhuCustomCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (instancetype)unreuseCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
