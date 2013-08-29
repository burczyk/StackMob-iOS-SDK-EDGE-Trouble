//
//  Profile.h
//  StackMobEDGETest
//
//  Created by Kamil Burczyk on 29.08.2013.
//  Copyright (c) 2013 Sigmapoint. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Profile : NSManagedObject

@property (nonatomic, retain) NSString * profileId;
@property (nonatomic, retain) NSString * photo;

@end
