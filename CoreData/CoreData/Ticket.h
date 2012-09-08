//
//  Ticket.h
//  CoreData
//
//  Created by Igor Tomych on 9/8/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Ticket : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * question;
@property (nonatomic, retain) NSNumber * ticketNumber;

@end
