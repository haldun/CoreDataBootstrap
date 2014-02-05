//
//  MNDDataModelHelper.h
//  CoreDataBootstrap
//
//  Created by Haldun Bayhantopcu on 05/02/14.
//  Copyright (c) 2014 Monoid. All rights reserved.
//

@import Foundation;
@import CoreData;

@interface MNDDataModelHelper : NSObject

@property (strong, readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, readonly, nonatomic) NSManagedObjectContext *mainObjectContext;

+ (instancetype)sharedHelper;

@end
