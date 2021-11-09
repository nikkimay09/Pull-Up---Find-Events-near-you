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
- **Category:**
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**

## Product Spec

### 1. Business Problem and User Base
Helping users explore their community an events near them and anyone who loves to explore their surrounding while destressing from their busy lives.


### 2. Description
This app will help people in a community explore and connect with other people near them. 


### 3. User Stories

**Required User Stories**

* User can create a new account
* User will be able to login
* User will be able to post a picture or share a status
* User can choose the preferred radius 
* User should be able to choose the category of the event they want to attend
* User can follow and look up other people
* User is notified when their photo is liked or they are followed
* User can like a photo

**Optional User Stories**

* User will be able to post a story that stays for 24 hours
* User can leave a comment on a photo
* User is notified when their photo is liked or they are followed


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
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
#### List of network requests by screen
   - Home Feed Screen
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]


## Schema 
### Models
### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| image author |
   | image         | File     | image that user posts |
   | caption       | String   | image caption by author |
   | commentsCount | Number   | number of comments that has been posted to an image |
   | likesCount    | Number   | number of likes for the post |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
