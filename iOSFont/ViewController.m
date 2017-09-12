//
//  ViewController.m
//  iOSFont
//
//  Created by dominic_lian on 2017/9/12.
//  Copyright © 2017年 dominic. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"iOS Font";
    
    [self setFont];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellReuse"];
}



- (void)setFont {
    NSArray *familyNames = [UIFont familyNames];
    for(NSString *familyName in familyNames)
    {
        NSLog(@"%@", familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for(NSString *fontName in fontNames)
        {
            NSLog(@"\t%@", fontName);
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray *familyNames = [UIFont familyNames];
    return familyNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = familyNames[section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    return fontNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        

    } else {
        for (UIView *view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = familyNames[indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = fontNames[indexPath.row];
    
    UILabel *label = [[UILabel alloc] init];
    
    label.font = [UIFont fontWithName:fontName size:22];
    label.frame = CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 40, 80);
    label.numberOfLines = 2;
    
    label.text = fontName;
    
    [cell.contentView addSubview:label];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = familyNames[indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = fontNames[indexPath.row];
    
    DetailViewController *detail = [[DetailViewController alloc] initWithFamilyName:familyName FontName:fontName];
    
    [self.navigationController pushViewController:detail animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
