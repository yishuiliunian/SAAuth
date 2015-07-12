//
//  SAViewController.m
//  SAAuth
//
//  Created by stonedong on 03/26/2015.
//  Copyright (c) 2014 stonedong. All rights reserved.
//

#import "SAViewController.h"
#import <SAAuth/SAReqManager.h>
@interface SAViewController ()

@end

@implementation SAViewController

- (IBAction)requestAuth:(id)sender
{
    [[SAReqManager shareManager] requestWeiboAuth:^(SAToken *token, NSError *error) {
        
        if (error) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
            [alert show];
        }
    }];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
