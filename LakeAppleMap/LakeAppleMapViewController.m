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

-(BOOL)textFieldShouldReturn: (UITextField*)text
{
    
    [text resignFirstResponder];
    return NO;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    double lat = -33.86;
    double longi = 151.20;
    CLLocationCoordinate2D zoomLocation;
     zoomLocation.latitude = lat;
    zoomLocation.longitude =  longi;
    
    CLLocationCoordinate2D otherMarkers;
    otherMarkers.latitude = lat;
    otherMarkers.longitude = longi;
    
    
    MKCoordinateRegion viewRegion =
    MKCoordinateRegionMakeWithDistance(zoomLocation, 0.9*METER_MILE, 0.9*METER_MILE);
    
    [self.mapView setRegion:viewRegion animated:YES];
    
    self.mapView.showsUserLocation = YES;
    
    [self.mapView setShowsUserLocation:YES];
    
    
    //make the marker
    MKPointAnnotation * marker = [[MKPointAnnotation alloc] init];
    //set the coodinate
    marker.coordinate = zoomLocation;
    marker.title = @"Sample NGO";
    marker.subtitle = @"NGO Type";
    
    //add the marker
    [self.mapView addAnnotation:marker];
 
    otherMarkers.latitude = lat+.003;
    otherMarkers.longitude = longi-.003;
    
    MKPointAnnotation * marker2 = [[MKPointAnnotation alloc] init];
    //set the coodinate
    marker2.coordinate = otherMarkers;

    [self.mapView addAnnotation:marker2];
    
    otherMarkers.latitude = lat-.003;
    otherMarkers.longitude = longi+.003;
    
    MKPointAnnotation * marker3 = [[MKPointAnnotation alloc] init];
    //set the coodinate
    marker3.coordinate = otherMarkers;
    
    [self.mapView addAnnotation:marker3];

    
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
