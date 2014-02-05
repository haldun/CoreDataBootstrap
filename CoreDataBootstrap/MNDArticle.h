//
//  MNDArticle.h
//  CoreDataBootstrap
//
//  Created by Haldun Bayhantopcu on 05/02/14.
//  Copyright (c) 2014 Monoid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MNDArticle : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * contents;
@property (nonatomic, retain) NSDate * createdAt;

@end
