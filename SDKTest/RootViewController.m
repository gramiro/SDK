//
//  RootViewController.m
//  SDKTest
//
//  Created by Ramiro Guerrero on 20/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RootViewController.h"
#import "DemoViewController.h"
#import "AFOAuth2Client.h"
#import "TestSDKAPI.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(performLogin) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setFrame:CGRectMake(self.view.bounds.size.width/2 - 50, self.view.bounds.size.height/2 - 20, 100, 40)];
    
    [self.view addSubview:loginButton];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)performLogin{
    [[TestSDKAPI sharedClient] authorizeWithScopes:[NSArray arrayWithObjects:@"basic", nil]];
}


@end
