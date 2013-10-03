//
//  LakeAppleMapViewController.m
//  LakeAppleMap
//
//  Created by lake on 9/25/13.
//  Copyright (c) 2013 Lake. All rights reserved.
//

#import "LakeAppleMapViewController.h"
#define METER_MILE 1609.344

@interface LakeAppleMapViewController ()

@end

@implementation LakeAppleMapViewController
@synthesize mapView = _mapView;
@synthesize text = _text;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   self.text.delegate = self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.text resignFirstResponder];
    
}

-(BOOL)textFieldShouldReturn: (UITextField*)text
{
    
    [text resignFirstResponder];
    return NO;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    CLLocationCoordinate2D zoomLocation;
     zoomLocation.latitude = -63.86;
    zoomLocation.longitude =  101.20;
    
    
    MKCoordinateRegion viewRegion =
    MKCoordinateRegionMakeWithDistance(zoomLocation, 0.9*METER_MILE, 0.9*METER_MILE);
    
    [self.mapView setRegion:viewRegion animated:YES];
    
    self.mapView.showsUserLocation = YES;
    
    [self.mapView setShowsUserLocation:YES];
    
    
    //make the marker
    MKPointAnnotation * marker = [[MKPointAnnotation alloc] init];
    //set the coodinate
    marker.coordinate = zoomLocation;
    marker.title = @"Test";
    marker.subtitle = @"small test";
    
    //add the marker
    [self.mapView addAnnotation:marker];
 

    
    //Getting user's current location
    CLLocationCoordinate2D userCoord;
    
    userCoord.latitude = self.mapView.userLocation.coordinate.latitude;
    userCoord.longitude = self.mapView.userLocation.coordinate.longitude;
    
    //setting user's current location
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
