//
//  GoalCell.m
//  Time
//
//  Created by 张鹏 on 16/4/18.
//  Copyright © 2016年 figaro. All rights reserved.
//

#import "GoalCell.h"
@interface GoalCell()
@property (strong, nonatomic) IBOutlet UIImageView *goalImage;
@property (strong, nonatomic) IBOutlet UILabel *goallable;
@property (strong, nonatomic) IBOutlet UILabel *goalDetailLable;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;


@end


@implementation GoalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype) cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"cell";
    GoalCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //IB中创建cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GoalCell" owner:self options:nil] lastObject];
    }
    return cell;
}
-(void)setCellData:(NSArray *)cellData{
    _cellData = cellData;
    //TODO: 设置cell的数据源
    
//    self.goalImage.image =
}
- (IBAction)record:(id)sender {
}

@end
