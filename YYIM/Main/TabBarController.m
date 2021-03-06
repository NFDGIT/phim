//
//  TabBarController.m
//  PuJiYC
//
//  Created by penghui on 2018/1/30.
//  Copyright © 2018年 penghui. All rights reserved.
//

#import "TabBarController.h"



#import "MessageListViewController.h"
//#import "ContactsListViewController.h"
//#import "ContactsViewController.h"
//#import "MineViewController.h"
#import "MyFriendsViewController.h"
#import "MyGroupChatViewController.h"
#import "ContactsListViewController.h"



static TabBarController *shared = nil;

@interface TabBarController ()<UITabBarControllerDelegate>
@property (nonatomic,strong)NSMutableArray * tabbarItems;
@end

@implementation TabBarController
+ (TabBarController *)share{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[TabBarController alloc] init];
    });
    
    return shared;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initUI];
    

    
    
    
    // Do any additional setup after loading the view.
}
-(void)initData{
    
    
    _tabbarItems =  [NSMutableArray array];
    [_tabbarItems addObject:@{@"normalImg":@"tabbar_msg_nomal",@"selectedImg":@"tabbar_msg_selected",@"title":@"消息",@"controller":NSStringFromClass([MessageListViewController class])}];
    [_tabbarItems addObject:@{@"normalImg":@"tabbar_contacts_nomal",@"selectedImg":@"tabbar_contacts_selected",@"title":@"联系人",@"controller":NSStringFromClass([MyFriendsViewController class])}];
    [_tabbarItems addObject:@{@"normalImg":@"tabbar_groupchat_normal",@"selectedImg":@"tabbar_groupchat_selected",@"title":@"群聊",@"controller":NSStringFromClass([MyGroupChatViewController class])}];
    [_tabbarItems addObject:@{@"normalImg":@"tabbar_framework_nomal",@"selectedImg":@"tabbar_framework_selected",@"title":@"组织架构",@"controller":NSStringFromClass([ContactsListViewController class])}];

    
}
-(void)initUI{
    self.delegate = self;
    NSMutableArray * vcs = [NSMutableArray array];
    for (int i =0 ; i < _tabbarItems.count; i ++) {
        NSDictionary * currentDic =_tabbarItems[i];
        
        NSString * normalImg = [NSString stringWithFormat:@"%@",currentDic[@"normalImg"]];
        NSString * selectedImg = [NSString stringWithFormat:@"%@",currentDic[@"selectedImg"]];
        
        
        NSString * title = [NSString stringWithFormat:@"%@",currentDic[@"title"]];
        NSString * controllerString = [NSString stringWithFormat:@"%@",currentDic[@"controller"]];
        
        Class Class = NSClassFromString(controllerString);
        BaseViewController * controller = [Class new];
//        controller.navigationItem.title = [NSString stringWithFormat:@"%d",i];
//        if (i == 1) {
//            controller.hiddeNavi = YES;
//        }
        
        
        NavigationController * naviVC = [[NavigationController alloc]initWithRootViewController:controller];
        naviVC.tabBarItem.title = title;
        naviVC.tabBarItem.image = [UIImage imageNamed:normalImg];
        naviVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImg];
     
        
        [vcs addObject:naviVC];
    }
    
    self.tabBar.tintColor = ColorTheme;
    self.viewControllers =  vcs;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- delegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NSUInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    

    return YES;
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

