//
//  FLHPersonViewController.m
//  FLHSlideMenuDemo
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FLHPersonViewController.h"
#import "FLHMyWalletViewController.h"
#import "FLHPushBaseViewController.h"
#import "FLHProfileCell.h"
#import "FLHCommonItem.h"

static NSString *const FLHProfileCellIdentifier = @"FLHProfileCellIdentifier";
@interface FLHPersonViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView  *mTableView;
@property (nonatomic, strong)UIImageView  *headerImgView;
@property (nonatomic, strong)NSArray      *dataArray;

@end

@implementation FLHPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getOwnerUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.mTableView.frame = self.view.bounds;
    self.headerImgView.frame = CGRectMake(self.mTableView.frame.size.width / 2 - 36, 39, 72, 72);
}

- (void)getOwnerUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.scrollEnabled = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    [tableView registerClass:[FLHProfileCell class] forCellReuseIdentifier:FLHProfileCellIdentifier];
    [self.view addSubview:tableView];
    self.mTableView = tableView;
    
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:247 / 255.0 blue:250 / 255.0 alpha:1.0];
    headerView.frame = CGRectMake(0, 0, 0, 150);
    tableView.tableHeaderView = headerView;
    tableView.tableHeaderView = headerView;
    
    /** 头像图片 */
    UIImageView *headerImgView = [[UIImageView alloc] init];
    headerImgView.image = [UIImage imageNamed:@"avatar_login"];
    headerImgView.frame = CGRectMake(tableView.frame.size.width / 2 - 36, 39, 72, 72);
    headerImgView.layer.cornerRadius = 36;
    headerImgView.clipsToBounds = YES;
    [headerView addSubview:headerImgView];
    self.headerImgView = headerImgView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [headerView addGestureRecognizer:tap];
    
    [self setupData];
}

- (void)setupData {
    
    FLHCommonItem *myWallet = [FLHCommonItem itemWithIcon:@"menu_wallet" title:@"我的钱包" subtitle:@"" destVcClass:[FLHMyWalletViewController class]];
    
    FLHCommonItem *myCoupon = [FLHCommonItem itemWithIcon:@"menu_promo" title:@"我的卡券" subtitle:@"" destVcClass:[FLHMyWalletViewController class]];
    
    FLHCommonItem *myTrip = [FLHCommonItem itemWithIcon:@"menu_trips" title:@"我的行程" subtitle:nil destVcClass:[FLHMyWalletViewController class]];
    
    FLHCommonItem *myFriend = [FLHCommonItem itemWithIcon:@"menu_invite" title:@"邀请好友" subtitle:nil destVcClass:[FLHMyWalletViewController class]];
    
    FLHCommonItem *mySticker = [FLHCommonItem itemWithIcon:@"menu_sticker" title:@"我的贴纸" subtitle:nil destVcClass:[FLHMyWalletViewController class]];
    self.dataArray = @[myWallet, myCoupon, myTrip, myFriend, mySticker];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Other Action
- (void)tapAction: (UITapGestureRecognizer *)tapGestureRecognizer{
    NSLog(@"头像");
    FLHPushBaseViewController *vc = [[FLHPushBaseViewController alloc] init];
    vc.view.backgroundColor = [UIColor greenColor];
    vc.animateViewController = (FLHAnimateViewController *)self.parentViewController;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FLHProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:FLHProfileCellIdentifier forIndexPath:indexPath];
    cell.item = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FLHCommonItem *item = self.dataArray[indexPath.row];
    if (item.destVcClass == nil) return;
    
    FLHPushBaseViewController *vc = [[item.destVcClass alloc] init];
    vc.title = item.title;
    vc.animateViewController = (FLHAnimateViewController *)self.parentViewController;
    [self.parentViewController.navigationController pushViewController:vc animated:YES];
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
