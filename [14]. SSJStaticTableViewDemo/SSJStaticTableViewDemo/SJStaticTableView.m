//
//  SJStaticTableView.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableView.h"
#import "SSJStaticTableviewCellViewModel.h"
#import "SSJStaticTableviewSectionViewModel.h"
#import "SJStaticTableViewCell.h"

@implementation SJStaticTableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = SSJColorWithRGB(240, 239, 245, 1);
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        self.scrollEnabled = NO;
        self.delegate = self;
    }
    return self;
}


#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSJStaticTableviewCellViewModel *cellViewModel = [self.sjDataSource tableView:tableView cellViewModelAtIndexPath:indexPath];
    return cellViewModel.cellHeight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    SSJStaticTableviewSectionViewModel *sectionViewModel = [self.sjDataSource tableView:tableView sectionViewModelInSection:section];
    return sectionViewModel.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    SSJStaticTableviewSectionViewModel *sectionViewModel = [self.sjDataSource tableView:tableView sectionViewModelInSection:section];
    return sectionViewModel.sectionFooterHeight;
}

//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    SSJStaticTableviewSectionViewModel *sectionViewModel = self.sjDataSource.viewModelsArray[indexPath.section];
//    SSJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.itemArray[indexPath.row];
//    
//}


@end