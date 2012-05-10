//
//  ViewController.m
//  testGradient
//
//  Created by Emma Steimann on 3/7/12.
//  Copyright (c) 2012
//

#import "ViewController.h"
#import "GradientView.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    } 
    return self;
}

- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.]
    UIView* v = [[UIView alloc] init];
    v.backgroundColor = [UIColor greenColor];
    self.view = v;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    NSLog(@"size of winfow %f", screenRect.size.width);
    [v addSubview:[[GradientView alloc] initWithFrame:CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width,  screenRect.size.height) withSize:CGSizeMake(300, 100) withAngle:45]];
    
    
}

- (void)viewDidLoad
{
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
	return YES;
}

@end
