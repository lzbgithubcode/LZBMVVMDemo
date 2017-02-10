//
//  ViewController.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBCommitDataController.h"
#import "LZBImageViewTableViewCellViewModel.h"
#import "LZBImageViewTableViewCell.h"


static NSString *LZBImageViewTableViewCellID = @"LZBImageViewTableViewCellID";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong,nullable) LZBCommitDataController *dataVC;

@property (nonatomic, strong) NSArray<LZBImageViewTableViewCellViewModel *>*cellModel;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self fetchUpdateData];
    
}

- (void)fetchUpdateData
{
    LZBWeakSelf(weakSelf);
   [self.dataVC resquestUpdateDataWithCallback:^(NSError *error) {
      if(error == nil)
      {
          [weakSelf reloadSubViewData];
      }
       else
       {
           NSLog(@"=====%@",error.description);
       }
       
   }];
}


- (void)reloadSubViewData
{
    NSArray *data = self.dataVC.dataTopics;
    self.cellModel = [LZBImageViewTableViewCellViewModel viewModelWithContentModel:data];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellModel.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZBImageViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LZBImageViewTableViewCellID];
    if(indexPath.row < self.cellModel.count)
    {
        cell.cellModel = self.cellModel[indexPath.row];
        
        __weak typeof(cell)  weakCell = cell;
       [cell setCellPraiseClick:^(LZBImageViewTableViewCellViewModel *cellModel) {
           cellModel.contentModel.creator.userId++;
           [weakCell reloadPraiseCountWithModel:cellModel];
       }];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellModel[indexPath.row].cellHeight;
}


#pragma mark - lazy
-(LZBCommitDataController *)dataVC
{
   if(_dataVC == nil)
   {
       _dataVC = [[LZBCommitDataController alloc]init];
   }
    return _dataVC;
}

- (UITableView *)tableView
{
  if(_tableView == nil)
  {
      _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
      [_tableView registerClass:[LZBImageViewTableViewCell class] forCellReuseIdentifier:LZBImageViewTableViewCellID];
      _tableView.dataSource = self;
      _tableView.delegate = self;
  }
    return _tableView;
}

@end
