//
//  ZSViewController.m
//  ZSTip
//
//  Created by zs1040466634 on 03/25/2020.
//  Copyright (c) 2020 zs1040466634. All rights reserved.
//

#import "ZSViewController.h"
#import "WYBroadcastingTipView.h"

@interface ZSViewController ()

@end

@implementation ZSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    WYBroadcastingTipView *tipView = [[WYBroadcastingTipView alloc]initWithTitle:@"标题" subTitle:nil description:@"描述"];
    [self.view addSubview:tipView];
    [tipView showWithAnimationCompletion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
