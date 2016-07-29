//
//  ViewController.m
//  GoMoApp
//
//  Created by Peter Jihoon Kim on 7/29/16.
//  Copyright © 2016 Peter Jihoon Kim. All rights reserved.
//

#import "ViewController.h"
#import <Gomoapp/Gomoapp.h>

@interface ViewController () {
    IBOutlet UILabel *label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [label setText:GoGomoappFooInJSON(@"{\"foo\":\"hello worldddddddddd\"}")];
    //[label setText:GoGomoappHTTPGet(@"https://www.example.com/")];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        long t = 0;
        while(t < 10) {
            t = GoGomoappTick();
            dispatch_async(dispatch_get_main_queue(), ^{
                [label setText:[NSString stringWithFormat:@"tick: %ld", t]];
            });
        }
    });
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *t = GoGomoappGoRoutine();
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [label setText:t];
//        });
//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
