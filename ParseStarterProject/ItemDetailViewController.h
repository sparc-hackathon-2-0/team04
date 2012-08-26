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
- (id)initWithSupply:(PFObject*)supply;
@end
