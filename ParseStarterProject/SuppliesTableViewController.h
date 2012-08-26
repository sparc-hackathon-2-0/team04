//
//  SuppliesTableViewController.h
//  Lendable
//
//  Created by Jason Rikard on 8/25/12.
//
//

#import <Parse/Parse.h>
#import "AddItemViewController.h"
#import "ItemDetailViewController.h"



@interface SuppliesTableViewController : PFQueryTableViewController<AddSuppliesDelegate>
@end
