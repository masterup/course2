//
//  Ticket.h
//  CoreData
//
//  Created by Igor Tomych on 9/12/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface Ticket : NSManagedObject

@property (nonatomic, retain) NSNumber * ticketNumber;
@property (nonatomic, retain) NSSet *questions;
@end

@interface Ticket (CoreDataGeneratedAccessors)

- (void)addQuestionsObject:(Question *)value;
- (void)removeQuestionsObject:(Question *)value;
- (void)addQuestions:(NSSet *)values;
- (void)removeQuestions:(NSSet *)values;

@end
