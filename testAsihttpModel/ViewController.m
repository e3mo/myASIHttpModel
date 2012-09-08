//
//  ViewController.m
//  testAsihttpModel
//
//  Created by wgdadmin on 12-9-8.
//  Copyright (c) 2012年 wgdadmin. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    ASIHTTPRequest *request =[[ASIHTTPRequest alloc] initWithURL:[[[NSURL alloc] initWithString:@"http://www.baidu.com"]autorelease]];
    request.delegate = self;
    [request startAsynchronous];
    
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
    NSLog(@"string:%@",string);
}
@end
