//
//  StrechyHeaderExampleViewController.m
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/4.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "StrechyHeaderExampleViewController.h"

NSString* const kCellIdentifier=@"cellIdentifier";

@interface StrechyHeaderExampleViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation StrechyHeaderExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
}

@end
