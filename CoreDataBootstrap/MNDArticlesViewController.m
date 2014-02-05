//
//  MNDArticlesViewController.m
//  CoreDataBootstrap
//
//  Created by Haldun Bayhantopcu on 05/02/14.
//  Copyright (c) 2014 Monoid. All rights reserved.
//

#import "MNDArticlesViewController.h"
#import "MNDArticle.h"

@interface MNDArticlesViewController ()

@end

@implementation MNDArticlesViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self performFetch];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
  MNDArticle *article = [self.fetchedResultsController objectAtIndexPath:indexPath];
  cell.textLabel.text = article.title;
  cell.detailTextLabel.text = [article.createdAt description];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"ArticleCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  [self configureCell:cell atIndexPath:indexPath];
  return cell;
}

@end
