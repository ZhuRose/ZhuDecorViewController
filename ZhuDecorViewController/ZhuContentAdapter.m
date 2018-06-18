//
//  ZhuContentAdapter.m
//  ZhuDecorViewController
//
//  Created by 朱煜松 on 18/6/17.
//  Copyright © 2018年 kb210. All rights reserved.
//

#import "ZhuContentAdapter.h"
#import "LabelCell.h"
#import "LabelCell2.h"
#import "InputButtonCell.h"
#import "IconViewCell.h"
#import "ComplexCell.h"

@interface ZhuContentAdapter ()

@property (nonatomic, strong) NSArray *sectionArray;

@end

@implementation ZhuContentAdapter

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZhuCustomCell *cell = [ComplexCell cellWithTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
