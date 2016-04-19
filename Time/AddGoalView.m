//
//  AddGoalView.m
//  Time
//
//  Created by figaro on 16/4/19.
//  Copyright © 2016年 figaro. All rights reserved.
//

#import "AddGoalView.h"
#import "goalDetailView.h"

@interface AddGoalView()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIView *goalView;
@property (weak, nonatomic) IBOutlet UIView *planView;

@end
@implementation AddGoalView
-(void)viewDidLoad{
    [super viewDidLoad];
    
     [_segment addTarget:self action:@selector(click) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {

    self . tabBarController . tabBar . hidden = YES ;
    
    
   
    
}
- (void)click{
    
    switch ( _segment.selectedSegmentIndex) {
        case 0:{

//            [self goalView];
        _goalView.hidden = NO;
        _planView.hidden = YES;

            
        }
            break;
        case 1:{
            
            [self planView];
           _goalView.hidden = YES;
           _planView.hidden = NO;
        }
            break;
            
        default:{
            NSLog(@"segmentActionDefault");
        }
            break;
    }
}



@end
