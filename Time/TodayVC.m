//
//  TodayVC.m
//  Time
//
//  Created by figaro on 16/4/14.
//  Copyright © 2016年 figaro. All rights reserved.
//

#import "TodayVC.h"

@interface TodayVC ()

@property (weak, nonatomic) IBOutlet UIView *todayView;
@property (weak, nonatomic) IBOutlet UIView *tomatoView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Segmented;
@property (strong, nonatomic) IBOutlet UIButton *addGoalButton; //添加目标按钮

@end

@implementation TodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [_Segmented addTarget:self action:@selector(click) forControlEvents:UIControlEventValueChanged];
}

-(void)viewWillAppear:(BOOL)animated
{
    self . tabBarController . tabBar . hidden = NO ;
}



- (void)click{
    
    switch ( _Segmented.selectedSegmentIndex) {
        case 0:{
            
       

            _todayView.hidden = NO;
            _tomatoView.hidden = YES;
   
            
        }
            break;
        case 1:{
         
            [self tomatoView];
            _todayView.hidden = YES;
            _tomatoView.hidden = NO;
        }
            break;
            
        default:{
            NSLog(@"segmentActionDefault");
        }
            break;
    }
}




@end
