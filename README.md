# Xplore - Find-Events-near-you

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app helps you find events and places near you in your chosen radius.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social Networking
- **Mobile:** This app would be primarily developed for mobile.
- **Story:**
- **Market:** Any individual over 16 could choose to use this app.
- **Habit:** This app could be used as often or unoften as the user wanted
- **Scope:**

## Product Spec

### 1. Business Problem and User Base
Helping users explore their community an events near them and anyone who loves to explore their surrounding while destressing from their busy lives.


### 2. Description
This app will help people in a community explore and connect with other people near them. 


### 3. User Stories

**Required User Stories**

- [x] User can create a new account
- [x] User will be able to login
- [x] User will be able to post a picture

Link to GIF : https://imgur.com/ZwwH0Fo.gif 


- [X] User can like a photo
- [X] User can leave a comment on a photo
- [X] User can remove the like.

Link to GIF : https://imgur.com/hkgYgTv.gif


<img src="https://imgur.com/hkgYgTv.gif" width=400>





 - [X] implementation of Events button on feed page. Pressing this button will take you to events page.
   
      #### LINK TO gif : https://imgur.com/nER4mKT.gif  ####
 <img src="https://imgur.com/nER4mKT.gif " width=100>
   
 - [X]  implementation of Account button on feed page. Pressing this button will take you to account page.

   #### LINK TO gif : https://imgur.com/THnlSi4.gif  ####
 <img src="https://imgur.com/THnlSi4.gif " width=100>
 
 
 - [X] Final Presentation  https://drive.google.com/file/d/13BkUTChyn8qPBzrHcFNqdvFWIJXqauoj/view

**Optional User Stories**

* User will be able to post a story that stays for 24 hours
* User is notified when their photo is liked or they are followed
* User should be able to choose the category of the event they want to attend


### 2. Screen Archetypes

* Welcome
* Register
* Login
* Stream
* Creation
* Profile
* Settings

### 3. Navigation

**Flow Navigation** (Screen to Screen)

<img src="https://imgur.com/IKgkJFr.gif" width=400>

<!-- * [If you use Flow Navigation, delete the Tab Navigation Section. Include the screens the user will can see in order. 
* (Examples) 
    * Login
        * Home, Profile, Settings
            * (within settings) you have the option to delet  -->

## Wireframes

<img src="https://imgur.com/g3m5i0N.gif" width=500>


## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | login         | JSON Object   | user can log in to their account |
   | register      | JSON Object   | user can create an account |
   | username      | String   | unique user name created by the user |
   | email         | String   | users email provided when creating the account |
   | image         | File     | image that user posts |
   | caption       | String   | image caption by author |
   | commentsCount | Number   | number of comments that has been posted to an image |
   | likesCount    | Number   | number of likes for the post |
   | image         | File     | image of the recommended place |
   | name          | String   | name of the recommended place under the image |

### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) User gets the feed of posts/statuses here
      - (Create/POST) Create a new like on a post
      - (Create/POST) Create a new comment on a post
      - (Create/POST) Create a new 24-Hour Story
      - (Delete) Delete existing like
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post/status object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image and update profile settings 
<!-- *  [Add list of network requests by screen ] 
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp] -->
