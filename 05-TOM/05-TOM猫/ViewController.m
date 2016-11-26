//
//  ViewController.m
//  05-TOM猫
//
//  Created by Captain on 2016/11/23.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
 
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation ViewController


-(void)tomAnimation:(NSString *) img count:(int)count{
    
    if([self.tom isAnimating]) return;
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i<count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",img,i];
//        UIImage *image = [UIImage imageNamed:imageName];
        NSString *path = [[NSBundle mainBundle]pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        [arrayM addObject:image];
        
    }
    [self.tom setAnimationImages:arrayM];
    
    
    [self.tom startAnimating];
    [self.tom setAnimationDuration: arrayM.count * 0.075];
    [self.tom setAnimationRepeatCount:1];
    
//    [self performSelector:@selector(clearTom) withObject:nil afterDelay:self.tom.animationDuration];
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil  afterDelay:self.tom.animationDuration];

}

//-(void)clearTom{
//    self.tom.animationImages =nil;
//}

- (IBAction)drink {
    [self tomAnimation:@"drink" count:81 ];
}
- (IBAction)head{
    [self tomAnimation:@"knockout" count:81 ];
}

- (IBAction)rightFoot:(id)sender {
    [self tomAnimation:@"footRight" count:30 ];
}

- (IBAction)leftFoot:(id)sender {
    [self tomAnimation:@"footLeft" count:30 ];
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
