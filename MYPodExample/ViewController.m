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
#import "Department.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
#import <FBAllocationTracker/FBAllocationTrackerManager.h>
#import <FBMemoryProfiler/FBMemoryProfiler.h>


@interface ViewController ()
@property (nonatomic,strong) MYCTestView *testView;
@property (nonatomic,strong) MYCCircleView *circleView;
@property (nonatomic,strong) UIButton *addViewBtn;
@property (nonatomic,strong) FBMemoryProfiler *memoryProfiler;
@property (nonatomic,strong) ViewController *aViewController;
@property (nonatomic,strong) Department * department;
@end

@implementation ViewController
- (void)dealloc {
//    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    CFStringRef str = CFStringCreateWithCString(NULL, "Hello World!", kCFStringEncodingMacRoman);
    
    NSString * aNSString = (__bridge NSString *)str;
    
//    NSLog(@"%@", aNSString);
    
    self.memoryProfiler = [FBMemoryProfiler new];
    [_memoryProfiler enable];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    MYLib* mylib = [[MYLib alloc] init];
//    NSLog(@"%ld", [mylib add]);
    
    self.testView = [[MYCTestView alloc] init];
    [_testView setFrame:self.view.bounds];
    [_testView addCustomedLayer];
    [self.view addSubview:_testView];

    
    
    [[FBAllocationTrackerManager sharedManager] markGeneration];

    
    self.circleView = [[MYCCircleView alloc] init];
    [_circleView setFrame:CGRectInset(self.view.bounds, 100, 100)];
    [self.view addSubview:_circleView];
    

 
    Person * person = [[Person alloc] init];
    self.department = [[Department alloc] init];
    person.department = _department;
    _department.person = person;
    
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:person];
    NSSet *retainCycles = [detector findRetainCycles];
//    NSLog(@"%@", retainCycles);
    
    self.addViewBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [_addViewBtn setFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:_addViewBtn];
    [_addViewBtn addTarget:self action:@selector(addView:) forControlEvents:UIControlEventTouchDown];
    
    [self doSomething];
}

- (void)doSomething {
    [[FBAllocationTrackerManager sharedManager] enableGenerations];
    
#warning test
    
    // Object a will be kept in generation with index 0
    NSObject *a = [NSObject new];
    
    // We are marking new generation
    [[FBAllocationTrackerManager sharedManager] markGeneration];
    
    // Objects b and c will be kept in second generation at index 1
    NSObject *b = [NSObject new];
    NSObject *c = [NSObject new];
    
    [[FBAllocationTrackerManager sharedManager] markGeneration];
    
    // Object d will be kept in third generation at index 2
    NSObject *d = [NSObject new];
    
    NSArray *instances =[[FBAllocationTrackerManager sharedManager] instancesForClass:[NSObject class]
                                                                         inGeneration:0];
    
//    NSLog(@"%@",instances);
    instances =[[FBAllocationTrackerManager sharedManager] instancesForClass:[NSObject class]
                                                                inGeneration:1];
//    NSLog(@"%@",instances);
    instances =[[FBAllocationTrackerManager sharedManager] instancesForClass:[NSObject class]
                                                                inGeneration:2];
//    NSLog(@"%@",instances);
    instances =[[FBAllocationTrackerManager sharedManager] instancesForClass:[NSObject class]
                                                                inGeneration:3];
    
//    NSLog(@"%@",instances);
}

- (IBAction)addView:(id)sender {
    if (_aViewController) {
        [_aViewController.view removeFromSuperview];
        self.aViewController = nil;
    }
    else {
        self.aViewController = [[ViewController alloc] init];
        [_aViewController.view setFrame:CGRectMake(100,100, 200, 200)];
        _aViewController.view.clipsToBounds = YES;
        [self.view addSubview:_aViewController.view];
    }
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
