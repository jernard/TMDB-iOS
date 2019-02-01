# Readme
## Requirements
### Goals
- Request movie/series API from this webpage: [Link](https://developers.themoviedb.org/4/getting-started/authorization)
- The app must have three movie/series categories: **Popular, Top Rated, UpComing.**
- Anyone movie/series must have a detail view.
- The App must work on/offline by cache.
- The app must have offline search by category.

### Extras

- Play video in detail view.
- Animations, transitions, UI/UX.
- Online search.
- Unit test.

### User Stories

| Item  | Story |
| ------------- | ------------- |
| 1  | As a user I want to separate popular, top rated and upcoming content  |
| 2  | As a user I want to search by title movies  |
| 3  | As a user I want to see movie overview  |
| 4  | As a user I want to play videos  |
| 5  | As a user I want to see the catalog even in offline mode  |
| 6  | As a user I want to search titles even in offline  |

### AppMap
![App Map](https://github.com/jernard/TMDB-iOS/images/AppMap.png)

#### Popular

![Popular](https://github.com/jernard/TMDB-iOS/images/popularView.png)

#### Top Rated

![Top Rated](https://github.com/jernard/TMDB-iOS/images/topratedView.png)

#### Upcoming

![Upcoming](https://github.com/jernard/TMDB-iOS/images/upcomingView.png)

#### Detail

![Detail](https://github.com/jernard/TMDB-iOS/images/detailView.png)

#### Search Bard

![Detail](https://github.com/jernard/TMDB-iOS/images/searchBar.png)

## Architecture

This app is build in **VIPER** architecture. VIPER is a clean architecture to iOS apps. This makes it easier to isolate dependencies and test the interactions at the boundaries between layers. Additionally, it facilitate improve and add features process in the future.

The app use **Alamofire**, **AlamofireObjectMapper** and **AlamofireImage** Cocoapods Libraries to manage API request and cache, **PKHUD** for animations and **collection-view-layouts** to staggered layout.

The app request to TMDB API first time and save in cache data. For this reason, the second time that app is launched will load quickly.

### Views

### UI

It's conformed by 3 files. *Main.storyboard* contains app flow and defines UI elements like navigations bar, tab bar, collectionsViews, etc. *LaunchScreen.storyboard* is the initial view. It appears when app is launching. *ListItemCell.swift* is a reusable cell whose works as a template to dynamic number of cells in a single collectionView.

- Main.storyboard

- LaunchScreen.storyboard

- ListItemCell.swift

### ViewControllers

Strictly there are 4 views: **popular, top rated, upcoming** and **detail**. But, three first are the same with different content. So, *ListViewController.swift* are the template for each one of there. The class set the layout, create, sort and filter cells, present alerts and push and it has the responsibility of pay attention of user interactions as a "clic" in a cell to present de movie detail.

*DetailViewController.swift* just push the movie data in the labels and UIImage.

- ListViewController.swift

- DetailViewController.swift

### Interactors

The interactor class has the responsibility of manipulate obtained information of Network service. In this case.

- ListInteractor.swift

### Presenters

The presenters have the responsibility to determinate how data will be display in the view. In this case there are 3 instance of *ListViewController* class, so they determinate corresponding to each instance.

*DetailPresenter* receive data from the router and delivered it to *DetailViewController* instance.

- ListPresenter.swift

- DetailPresenter.swift

### Router

The routers listens from the presenter about which screen to present and executes that. In other words, *ListRouter* present *DetailView* and *DetailRouter* return to *ListView*.

- ListRouter.swift

- DetailRouter.swift

### Entities

*ListItemModel* is the object of each movie/series. It will be instanced in the APIClient class.
*genre* is an object whose propose is determinate genre name of the *genre_id* obtained in API request.

- ListItemModel.swift
- genre.swift

### Network

*APIEndpoints* is a singleton whose propose is build request url. Url is builded depending on category. The *APIClient* is the manager of the API service. It brings the genres, modifies objects and delivers the object array to the *Interactor*

- APIEndpoints.swift
- APIClient.swift


## Questions

### Unique responsibility principle

Is a programming principle that states every class, function, method, module should have only one "reason to change". In other words, it should have only one reason to exist or propose. Unique responsibility principle is part of SOLID principles of OOP paradigm. As a principle of SOLID, unique responsibility principle propose is make easy to develop, maintain, standardize, extend a software and are part of agile software development.

### Clean code

Code can be called *clean code* when it meets with best practices. This means that code should be easy to understand and easy to change. In other words, every developer should understand the execution flow, role and responsibility of each class, what each method does, classes and methods works as expected and is easy to test.
