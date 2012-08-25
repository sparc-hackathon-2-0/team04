//
//  DIYLessonViewController.m
//  Lendable
//
//  Created by Jonathan Mayhak on 8/25/12.
//
//

#import "DIYLessonViewController.h"
#import "Parse/Parse.h"

@interface DIYLessonViewController ()

@end

@implementation DIYLessonViewController
@synthesize WebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithLesson:(PFObject*)lesson
{
    self = [self initWithNibName:@"DIYLessonViewController" bundle:nil];
    
    if (self) {
        NSString *title = [lesson objectForKey:@"title"];
     
        self.title = title;
    }
    
    return self;
}

-(void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    NSString *urlAddress = @"http://artofmanliness.com/2011/10/27/make-a-dining-room-table-by-thanksgiving/";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.WebView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [WebView release];
    [super dealloc];
}
@end
