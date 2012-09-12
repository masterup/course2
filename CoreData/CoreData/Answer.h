//
//  Answer.h
//  CoreData
//
//  Created by Igor Tomych on 9/12/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface Answer : NSManagedObject

@property (nonatomic, retain) NSString * answerText;
@property (nonatomic, retain) NSString * aswerImage;
@property (nonatomic, retain) NSNumber * isCorrentAnswer;
@property (nonatomic, retain) Question *question;

@end
