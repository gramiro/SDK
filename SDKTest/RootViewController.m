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
    
    [self performSelector:@selector(LoginWithNoAnimation) withObject:nil afterDelay:0.1f];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)performLogin{
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"accessToken"]) {
        DemoViewController *demoVC = [[DemoViewController alloc] init];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:demoVC];
        
        [self presentModalViewController:navController animated:YES];
    } else
    {
    [[TestSDKAPI sharedClient] authorizeWithScopes:[NSArray arrayWithObjects:@"basic", nil]];
    [[TestSDKAPI sharedClient] setLoginDelegate:self];
    }
}

-(void)performLoginFromHandle{
    [self performLogin];
}

-(void)LoginWithNoAnimation{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"accessToken"]) {
        DemoViewController *demoVC = [[DemoViewController alloc] init];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:demoVC];
        
        [self presentModalViewController:navController animated:NO];
    }
}

@end
