//
//  DetailViewController.m
//  iOSFont
//
//  Created by dominic_lian on 2017/9/12.
//  Copyright © 2017年 dominic. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, copy) NSString *familyName;
@property (nonatomic, copy) NSString *fontName;

@end



@implementation DetailViewController

- (instancetype)initWithFamilyName:(NSString *)familyName FontName:(NSString *)fontName {
    self = [super init];
    if (self) {
        self.familyName = familyName;
        self.fontName = fontName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label_1 = [[UILabel alloc] init];
    
    label_1.text = _familyName;
    label_1.frame = CGRectMake(10, 64, [UIScreen mainScreen].bounds.size.width - 20, 30);
    label_1.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label_1];
    
    
    UILabel *label_2 = [[UILabel alloc] init];
    
    label_2.text = _fontName;
    label_2.frame = CGRectMake(10, 30 + 64, [UIScreen mainScreen].bounds.size.width - 20, 30);
    label_2.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label_2];
    
    
    UILabel *label_3 = [[UILabel alloc] init];
    
    label_3.frame = CGRectMake(20, 60 + 64, [UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.height - 60 - 64);
    label_3.font = [UIFont fontWithName:_fontName size:40];
    label_3.numberOfLines = 0;
    
    label_3.textAlignment = NSTextAlignmentCenter;
    
    label_3.text = @"1234567890\nABCDEFGHIJKLMNOPQRSTUVWXYZ\nabcdefghijklmnopqrstuvwxyz";
    
    [self.view addSubview:label_3];
    
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
