//
//  MineViewController.m
//  YYIM
//
//  Created by Jobs on 2018/7/10.
//  Copyright © 2018年 Jobs. All rights reserved.
//

#import "MineViewController.h"
#import "MyFriendsViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavi];
    [self initUI];

    // Do any additional setup after loading the view.
}

-(void)initNavi{
    self.title = @"我的";
}
-(void)initUI{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, NaviHeight, 100, 30)];
    [btn setTitle:@"我的好友" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(jumpToMyFriend) forControlEvents:UIControlEventTouchUpInside];

    
}
-(void)jumpToMyFriend{
    [self.navigationController pushViewController:[MyFriendsViewController new] animated:YES];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end