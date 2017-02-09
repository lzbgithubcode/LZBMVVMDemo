//
//  ViewController.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBCommitDataController.h"

@interface ViewController ()

@property (nonatomic, strong,nullable) LZBCommitDataController *dataVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

#pragma mark -
-(LZBCommitDataController *)dataVC
{
   if(_dataVC == nil)
   {
       _dataVC = [[LZBCommitDataController alloc]init];
   }
    return _dataVC;
}

@end
