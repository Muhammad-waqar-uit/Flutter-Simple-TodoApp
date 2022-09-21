# todoapp

A simple todo App that can create task, market complete and delete the task when you want!

## Running Procedure
- Clone the repo using `git clone url`
- then you `flutter pub get`
- last `flutter run`

## Requirements from pub.dev
- Flutter sideable : slide animation to delete Any task
- hive for storage : using internal storge as Database
- Hive flutter
- Flutter launcher icons : for creating custom icons for both platforms.
- build runner : for hive 
- hive generator : for hive
<br/>
<h1>AppScreens</h1>
<div class="grid container">
    <figure><img src="screens/image1.jpeg" alt="delete"></figure>
    <figure><img src="screens/image2.jpeg" alt="AppScreen"></figure>
    <figure><img src="screens/image3.jpeg" alt="AddTask"></figure>
    <figure><img src="screens/image4.jpeg" alt="Marked Done"></figure>
  </div>

  <style>
    figure {
  overflow: hidden;
  border-radius: 9px;
}

img {
  display: block;
  width: 100%;
  transition: scale 0.4s ease;
}

img:hover {
  scale: 1.1;
}

.container {
  width: min(800px, 100% - 2rem);
  margin: 5rem auto;
}

.grid {
  display: grid;
  gap: 1rem;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 1fr;
}
  </style>
