//
//  ViewController.m
//  MYPodExample
//
//  Created by Ming Yi Chen on 17/02/2017.
//  Copyright © 2017 Ming Yi Chen. All rights reserved.
//

#import "ViewController.h"
#import "MYLib/MYLib.h"
#import "MYLib/MYCTestView.h"
#import "MYLib/MYCCircleView.h"
@interface ViewController ()
@property (nonatomic,strong) MYCTestView *testView;
@property (nonatomic,strong) MYCCircleView *circleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MYLib* mylib = [[MYLib alloc] init];
    NSLog(@"%ld", [mylib add]);
    
    self.testView = [[MYCTestView alloc] init];
    [_testView setFrame:self.view.bounds];
    [_testView addCustomedLayer];
    [self.view addSubview:_testView];

    self.circleView = [[MYCCircleView alloc] init];
    [_circleView setFrame:CGRectInset(self.view.bounds, 100, 100)];
    [self.view addSubview:_circleView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
