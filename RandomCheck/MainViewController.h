//
//  MainViewController.h
//  RandomCheck
//
//  Created by Douglas, David on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate,UITextFieldDelegate> {
    
}

@property (nonatomic,retain) IBOutlet UITextField *maxValue;
@property (nonatomic,retain) IBOutlet UITextField *noOfTests;
@property (nonatomic,retain) IBOutlet UITextView *resultsView;
@property (nonatomic,retain) IBOutlet UITextView *resultsOrderView;
@property (nonatomic,retain) IBOutlet UISegmentedControl *randType;
@property (nonatomic,retain) NSMutableArray *resultsArray;

- (IBAction)showInfo:(id)sender;
- (IBAction)testRandomness:(id)sender;

@end
