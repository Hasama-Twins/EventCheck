# EventCheck
EventCheck is an iOS mobile application that allows college students to create and attend safe and secure events during COVID-19

[![](http://img.youtube.com/vi/bDuJI2K7Gj0/0.jpg)](http://www.youtube.com/watch?v=bDuJI2K7Gj0 "EventCheck Demo")

Youtube Demo: https://youtu.be/bDuJI2K7Gj0


(i) Project Description

EventCheck is an iOS mobile application that allows college students to create and attend safe and secure events during COVID-19. This application attempts to solve potential problems that may arise if college students return to campus in the spring. By requiring health and safety checks before students can attend events, EventCheck relates to Public Health and Innovation, as it minimizes the health risks students may pose on themselves and others.

EventCheck was created on XCode with Swift as an iOS Application project. We used Parse Backend to store and retrieve the event information. We also incorporated Google Firebase’s ML Vision Edge Object Labeling model and Google’s ML Kit Text Recognition model to verify that students were wearing masks and had healthy thermometer readings from images taken on a live iPhone camera. 


(ii) Purpose

Across the nation’s colleges, campuses have been shutting down, as a result of COVID-19 outbreaks amongst college students. While social events can be the cause of these outbreaks, they do not have to be. If proper health and safety procedures are practiced by event attendees, these events can be a great way for students to feel less isolated during this stressful and unprecedented time. By providing college students with safe spaces to interact with each other through EventCheck, we hope to help students feel connected, supported, and relaxed in their time outside of class. In the future, we hope EventCheck can be effectively incorporated into the Claremont Colleges’ social scene if students return to campus during the COVID-19 pandemic.

(iii) How it works

This application provides users with a host of features in order to create and attend events safely during the COVID-19 pandemic. On the Home tab, students have the option of creating their own social events, complete with all of the essential details. These events appear on the Events Feed, so students can register before the event safety capacity is full. The events the student is registered for are displayed in the My Registered Events tab. To ensure registered students are not risking the health of other attendees, 30 minutes before the event, EventCheck allows students to complete a short check-in process. 

The first phase is verifying the student does not have any symptoms of COVID-19. Following this step, the user must confirm they are wearing a mask to the event, verified by a machine learning object labeling model. After this check, the student must take a picture of their thermometer, so EventCheck can use both a machine learning object labeling and text recognition models to confirm that the user’s thermometer temperature reading is within a healthy range. Once all steps of the check-in process have been completed, the user is able to see the location of the event and safely attend. 

