//
//  ViewController.m
//  01-加法计算器
//
//  Created by Captain on 2016/11/13.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UITextField *num1;
@property (nonatomic,weak) IBOutlet UITextField *num2;
@property (nonatomic,weak) IBOutlet UILabel *sumlabel;
@property (nonatomic,weak) IBOutlet UITextField *sum;




@end

@implementation ViewController



- (IBAction)compute:(UIButton *)sender {
    
    NSString *str1 = self.num1.text;
    NSString *str2 = self.num2.text;
    
    int result = str1.intValue + str2.intValue ;
    
    self.sum.text = [NSString stringWithFormat:@"%d",result];
    
    [self.num1 resignFirstResponder];
    [self.num2 resignFirstResponder];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
