//
//  ItemDetailViewController.h
//  Lendable
//
//  Created by Jason Rikard on 8/25/12.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ItemDetailViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *titlex;
@property (retain, nonatomic) IBOutlet UILabel *description;
@property (retain, nonatomic) PFObject *supply;
- (id)initWithSupply:(PFObject*)supply;
@property (atomic, assign) PFObject *supply;
@end
