//
//  MainViewController.m
//  RandomCheck
//
//  Created by Douglas, David on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize maxValue,resultsView,resultsArray,noOfTests,randType,resultsOrderView;

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)testRandomness:(id)sender
{
    NSNumber *maxVal = [[NSNumber alloc] initWithInteger:[[[self maxValue] text] integerValue]];
    NSNumber *tests = [[NSNumber alloc] initWithInteger:[[[self noOfTests] text] integerValue]];
    
    [self setResultsArray:[[NSMutableArray alloc] init]];
    
    for (int i = 0; i < [maxVal intValue]; i++)
    {
        NSNumber *newObj = [[NSNumber alloc] initWithInteger:0];
        [[self resultsArray] addObject:newObj];
        [newObj release];
    }
    
    int newVal = 0;
    srandom(time(NULL));
    NSString *resultsOrderString = @"";
    
    for (int j = 0; j < [tests intValue]; j++) 
    {
        if ([[self randType] selectedSegmentIndex] == 0)
        {
            newVal = rand() % [maxVal intValue];
        }
        else
        {
            newVal = arc4random() % [maxVal intValue];
        }
        
        resultsOrderString = [resultsOrderString stringByAppendingFormat:@"%i,",newVal];
        
        NSNumber *newCount = [[NSNumber alloc] initWithInt:[[[self resultsArray] objectAtIndex:newVal] intValue] + 1];
        
        [[self resultsArray] replaceObjectAtIndex:newVal withObject:newCount];
        
        [newCount release];
    }
    
    NSString *resultString = @"";
    
    for (int i = 0; i < [maxVal intValue]; i++)
    {
        resultString = [resultString stringByAppendingFormat:@"%i ==> %i \n",i,[[[self resultsArray] objectAtIndex:i] intValue]];
    }
    
    [[self resultsView] setText:resultString];
    [[self resultsOrderView] setText:resultsOrderString];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [maxValue release];
    [resultsView release];
    [resultsArray release];
    [noOfTests release];
    [randType release];
    [resultsOrderView release];
    
    [super dealloc];
}

@end
