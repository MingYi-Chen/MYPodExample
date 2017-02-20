//
//  main.m
//  MYPodExample
//
//  Created by Ming Yi Chen on 17/02/2017.
//  Copyright © 2017 Ming Yi Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


#import <FBAllocationTracker/FBAllocationTrackerManager.h>


int main(int argc, char * argv[]) {
    [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
    [[FBAllocationTrackerManager sharedManager] enableGenerations];

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
