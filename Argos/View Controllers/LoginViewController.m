//
//  LoginViewController.m
//  Argos
//
//  Created by Francis Tseng on 1/27/14.
//  Copyright (c) 2014 Argos. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "EventListViewController.h"
#import "MenuViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor primaryColor];
    
    [self setupUI];
}

- (void)facebookLoginButtonPressed:(id)sender
{
    // Implement oauth flow
    [self postLogin];
}

- (void)twitterLoginButtonPressed:(id)sender
{
    // Implement oauth flow
    [self postLogin];
}

- (void)googleLoginButtonPressed:(id)sender
{
    // Implement oauth flow
    [self postLogin];
}

- (void)postLogin
{
    EventListViewController *elvc = [[EventListViewController alloc] initWithTitle:@"Latest" endpoint:@"/events"];
    elvc.managedObjectContext = self.managedObjectContext;
    
    // Add background for the status bar, so the slide-out menu transition looks better.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor = [UIColor colorWithRed:0.133 green:0.22 blue:0.286 alpha:1.0];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.window addSubview:view];
    
    // Setup the slide-out menu.
    MenuViewController* menuController = [[MenuViewController alloc] init];
    appDelegate.deckController.leftController = menuController;
    
    [self.navigationController pushViewController:elvc animated:YES];
}

- (void)setupUI
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat buttonWidth = 200;
    CGFloat buttonHeight = 50;
    CGFloat buttonMargin = 25;
    
    // Create login buttons
    UIButton *facebookLoginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    facebookLoginButton.frame = CGRectMake(screenWidth/2 - buttonWidth/2, screenHeight/2 - buttonHeight/2, buttonWidth, buttonHeight);
    [facebookLoginButton setTitle:@"Login with Facebook" forState:UIControlStateNormal];
    [facebookLoginButton setBackgroundColor:[UIColor colorWithRed:0.263 green:0.376 blue:0.612 alpha:1.0]];
    [facebookLoginButton setTintColor:[UIColor whiteColor]];
    [[facebookLoginButton layer] setCornerRadius:4.0];
    [facebookLoginButton addTarget:self action:@selector(facebookLoginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookLoginButton];
    
    UIButton *twitterLoginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    twitterLoginButton.frame = CGRectMake(screenWidth/2 - buttonWidth/2, facebookLoginButton.frame.origin.y - (buttonMargin + buttonHeight), buttonWidth, buttonHeight);
    [twitterLoginButton setTitle:@"Login with Twitter" forState:UIControlStateNormal];
    [twitterLoginButton setBackgroundColor:[UIColor colorWithRed:0 green:0.69 blue:0.929 alpha:1.0]];
    [twitterLoginButton setTintColor:[UIColor whiteColor]];
    [twitterLoginButton addTarget:self action:@selector(twitterLoginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [[twitterLoginButton layer] setCornerRadius:4.0];
    [self.view addSubview:twitterLoginButton];
    
    UIButton *googleLoginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    googleLoginButton.frame = CGRectMake(screenWidth/2 - buttonWidth/2, facebookLoginButton.frame.origin.y + (buttonMargin + buttonHeight), buttonWidth, buttonHeight);
    [googleLoginButton setTitle:@"Login with Google" forState:UIControlStateNormal];
    [googleLoginButton setBackgroundColor:[UIColor colorWithRed:0.827 green:0.243 blue:0.165 alpha:1.0]];
    [googleLoginButton setTintColor:[UIColor whiteColor]];
    [googleLoginButton addTarget:self action:@selector(googleLoginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [[googleLoginButton layer] setCornerRadius:4.0];
    [self.view addSubview:googleLoginButton];
}

@end