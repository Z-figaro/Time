//
//  TodayView.m
//  Time
//
//  Created by figaro on 16/4/14.
//  Copyright © 2016年 figaro. All rights reserved.
//

#import "TodayView.h"
#import <UIKit/UIKit.h>



@interface TodayView (){
    
    NSArray *dataSource;
//    HProgressView * pView;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;/**< 目标表格视图 */

@property (weak, nonatomic) IBOutlet UIView *bottomView;/**< 进度条底图 */
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;/**< 进度值 */
@property (nonatomic, strong) UIView *progressView;/**< 进度条视图 */
@property (nonatomic, assign) CGFloat progressWidth;/**< 进度条宽度 */
@property (nonatomic, assign) CGFloat validTime; /**< 每天投资的有效时间 */

@property (nonatomic, strong) UIButton *record;/**< 开始记录时间 */

- (void)initUserInterface;/**< 初始化用户界面 */
- (void)initDataSource;/**< 初始化数据源 */
@end

@implementation TodayView

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initDataSource];
    [self initUserInterface];
  
    
//    pView = [[HProgressView alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
//    [self.view addSubview:pView];
    
  
}

#pragma mark - dataSource&&userInterface

-(void)initDataSource{
    
    //    dataSource
}

- (void)initUserInterface{
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //倒圆角
    _bottomView.layer.cornerRadius = 10;
    [self progressView];
    [self progressLabel];
    //TODO:100是以后传入的投资时间
//    [self setValidTime];
    _validTime = 50000;
    [self updateTime:_validTime];
    
}

//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    static float value = 0.1;
//    [pView udateProgress:value];
//    value += 0.05;
////    [self setProgressWidth:_progressWidth + 10];
//}




-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.progressView setFrame:CGRectMake(0, 0, _progressWidth, 16)];
    }];
    
    
}

#pragma mark - 表格视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //表格视图重用标识符
    static NSString *const KUITabelViewCellIdentifier = @"cellIdentifier";
    // 在表格视图队列中根据标识符寻找可重用的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KUITabelViewCellIdentifier];
    // 如果没有找到，则新建
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:KUITabelViewCellIdentifier];
    }
    
    //set cell.textlabel
    cell.textLabel.text = @"标题";
    cell.detailTextLabel.text = @"子标题的详细描述";
    cell.imageView.image = [UIImage imageNamed:@"今天选择32"];
    
    
    
    //    cell.accessoryView = bt;
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}


#pragma mark - setter方法



//-(void)setProgressWidth:(CGFloat)progressWidth{
//    
//    _progressWidth = progressWidth;
//    
//
////    progressWidth = _progressView.bounds.size.width * (_validTime/86400.0);
//    progressWidth = 320 * (_validTime/86400.0);
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        [self.progressView setFrame:CGRectMake(0, 0, progressWidth, 16)];
//    }];
//}

-(void)updateTime:(NSInteger)time{
    _validTime = time;
    _progressLabel.text = [NSString stringWithFormat:@"%.2f%%投资",(_validTime/86400.0)*100];
    
    _progressWidth = 320 * (_validTime/86400.0);
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.progressView setFrame:CGRectMake(0, 0, _progressWidth, 16)];
    }];
    
}

//-(void)setProgressLabel:(UILabel *)progressLabel{
//    progressLabel.text = [NSString stringWithFormat:@"%.2f%%投资",(_validTime/86400.0)*100];
//}

- (UIView *)progressView{
    
    if (!_progressView) {
        
        _progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 16)];
        _progressView.backgroundColor = [UIColor blueColor];
        _progressView.layer.cornerRadius = 10;
        
        
        [self.bottomView addSubview:_progressView];
        
        
    }
    
    return _progressView;
    
}

@end
