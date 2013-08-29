//
//  User.h
//  StackMobEDGETest
//
//  Created by Kamil Burczyk on 29.08.2013.
//  Copyright (c) 2013 Sigmapoint. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * userId;

@end
