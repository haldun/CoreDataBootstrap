//
//  MNDCoreDataTableViewController.h
//  CoreDataBootstrap
//
//  Created by Haldun Bayhantopcu on 05/02/14.
//  Copyright (c) 2014 Monoid. All rights reserved.
//

@import UIKit;
@import CoreData;

@interface MNDCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchRequest *fetchRequest;

- (void)performFetch;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
