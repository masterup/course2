//
//  ViewController.m
//  CoreData
//
//  Created by Igor Tomych on 9/8/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import "ViewController.h"
#import "Ticket.h"
#import "Answer.h"
#import "Question.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize managedContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Ticket" inManagedObjectContext:self.managedContext];
    
    [fetchRequest setEntity:entity];
    
    NSError* error = nil;
    
    NSArray* results = [self.managedContext executeFetchRequest:fetchRequest error:&error];
    
    Ticket* ticket = [results lastObject];
    
    NSScanner
    NSLog(@"%@", ticket.questions);
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

@end
