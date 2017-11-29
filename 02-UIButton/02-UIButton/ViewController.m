//
//  ViewController.m
//  02-UIButton
//
//  Created by Captain on 2016/11/13.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "ViewController.h"

#define kMovingDelta 80

typedef enum{
    kMovingDirTop = 10,
    kMovingDirLeft,
    kMovingDirRight,
    kMovingDirBottom,
}kMovingDir;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *headImageView;

@end

@implementation ViewController


- (IBAction)move:(UIButton *)button {
    //CGRect rect = self.headImageView.frame;
    CGPoint p = self.headImageView.center;
    
    switch (button.tag) {
        case kMovingDirTop:
            p.y -=  kMovingDelta;
            break;
        case kMovingDirLeft:
            p.x -=  kMovingDelta;
            break;
        case kMovingDirRight:
            p.x +=  kMovingDelta;
            break;
        case kMovingDirBottom:
            p.y +=  kMovingDelta;
            break;
        }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.headImageView.center = p;
    
    [UIView commitAnimations];
    
}

- (IBAction)zoom:(UIButton *)button {
    CGRect rect = self.headImageView.bounds;
    
    if (button.tag) {
        rect.size.width +=30;
        rect.size.height +=30;
    }
    else{
        rect.size.width -=30;
        rect.size.height -=30;
    }
    
    //首尾动画
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
   
    self.headImageView.bounds= rect;
    
//    [UIView commitAnimations];
    
}
- (IBAction)rotate:(UIButton *)button {
    if(button.tag){
    self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, -M_PI_2);
    }
    else{
    self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, M_PI_2);
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headImageView.layer.cornerRadius = 10;
    self.headImageView.layer.masksToBounds = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
