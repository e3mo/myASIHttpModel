//
//  ViewController.m
//  testAsihttpModel
//
//  Created by wgdadmin on 12-9-8.
//  Copyright (c) 2012年 wgdadmin. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "NSObject+SBJson.h"
@interface ViewController ()

@end

@implementation ViewController


-(void)getDate:(id)sender
{
    NSString   *city = [NSString stringWithFormat:@"%@",nameField.text];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=true", city]];
    NSLog(@"city:%@",city);
    ASIHTTPRequest *request =[[[ASIHTTPRequest alloc] initWithURL:url]autorelease];
    request.delegate = self;
    [request startAsynchronous];
    
}

- (void)viewDidLoad
{
    UIButton    *mapBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    [mapBtn setTitle:@"get" forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(getDate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mapBtn];
    [mapBtn release];
    
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 80, 30)];
    [self.view addSubview:nameField];
    nameField.backgroundColor = [UIColor redColor];
    nameField.delegate = self;
    [nameField release];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *string = [request responseString];
    NSDictionary *dic = [string JSONValue];
    id result = [dic objectForKey:@"results"];
    NSLog(@"string:%@",string);
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"failed:%@",request.error);
}

#pragma mark -textFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [nameField resignFirstResponder];
    return YES;
}
@end
