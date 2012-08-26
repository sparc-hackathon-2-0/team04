//
//  ItemDetailViewController.m
//  Lendable
//
//  Created by Jason Rikard on 8/25/12.
//
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController
@synthesize titlex;
@synthesize description;
@synthesize supply;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithIndex:(NSIndexPath*)index
{
    titlex.text = @"test";
    description.text = @"test";
    
    return self;
}

- (id)initWithSupply:(PFObject*)supply
{
    
    if (self) {
        NSString *title = [supply objectForKey:@"title"];
        
        self.title = title;
        
        self.supply = supply;
    }
    self.supply = supply;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    //titlex.text = [supply objectForKey:@"title"];
    description.text = [supply objectForKey:@"description"];
    description.lineBreakMode = UILineBreakModeWordWrap;
    description.numberOfLines = 0;
    [description sizeToFit];
    

    
    // Do any additional setup after loading the view from its nib.
}

- (void)showPopup{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection"
                                                    message:@"You must be connected to the internet to use this app."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)viewDidUnload
{
    [self setTitle:nil];
    [self setDescription:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [titlex release];
    [description release];
    [super dealloc];
}
@end

