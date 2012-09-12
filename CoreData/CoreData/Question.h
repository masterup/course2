//
//  Question.h
//  CoreData
//
//  Created by Igor Tomych on 9/12/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answer, Ticket;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * questionText;
@property (nonatomic, retain) NSString * questionImage;
@property (nonatomic, retain) Ticket *ticket;
@property (nonatomic, retain) NSSet *answers;
@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addAnswersObject:(Answer *)value;
- (void)removeAnswersObject:(Answer *)value;
- (void)addAnswers:(NSSet *)values;
- (void)removeAnswers:(NSSet *)values;

@end
