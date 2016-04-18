//
//  GoalCell.h
//  Time
//
//  Created by 张鹏 on 16/4/18.
//  Copyright © 2016年 figaro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoalCell : UITableViewCell
+(instancetype) cellWithTableView:(UITableView *)tableview;

@property (nonatomic, assign) NSArray *cellData;

@end
