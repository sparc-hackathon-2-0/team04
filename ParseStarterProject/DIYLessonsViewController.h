//
//  DIYLessonsControllerView.h
//  Lendable
//
//  Created by Jonathan Mayhak on 8/25/12.
//
//

#import <Parse/Parse.h>

@interface DIYLessonsViewController : PFQueryTableViewController

@property (atomic, assign) NSObject *category;

-(id) initWithIndex:(NSIndexPath*)index;

@end

