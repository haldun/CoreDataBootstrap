//
//  MNDDataModelHelper.m
//  CoreDataBootstrap
//
//  Created by Haldun Bayhantopcu on 05/02/14.
//  Copyright (c) 2014 Monoid. All rights reserved.
//

#import "MNDDataModelHelper.h"

@interface MNDDataModelHelper ()

@property (strong, readwrite, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, readwrite, nonatomic) NSManagedObjectContext *mainObjectContext;
@property (strong, readwrite, nonatomic) NSManagedObjectModel *managedObjectModel;

@end

@implementation MNDDataModelHelper

+ (instancetype)sharedHelper
{
  static MNDDataModelHelper *_dataModelHelper = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _dataModelHelper = [[MNDDataModelHelper alloc] init];
  });
  return _dataModelHelper;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self setup];
  }
  return self;
}

- (NSString *)modelName
{
  return @"Model";
}

- (NSString *)databaseFileName
{
  return @"db.sqlite3";
}

- (NSDictionary *)persistentStoreCoordinatorOptions
{
  return @{
           NSMigratePersistentStoresAutomaticallyOption: @YES,
           NSInferMappingModelAutomaticallyOption: @YES
           };
}

- (NSManagedObjectContext *)mainObjectContext
{
  if (!_mainObjectContext) {
    _mainObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _mainObjectContext.persistentStoreCoordinator = _persistentStoreCoordinator;
  }
  return _mainObjectContext;
}

- (void)setup
{
  // setup managed object model
  NSString *pathToModel = [[NSBundle mainBundle] pathForResource:[self modelName] ofType:@"momd"];
  NSURL *storeURL = [NSURL fileURLWithPath:pathToModel];
  _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:storeURL];
  
  // setup persistent coordinator
  _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
  NSString *dbFilename = [self databaseFileName];
  NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
  NSURL *dbURL = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingString:dbFilename]];
  
  NSError *error = nil;
  if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:nil
                                                           URL:dbURL
                                                       options:[self persistentStoreCoordinatorOptions]
                                                         error:&error]) {
    NSLog(@"Cannot initialize store: %@", error);
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"Could not create persistent store"
                                 userInfo:error.userInfo];
  }
}

@end
